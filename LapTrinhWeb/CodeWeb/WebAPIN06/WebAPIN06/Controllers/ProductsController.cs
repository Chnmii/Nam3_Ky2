using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebAPIN06.Models;
using WebN06.Models.ProductModels;

namespace WebAPIN06.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsController : ControllerBase
    {
        QlbanVaLiContext db = new QlbanVaLiContext();
        [HttpGet]
        public IEnumerable<Product> GetAllProducts()
        {
            var sanpham = (from a in db.TDanhMucSps
                           select new Product()
                           {
                               MaSp = a.MaSp,
                               TenSp = a.TenSp,
                               MaLoai = a.MaLoai,
                               AnhDaiDien = a.AnhDaiDien,
                               GiaNhoNhat = a.GiaNhoNhat,
                           }).ToList();
            return sanpham;
        }
        [HttpGet("{maLoai}")]
        public IEnumerable<Product> GetProductsByCategory(string maLoai)
        {
            var sanpham = (from a in db.TDanhMucSps
                           where a.MaLoai == maLoai
                           select new Product()
                           {
                               MaSp = a.MaSp,
                               TenSp = a.TenSp,
                               MaLoai = a.MaLoai,
                               AnhDaiDien = a.AnhDaiDien,
                               GiaNhoNhat = a.GiaNhoNhat,
                           }).ToList();
            return sanpham;
        }

        [Route("Themsanpham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(TDanhMucSp sanpham)
        {
            if (ModelState.IsValid)
            {
                db.TDanhMucSps.Add(sanpham);
                db.SaveChanges();
                return RedirectToAction("Danhmucsanpham");
            }
            return ;
        }
    }
}
