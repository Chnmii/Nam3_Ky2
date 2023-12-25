using Test.Models;
namespace Test.Respository
{
	public interface ICauLacBoRespository
	{
		Caulacbo Add(Caulacbo tenCLB);

		Caulacbo Update(Caulacbo tenCLB);

		Caulacbo Delete(String maCLB);

		Caulacbo GetTenCLB(String maCLB);

		IEnumerable<Caulacbo> GetAllTenCLB();

	}
}
