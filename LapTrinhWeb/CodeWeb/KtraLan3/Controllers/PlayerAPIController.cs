using KtraLan3.Models;
using KtraLan3.Models.PlayerModels;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace KtraLan3.Controllers
{
	[Route("api/[controller]")]
	[ApiController]
	public class PlayerAPIController : ControllerBase
	{
        QlbongDaContext csdl = new QlbongDaContext();
        [HttpGet]

        public IEnumerable<Player> GetAllProduct()
        {
            var sanpham = (from p in csdl.Cauthus
                           select new Player
                           {
                               CauLacBoId = p.CauLacBoId,
                               CauThuId = p.CauThuId,
                               HoVaTen = p.HoVaTen,
                               Ngaysinh = p.Ngaysinh,
                               QuocTich = p.QuocTich,
                               ViTri = p.ViTri
                           }).ToList();
            return sanpham;
        }

        [HttpGet("{TranDauID}")]
        public IEnumerable<Cauthu> GetCauThuTheoTran(string tranDauId)
        {
            var trandauCauThus = (from tdct in csdl.TrandauCauthus
                                  join ct in csdl.Cauthus on tdct.CauThuId equals ct.CauThuId
                                  where tdct.TranDauId == tranDauId
                                  select new Cauthu
                                  {
                                      CauThuId = ct.CauThuId,
                                      HoVaTen = ct.HoVaTen,
                                      Ngaysinh = ct.Ngaysinh,

                                      // các thuộc tính khác của đối tượng CauThu
                                  }).ToList();
            return trandauCauThus;
        }



    }
}
