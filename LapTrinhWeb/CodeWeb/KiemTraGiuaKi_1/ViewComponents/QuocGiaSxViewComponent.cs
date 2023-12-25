using KiemTraGiuaKi_1.Models;
using KiemTraGiuaKi_1.Repository;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace KiemTraGiuaKi_1.ViewComponents
{
    public class QuocGiaSxViewComponent : ViewComponent
    {
        private readonly IQuocGiaSx quocGiaSx;
        public QuocGiaSxViewComponent(IQuocGiaSx quocGiaSxRepository)
        {
            quocGiaSx = quocGiaSxRepository;
        }
        public IViewComponentResult Invoke()
        {
            var qGiaSx = quocGiaSx.GetALLQuocGiaSx().OrderBy(x => x.TenNuoc);
            return View(qGiaSx);
        }
    }

}
}
