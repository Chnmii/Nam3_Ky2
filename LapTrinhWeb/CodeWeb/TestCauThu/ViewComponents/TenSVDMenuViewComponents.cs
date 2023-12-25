using Microsoft.AspNetCore.Mvc;
using TestCauThu.Repository;

namespace TestCauThu.ViewComponents
{
	public class TenSVDMenuViewComponent : ViewComponent
	{
		private readonly ITenSVDRepository _tenSVD;
		public TenSVDMenuViewComponent(ITenSVDRepository tenSVDRepository)
		{
			_tenSVD = tenSVDRepository;
		}
		public IViewComponentResult Invoke()
		{
			var AlltenSVD = _tenSVD.GetAlltenSVD().OrderBy(x => x.TenSan);
			return View(AlltenSVD);
		}

	}
}
