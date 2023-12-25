using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TestLimula.Models;
using TestLimula.ViewModels;

namespace TestLimula.Controllers
{
	public class HomeController : Controller
	{
		QlbanHangQuanAoContext csdl = new QlbanHangQuanAoContext();
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

        public IActionResult ProductDetail(String masp)
        {
            var sanpham = csdl.SanPhams.SingleOrDefault(x => x.MaSanPham == masp);
            
            var homeProductDetail = new ProductDetailViewModel
            {
                sanpham = sanpham
                
            };
            return View(homeProductDetail);
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