using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ogani.Models;
using Ogani.ViewModels;
using System.Diagnostics;
using Test.Models.Authentication;
using X.PagedList;

namespace Ogani.Controllers
{
    public class HomeController : Controller
    {
        QlbanVaLiContext csdl = new QlbanVaLiContext();
        private readonly ILogger<HomeController> _logger;
        
        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        /*public IActionResult Index()
        {
            var lstSanpham = csdl.TDanhMucSps.ToList();
            return View(lstSanpham);
        }*/

        /*[Authentication]*/
        public IActionResult Index(int? page)
        {
            //Số đối tượng hiển thị tối đa trên 1 trang
            int pageSize = 8;
            //Số trang hiện tại đang truy cập
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            //Khởi tạo 1 danh sách tự do
            var ds_san_pham = csdl.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> paged_ds_san_pham = new PagedList<TDanhMucSp>(ds_san_pham, pageNumber, pageSize);
            //Khai báo 1 paged danh sách 
            return View(paged_ds_san_pham);
        }

        public IActionResult SanPhamTheoLoai(string MaLoai, int? page)
        {
            // home/SanPhamTheoLoai?maloai=vali (tui, balo...) 
            int pageNumber = page == null || page < 1 ? 1 : page.Value;
            int pageSize = 8;
            var lstsanpham = csdl.TDanhMucSps.Where(x => x.MaLoai == MaLoai).OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> lst = new PagedList<TDanhMucSp>(lstsanpham, pageNumber, pageSize);
            ViewBag.maloai = MaLoai;
            return View(lst);
        }

        public IActionResult ChiTietSanPham(String masp)
        {
            var sanpham = csdl.TDanhMucSps.SingleOrDefault(x => x.MaSp == masp);
            var anhsanpham = csdl.TAnhSps.Where(x => x.MaSp == masp).ToList();
            ViewBag.anhsanpham = anhsanpham;//Để chuyển sang
            return View(sanpham);
        }

        public IActionResult ProductDetail(String masp)
        {
            var sanpham = csdl.TDanhMucSps.SingleOrDefault(x => x.MaSp == masp);
            var anhsanpham = csdl.TAnhSps.Where(x => x.MaSp == masp).ToList();
            var homeProductDetail = new HomeProductDetailViewModel
            {
                danhMucSp = sanpham,
                anhSps = anhsanpham
            };
            return View(homeProductDetail);
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