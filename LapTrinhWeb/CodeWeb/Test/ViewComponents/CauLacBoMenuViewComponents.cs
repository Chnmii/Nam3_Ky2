using Microsoft.AspNetCore.Mvc;
using Test.Respository;

namespace Test.ViewComponents
{
	public class CauLacBoMenuViewComponent : ViewComponent
	{
		private readonly ICauLacBoRespository _tenCLB;
		public CauLacBoMenuViewComponent(ICauLacBoRespository tenCLBRepository)
		{
			_tenCLB = tenCLBRepository;
		}
		public IViewComponentResult Invoke()
		{
			var AllClb = _tenCLB.GetAllTenCLB().OrderBy(x => x.TenClb);
			return View(AllClb);
		}
	}

}
