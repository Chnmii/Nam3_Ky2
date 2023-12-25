using TestToolShop.Models;

namespace TestToolShop.Repository
{
    public class CauLacBoRepository : ICauLacBoRepository
    {
        private readonly QlbongDaContext _context;

        public CauLacBoRepository(QlbongDaContext context)
        {
            _context = context;
        }

        public Caulacbo Add(Caulacbo tenCLB)
        {
            _context.Caulacbos.Add(tenCLB);
            _context.SaveChanges();
            return tenCLB;

        }

        public Caulacbo Delete(string matenCLB)
        {
            throw new NotImplementedException();
        }

        public Caulacbo GeCaulacbo(string matenCLB)
        {
            return _context.Caulacbos.Find(matenCLB);
        }

        public IEnumerable<Caulacbo> GetAlltenCLB()
        {
            return _context.Caulacbos.Take(7);
        }

        public Caulacbo Update(Caulacbo tenCLB)
        {
            _context.Update(tenCLB);
            _context.SaveChanges();
            return tenCLB;

        }
    }
}
