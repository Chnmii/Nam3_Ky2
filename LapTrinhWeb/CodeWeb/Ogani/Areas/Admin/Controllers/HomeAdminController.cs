using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Ogani.Models;
using X.PagedList;

namespace Ogani.Areas.Admin.Controllers
{
    [Area("admin")]
    [Route("admin")]
    [Route("admin/homeadmin")]
    public class HomeAdminController : Controller
    {      
        QlbanVaLiContext csdl = new QlbanVaLiContext();
        [Route("")]
        [Route("index")]
        public IActionResult Index()
        {
            
            return View();
        }

        [Route("danhmucsanpham")]
        public IActionResult DanhMucSanPham(int? page)
        {
            //Số đối tượng hiển thị tối đa trên 1 trang
            int pageSize = 12;
            //Số trang hiện tại đang truy cập
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            //Khởi tạo 1 danh sách tự do
            var ds_san_pham = csdl.TDanhMucSps.AsNoTracking().OrderBy(x => x.TenSp);
            PagedList<TDanhMucSp> paged_ds_san_pham = new PagedList<TDanhMucSp>(ds_san_pham, pageNumber, pageSize);
            //Khai báo 1 paged danh sách 
            return View(paged_ds_san_pham);
        }

        [Route("Themsanpham")]
        [HttpGet]
        public IActionResult ThemSanPhamMoi()
        {
            ViewBag.MaChatLieu = new SelectList(csdl.TChatLieus.ToList(), "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(csdl.THangSxes.ToList(), "MaHangSx", "HangSx");
            ViewBag.MaNuocSx = new SelectList(csdl.TQuocGia.ToList(), "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(csdl.TLoaiSps.ToList(), "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(csdl.TLoaiDts.ToList(), "MaDt", "TenLoai");
            return View();
        }

        [Route("Themsanpham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult ThemSanPhamMoi(TDanhMucSp sanpham)
        {
            if (ModelState.IsValid)
            {
                csdl.TDanhMucSps.Add(sanpham);
                csdl.SaveChanges();
                return RedirectToAction("Danhmucsanpham");
            }
            return View(sanpham);
        }

        [Route("SuaSanPham")]
        [HttpGet]
        public IActionResult SuaSanPham(string maSp)
        {
            ViewBag.MaChatLieu = new SelectList(csdl.TChatLieus.ToList(), "MaChatLieu", "ChatLieu");
            ViewBag.MaHangSx = new SelectList(csdl.THangSxes.ToList(), "MaHangSx", "HangSx");
            ViewBag.MaNuocSx = new SelectList(csdl.TQuocGia.ToList(), "MaNuoc", "TenNuoc");
            ViewBag.MaLoai = new SelectList(csdl.TLoaiSps.ToList(), "MaLoai", "Loai");
            ViewBag.MaDt = new SelectList(csdl.TLoaiDts.ToList(), "MaDt", "TenLoai");
            var sanpham = csdl.TDanhMucSps.Find(maSp);
            return View(sanpham);
        }

        [Route("SuaSanPham")]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult SuaSanPham(TDanhMucSp sanpham)
        {
            if (ModelState.IsValid)
            {
                csdl.Update(sanpham);
                /*csdl.Entry(sanpham).State = EntityState.Modified;*/
                csdl.SaveChanges();
                return RedirectToAction("Danhmucsanpham", "HomeAdmin");
            }
            return View(sanpham);
        }

        [Route("XoaSanPham")]
        [HttpGet]
        public IActionResult XoaSanPham(string maSp)
        {
            TempData["Message"] = "";
            var chiTietSp = csdl.TChiTietSanPhams.Where(x => x.MaSp==maSp).ToList();
            if (chiTietSp.Count() > 0)
            {
                TempData["Message"] = "Không xoá được sản phẩm này";
                return RedirectToAction("Danhmucsanpham", "HomeAdmin");
            }
            var anhSp = csdl.TAnhSps.Where(x => x.MaSp == maSp);
            if(anhSp.Any()) csdl.RemoveRange(anhSp);
            csdl.Remove(csdl.TDanhMucSps.Find(maSp));
            csdl.SaveChanges();
            TempData["Message"] = "Đã xoá sản phẩm thành công";
            return RedirectToAction("Danhmucsanpham", "HomeAdmin");

        }
    }
}
