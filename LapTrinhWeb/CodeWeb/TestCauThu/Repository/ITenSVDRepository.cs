using TestCauThu.Models;
namespace TestCauThu.Repository
{
	public interface ITenSVDRepository
	{
		Sanvandong Add(Sanvandong tenSVD);

		Sanvandong Update(Sanvandong tenSVD);

		Sanvandong Delete(String maSVD);

		Sanvandong GetSanvandong(String maSVD);

		IEnumerable<Sanvandong> GetAlltenSVD();

	}
}
