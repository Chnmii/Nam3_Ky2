using Azure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TestCauThu.Models;
using TestCauThu.ViewModels;
using X.PagedList;

namespace TestCauThu.Controllers
{
    public class HomeController : Controller
    {
        QlbongDaContext db = new QlbongDaContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(int? page)
        {
			// so luong san pham trong 1 trang
			int pageSize = 6;
			// so luong trang
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var listCauThu = db.Cauthus.Where(x => x.ViTri == "DF").OrderBy(x => x.HoVaTen);
			// phan trang
			PagedList<Cauthu> list = new PagedList<Cauthu>(listCauThu, pageNumber, pageSize);
			return View(list);

		}

		public IActionResult CauThuTheoSVD(string TenSVD, int? page)
		{
			// home/SanPhamTheoLoai?maloai=vali (tui, balo...) 
			int pageNumber = page == null || page < 1 ? 1 : page.Value;
			int pageSize = 8;
			var lstsanpham = db.Sanvandongs.Where(x => x.TenSan == TenSVD).OrderBy(x => x.TenSan);
			PagedList<Sanvandong> lst = new PagedList<Sanvandong>(lstsanpham, pageNumber, pageSize);
			ViewBag.maSVD = TenSVD;
			return View(lst);
		}


		public IActionResult PlayerDetail(String maCauThu)
		{
			var cauthu = db.Cauthus.SingleOrDefault(x => x.CauThuId == maCauThu);			
			var playerDetail = new PlayerDetail
			{
				cauthu = cauthu				
			};
			return View(playerDetail);
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