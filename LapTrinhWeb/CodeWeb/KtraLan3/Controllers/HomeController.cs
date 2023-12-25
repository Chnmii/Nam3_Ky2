using KtraLan3.Models;
using KtraLan3.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using X.PagedList;

namespace KtraLan3.Controllers
{
    public class HomeController : Controller
    {
        QlbongDaContext csdl = new QlbongDaContext();
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
            var lstCauthu = csdl.Cauthus.Where(x => x.ViTri == "DF").OrderBy(x => x.HoVaTen);
            // phan trang
            PagedList<Cauthu> list = new PagedList<Cauthu>(lstCauthu, pageNumber, pageSize);
            return View(list);
        }

		public IActionResult ProductDetail(String cauthuid)
		{
			var sanpham = csdl.Cauthus.SingleOrDefault(x => x.CauLacBoId == cauthuid);

            var homeProductDetail = new HomePLayerDetailViewModel
            {
                cauthu = sanpham
            };
            return View(sanpham);
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