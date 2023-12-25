using Microsoft.AspNetCore.Mvc;
using TestToolShop.Repository;

namespace TestToolShop.ViewComponents
{
    public class CauLacBoMenuViewComponent : ViewComponent
    {
        private readonly ICauLacBoRepository _tenCLB;
        public CauLacBoMenuViewComponent(ICauLacBoRepository loaiSpRepository)
        {
            _tenCLB = loaiSpRepository;
        }
        public IViewComponentResult Invoke()
        {
            var AllLoaiSp = _tenCLB.GetAlltenCLB().OrderBy(x => x.TenClb);
            return View(AllLoaiSp);
        }

    }
}
