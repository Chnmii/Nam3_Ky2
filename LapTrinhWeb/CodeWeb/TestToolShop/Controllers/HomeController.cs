using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TestToolShop.Models;
using X.PagedList;

namespace TestToolShop.Controllers
{
	public class HomeController : Controller
	{
		QlbongDaContext db = new QlbongDaContext();
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

        public IActionResult Index(int? page)
        {
            // so luong san pham trong 1 trang
            int pageSize = 4;
            // so luong trang
            int pageNumber = page == null || page < 0 ? 1 : page.Value;
            var listSanpham = db.Cauthus.Where(x => x.ViTri == "DF").OrderBy(x => x.HoVaTen);
            // phan trang
            PagedList<Cauthu> list = new PagedList<Cauthu>(listSanpham, pageNumber, pageSize);
            return View(list);
        }


        public IActionResult Privacy()
		{
			return View();
		}

		[ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}