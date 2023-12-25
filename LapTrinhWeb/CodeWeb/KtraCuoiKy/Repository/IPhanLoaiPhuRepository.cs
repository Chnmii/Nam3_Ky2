using KtraCuoiKy.Models;
namespace KtraCuoiKy.Repository
{
    public interface IPhanLoaiPhuRepository
    {
        PhanLoaiPhu Add(PhanLoaiPhu loaiSp);

        PhanLoaiPhu Update(PhanLoaiPhu loaiSp);

        PhanLoaiPhu Delete(String maloaiSp);

        PhanLoaiPhu GePhanLoaiPhu(String maloaiSp);

        IEnumerable<PhanLoaiPhu> GetAllLoaiSp();

    }
}
