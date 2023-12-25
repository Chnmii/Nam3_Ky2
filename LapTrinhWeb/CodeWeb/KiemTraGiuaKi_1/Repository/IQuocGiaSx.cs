using KiemTraGiuaKi_1.Models;
namespace KiemTraGiuaKi_1.Repository
{
    public interface IQuocGiaSx
    {
        TQuocGia Add(TQuocGia quocGia);
        TQuocGia Update(TQuocGia quocGia);
        TQuocGia Delete(String maNuoc);
        TQuocGia GetQuocGia(String maNuoc);
        IEnumerable<TQuocGia> GetALLQuocGiaSx();
    }
}
