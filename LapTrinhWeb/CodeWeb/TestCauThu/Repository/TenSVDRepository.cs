using TestCauThu.Models;

namespace TestCauThu.Repository
{
	public class TenSVDRepository : ITenSVDRepository
	{
		private readonly QlbongDaContext _context;

		public TenSVDRepository(QlbongDaContext context)
		{
			_context = context;
		}

		public Sanvandong Add(Sanvandong tenSVD)
		{
			_context.Sanvandongs.Add(tenSVD);
			_context.SaveChanges();
			return tenSVD;

		}

		public Sanvandong Delete(string maSVD)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<Sanvandong> GetAlltenSVD()
		{
			return _context.Sanvandongs.Take(7);
		}

		public Sanvandong GetSanvandong(string maSVD)
		{
			return _context.Sanvandongs.Find(maSVD);
		}

		public Sanvandong Update(Sanvandong tenSVD)
		{
			_context.Update(tenSVD);
			_context.SaveChanges();
			return tenSVD;


		}
	}
}
