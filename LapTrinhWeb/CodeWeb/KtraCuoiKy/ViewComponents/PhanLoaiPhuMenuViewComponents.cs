using KtraCuoiKy.Repository;
using Microsoft.AspNetCore.Mvc;

namespace KtraCuoiKy.ViewComponents
{
    public class PhanLoaiPhuMenuViewComponent : ViewComponent
    {
        private readonly IPhanLoaiPhuRepository _loaiSp;
        public PhanLoaiPhuMenuViewComponent(IPhanLoaiPhuRepository loaiSpRepository)
        {
            _loaiSp = loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var AllLoaiSp = _loaiSp.GetAllLoaiSp().OrderBy(x => x.TenPhanLoaiPhu);
            return View(AllLoaiSp);
        }

    }
}
