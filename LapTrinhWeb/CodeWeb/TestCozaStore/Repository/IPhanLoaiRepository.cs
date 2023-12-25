using TestCozaStore.Models;
namespace TestCozaStore.Repository
{
	public interface IPhanLoaiRepository
	{
		PhanLoai Add(PhanLoai phanloai);

		PhanLoai Update(PhanLoai phanloai);

		PhanLoai Delete(String maphanloai);

		PhanLoai GePhanLoai(String maphanloai);

		IEnumerable<PhanLoai> GetAllphanloai();
	}
}
