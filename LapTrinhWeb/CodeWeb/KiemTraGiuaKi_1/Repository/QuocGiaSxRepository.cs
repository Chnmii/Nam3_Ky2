using KiemTraGiuaKi_1.Models;

namespace KiemTraGiuaKi_1.Repository
{
    public class QuocGiaSxRepository : IQuocGiaSx
    {
        private readonly QlbanVaLiContext _context;

        public QuocGiaSxRepository(QlbanVaLiContext context)
        {
            _context = context;
        }
        public TQuocGia Add(TQuocGia quocGia)
        {
            _context.TQuocGia.Add(quocGia);
            _context.SaveChanges();
            return quocGia;

        }

        public TQuocGia Delete(string maNuoc)
        {
            throw new NotImplementedException();
        }

        public TQuocGia GetQuocGia(string maNuoc)
        {
            return _context.TQuocGia.Find(maNuoc);
        }


        public TQuocGia Update(TQuocGia quocGia)
        {
            _context.Update(quocGia);
            _context.SaveChanges();
            return quocGia;

        }

        public IEnumerable<TQuocGia> GetALLQuocGiaSx()
        {
            return _context.TQuocGia;
        }
    }
}
