using KtraLan3.Models;

namespace KtraLan3.Repository
{
	public interface ITenSVDRespository
	{
		Sanvandong Add(Sanvandong sanvdId);

		Sanvandong Update(Sanvandong sanvdId);

		Sanvandong Delete(String sanvdId);

		Sanvandong GetSanvdId(String sanvdId);

		IEnumerable<Sanvandong> GetAllSanvdId();

	}
}
