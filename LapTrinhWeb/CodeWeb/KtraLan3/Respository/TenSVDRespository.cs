using KtraLan3.Models;

namespace KtraLan3.Repository
{
	public class TenSVDRespository : ITenSVDRespository
	{
		private readonly QlbongDaContext _context;

		public TenSVDRespository(QlbongDaContext context)
		{
			_context = context;
		}

		public Sanvandong Add(Sanvandong sanvdId)
		{
			_context.Sanvandongs.Add(sanvdId);
			_context.SaveChanges();
			return sanvdId;

		}

		public Sanvandong Delete(string sanvdId)
		{
			throw new NotImplementedException();
		}

		public IEnumerable<Sanvandong> GetAllSanvdId()
		{
			return _context.Sanvandongs.Take(7);
		}

		public Sanvandong GetSanvdId(string sanvdId)
		{
			return _context.Sanvandongs.Find(sanvdId);
		}

		public Sanvandong Update(Sanvandong sanvdId)
		{
			_context.Update(sanvdId);
			_context.SaveChanges();
			return sanvdId;

		}
	}
}
