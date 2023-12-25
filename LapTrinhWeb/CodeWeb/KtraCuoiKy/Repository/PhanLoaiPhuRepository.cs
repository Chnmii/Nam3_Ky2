using KtraCuoiKy.Models;

namespace KtraCuoiKy.Repository
{
    public class PhanLoaiPhuRepository : IPhanLoaiPhuRepository
    {
        private readonly QlbanHangMuContext _context;

        public PhanLoaiPhuRepository(QlbanHangMuContext context)
        {
            _context = context;
        }

        public PhanLoaiPhu Add(PhanLoaiPhu loaiSp)
        {
            _context.PhanLoaiPhus.Add(loaiSp);
            _context.SaveChanges();
            return loaiSp;

        }

        public PhanLoaiPhu Delete(string maloaiSp)
        {
            throw new NotImplementedException();
        }

        public PhanLoaiPhu GePhanLoaiPhu(string maloaiSp)
        {
            return _context.PhanLoaiPhus.Find(maloaiSp);
        }

        public IEnumerable<PhanLoaiPhu> GetAllLoaiSp()
        {
            return _context.PhanLoaiPhus;
        }

        public PhanLoaiPhu Update(PhanLoaiPhu loaiSp)
        {
            _context.Update(loaiSp);
            _context.SaveChanges();
            return loaiSp;

        }
    }
}
