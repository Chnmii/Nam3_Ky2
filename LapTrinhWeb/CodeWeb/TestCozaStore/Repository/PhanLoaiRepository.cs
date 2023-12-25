using TestCozaStore.Models;

namespace TestCozaStore.Repository
{
	public class PhanLoaiRepository : IPhanLoaiRepository
	{
		private readonly QlbanChauCanhContext _context;

		public PhanLoaiRepository(QlbanChauCanhContext context)
		{
			_context = context;
		}

		public PhanLoai Add(PhanLoai phanloai)
		{
			_context.PhanLoais.Add(phanloai);
			_context.SaveChanges();
			return phanloai;

		}

		public PhanLoai Delete(string maphanloai)
		{
			throw new NotImplementedException();
		}

		public PhanLoai GePhanLoai(string maphanloai)
		{
			return _context.PhanLoais.Find(maphanloai);
		}

		public IEnumerable<PhanLoai> GetAllphanloai()
		{
			return _context.PhanLoais;
		}

		public PhanLoai Update(PhanLoai phanloai)
		{
			_context.Update(phanloai);
			_context.SaveChanges();
			return phanloai;

		}
	}
}
