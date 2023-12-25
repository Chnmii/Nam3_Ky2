using Microsoft.AspNetCore.Mvc;
using TestLimula.Repository;

namespace TestLimula.ViewComponents
{
    public class PhanLoaiMenuViewComponent : ViewComponent
    {
        private readonly IPhanLoaiRepository _phanloai;
        public PhanLoaiMenuViewComponent(IPhanLoaiRepository loaiSpRepository)
        {
            _phanloai = loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var AllLoaiSp = _phanloai.GetAllphanloai().OrderBy(x => x.PhanLoaiChinh);
            return View(AllLoaiSp);
        }

    }
}
