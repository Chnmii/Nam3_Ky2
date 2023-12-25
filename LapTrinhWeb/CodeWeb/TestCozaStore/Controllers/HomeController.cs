using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TestCozaStore.Models;

namespace TestCozaStore.Controllers
{
	public class HomeController : Controller
	{
		QlbanChauCanhContext csdl = new QlbanChauCanhContext();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index()
		{
			var lstsanpham = csdl.SanPhams.ToList();
			return View(lstsanpham);
		}

		public IActionResult SanPhamTheoLoai(string MaLoai)
		{
			var lstsanpham = csdl.SanPhams.Where(x => x.MaPhanLoai == MaLoai).OrderBy(x => x.TenSanPham).ToList();
			return View(lstsanpham);
		}

		public IActionResult ChiTietSanPham(string maSP)
		{
			var lstsanpham = csdl.SanPhams.SingleOrDefault(x => x.MaSanPham == maSP);
			return View(lstsanpham);
		}

		[Route("SuaSanPham")]
		[HttpGet]
		public IActionResult SuaSanPham(string maSp)
		{
			ViewBag.MaPhanLoai = new SelectList(csdl.PhanLoais.ToList(), "MaPhanLoai", "PhanLoaiChinh");
			ViewBag.MaPhanLoaiPhu = new SelectList(csdl.PhanLoaiPhus.ToList(), "MaPhanLoaiPhu", "TenPhanLoaiPhu");
			var sanpham = csdl.SanPhams.Find(maSp);
			return View(sanpham);
		}

		[Route("SuaSanPham")]
		[HttpPost]
		[ValidateAntiForgeryToken]
		public IActionResult SuaSanPham(SanPham sanpham)
		{
			if (ModelState.IsValid)
			{
				//csdl.Update(sanpham);
				csdl.Entry(sanpham).State = EntityState.Modified;
				csdl.SaveChanges();
				return RedirectToAction("Index");
			}
			return View(sanpham);
		}

		[Route("XoaSanPham")]
		[HttpGet]
		public IActionResult XoaSanPham(string maSp)
		{
			TempData["Message"] = "";
			var chiTietSp = csdl.SptheoMaus.Where(x => x.MaSanPham == maSp).ToList();
			if (chiTietSp.Count() > 0)
			{
				TempData["Message"] = "Không xoá được sản phẩm này";
				return RedirectToAction("Index");
			}			
			csdl.Remove(csdl.SanPhams.Find(maSp));
			csdl.SaveChanges();
			TempData["Message"] = "Đã xoá sản phẩm thành công";
			return RedirectToAction("Index");

		}


		public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}