using Test.Models;

namespace Test.Respository
{
	public class CauLacBoRepository : ICauLacBoRespository
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

		public Caulacbo Delete(string maCLB)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<Caulacbo> GetAllTenCLB()
		{
			return _context.Caulacbos;
		}

		public Caulacbo GetTenCLB(string maCLB)
		{
			return _context.Caulacbos.Find(maCLB);
		}

		public Caulacbo Update(Caulacbo tenCLB)
		{
			_context.Update(tenCLB);
			_context.SaveChanges();
			return tenCLB;

		}
	}
}
