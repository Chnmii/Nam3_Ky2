using TestToolShop.Models;
namespace TestToolShop.Repository
{
    public interface ICauLacBoRepository
    {
        Caulacbo Add(Caulacbo tenCLB);

        Caulacbo Update(Caulacbo tenCLB);

        Caulacbo Delete(String matenCLB);

        Caulacbo GeCaulacbo(String matenCLB);

        IEnumerable<Caulacbo> GetAlltenCLB();

    }
}
