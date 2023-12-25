using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Yummy.Models
{
    public class Login
    {
        [DisplayName("Ten nguoi dung: ")]
        public string? userName { get; set; }
        [DataType(DataType.Password)]
        [Display(Name = "Mat khau: ")]
        public string? Password { get; set; }
    }
}
