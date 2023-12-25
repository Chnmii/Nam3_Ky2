using KtraLan3.Repository;
using Microsoft.AspNetCore.Mvc;

namespace KtraLan3.ViewComponents
{
	public class TenSVDMenuViewComponent : ViewComponent
	{
		private readonly ITenSVDRespository _sanvdId;
		public TenSVDMenuViewComponent(ITenSVDRespository trandau)
		{
			_sanvdId = trandau;
		}
		public IViewComponentResult Invoke()
		{
			var AllLoaiSp = _sanvdId.GetAllSanvdId().OrderBy(x => x.TenSan);
			return View(AllLoaiSp);
		}

	}
}
