using TestLimula.Models;
namespace TestLimula.Repository
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
