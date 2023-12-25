using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using Test.Models;
using X.PagedList;

namespace Test.Controllers
{
    public class HomeController : Controller
    {
        QlbongDaContext csdl = new QlbongDaContext();
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

		public IActionResult Index(int? page)
		{
			// so luong san pham trong 1 trang
			int pageSize = 3;
			// so luong trang
			int pageNumber = page == null || page < 0 ? 1 : page.Value;
			var lstCauThu = csdl.Cauthus.AsNoTracking().OrderBy(x => x.HoVaTen);
			// phan trang
			PagedList<Cauthu> list = new PagedList<Cauthu>(lstCauThu, pageNumber, pageSize);
			return View(list);
		}

        public IActionResult CauThuTheoClb(string maCLB, int? page)
        {
            // home/SanPhamTheoLoai?maloai=vali (tui, balo...) 
            int pageNumber = page == null || page < 1 ? 1 : page.Value;
            int pageSize = 8;
            var lstCauthu = csdl.Cauthus.Where(x => x.CauLacBoId == maCLB).OrderBy(x => x.HoVaTen);
            PagedList<Cauthu> lst = new PagedList<Cauthu>(lstCauthu, pageNumber, pageSize);
            ViewBag.CauLacBoId = maCLB;
            return View(lst);
        }

        [Route("Danhsachcauthu")]
        public IActionResult DanhSachCauThu(int? page)
        {
            //Số đối tượng hiển thị tối đa trên 1 trang
            int pageSize = 8;
            //Số trang hiện tại đang truy cập
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            //Khởi tạo 1 danh sách tự do
            var ds = csdl.Cauthus.AsNoTracking().OrderBy(x => x.HoVaTen);
            PagedList<Cauthu> lst = new PagedList<Cauthu>(ds, pageNumber, pageSize);
            //Khai báo 1 paged danh sách 
            return View(lst);
        }


        [Route("ThemCauThuMoi")]
        [HttpGet]
        public IActionResult ThemCauThuMoi()
        {
            ViewBag.CauLacBoId = new SelectList(csdl.Caulacbos.ToList(), "CauLacBoId", "TenClb");            
            return View();
            
        }

        [Route("ThemCauThuMoi")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemCauThuMoi(Cauthu cauthu)
        {
            csdl.Cauthus.Add(cauthu);
            csdl.SaveChanges();
            return RedirectToAction("Danhsachcauthu");
            /*if (ModelState.IsValid)
            {
                
            }*/
            //return View(cauthu);
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