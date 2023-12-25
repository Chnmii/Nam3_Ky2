using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Test.Models;
using Test.Models.PlayerModels;

namespace Test.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class PlayerAPIController : ControllerBase
	{
		QlbongDaContext csdl = new QlbongDaContext();
		[HttpGet]

		public IEnumerable<Player> GetAllCauThu()
		{
			var cauthu = (from p in csdl.Cauthus
						   select new Player
						   {
							   HoVaTen = p.HoVaTen,
							   Ngaysinh = p.Ngaysinh,
							   ViTri = p.ViTri,
							   QuocTich = p.QuocTich,
							   SoAo = p.SoAo,
							   Anh = p.Anh
						   }).ToList();
			return cauthu;
		}

		[HttpGet("{caulacboid}")]
		public IEnumerable<Player> GetPlayer(string caulacboid)
		{
			var cauthu = (from p in csdl.Cauthus
						   where p.CauLacBoId == caulacboid
                          select new Player
						   {
							   HoVaTen = p.HoVaTen,
							   Ngaysinh = p.Ngaysinh,
							   ViTri = p.ViTri,
							   QuocTich = p.QuocTich,
							   SoAo = p.SoAo,
							   Anh = p.Anh
						   }).ToList();
			return cauthu;
		}


	}
}
