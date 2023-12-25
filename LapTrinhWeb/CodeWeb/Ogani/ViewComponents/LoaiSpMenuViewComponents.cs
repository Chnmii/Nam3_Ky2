using Microsoft.AspNetCore.Mvc;
using Ogani.Repository;

namespace Ogani.ViewComponents
{
    public class LoaiSpMenuViewComponent : ViewComponent
    {
        private readonly ILoaiSpRepository _loaiSp;
        public LoaiSpMenuViewComponent(ILoaiSpRepository loaiSpRepository)
        {
            _loaiSp = loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var AllLoaiSp = _loaiSp.GetAllLoaiSp().OrderBy(x => x.Loai);
            return View(AllLoaiSp);
        }
    }
}

