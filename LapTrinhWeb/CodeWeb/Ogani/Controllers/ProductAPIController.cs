using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Ogani.Models;
using Ogani.Models.ProductModels;

namespace Ogani.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductAPIController : ControllerBase
    {
        QlbanVaLiContext csdl = new QlbanVaLiContext();
        [HttpGet]

        public IEnumerable<Product> GetAllProduct()
        {
            var sanpham = (from p in csdl.TDanhMucSps select new Product
            {
                MaSp = p.MaSp,
                TenSp = p.TenSp,
                MaLoai = p.MaLoai,
                AnhDaiDien = p.AnhDaiDien,
                GiaNhoNhat = p.GiaNhoNhat
            }).ToList();
            return sanpham;
        }

        [HttpGet("{maloai}")]
        public IEnumerable<Product> GetProductsByCategory(string maloai)
        {
            var sanpham = (from p in csdl.TDanhMucSps
                           where p.MaLoai==maloai
                           select new Product
                           {
                               MaSp = p.MaSp,
                               TenSp = p.TenSp,
                               MaLoai = p.MaLoai,
                               AnhDaiDien = p.AnhDaiDien,
                               GiaNhoNhat = p.GiaNhoNhat
                           }).ToList();
            return sanpham;
        }
    }
}
