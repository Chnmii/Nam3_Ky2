using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace RestAPI.Controller
{
    public class CustomersController : ApiController
    {
        [HttpGet]
        public List<tblKhach> GetCustomerList()
        {
            DBCustomerDataContext dbCustomer = new DBCustomerDataContext();
            return dbCustomer.tblKhaches.ToList();
        }
        [HttpGet]
        public tblKhach GetCustomer(string id)
        {
            DBCustomerDataContext dbCustomer = new
           DBCustomerDataContext();
            return dbCustomer.tblKhaches.FirstOrDefault(x =>
           x.MaKhach == id);
        }
        [HttpPost]
        public bool InsertNewCustomer(string id, string name, string adress, string phoneNumber)
        {
            try
            {
                DBCustomerDataContext dbCustomer = new
               DBCustomerDataContext();
                tblKhach customer = new tblKhach();
                customer.MaKhach = id;
                customer.TenKhach = name;
                customer.DiaChi = adress;
                customer.SoDienThoai = phoneNumber;

                dbCustomer.tblKhaches.InsertOnSubmit(customer);
                dbCustomer.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpPut]
        public bool UpdateCustomer(string id, string name, string adress, string phoneNumber)
        {
            try
            {
                DBCustomerDataContext dbCustomer = new
                DBCustomerDataContext();
                //Lấy mã khách đã có
                tblKhach customer =
                dbCustomer.tblKhaches.FirstOrDefault(x => x.MaKhach == id);
                if (customer == null) return false;
                customer.MaKhach = id;
                customer.TenKhach = name;
                customer.DiaChi = adress;
                customer.SoDienThoai = phoneNumber;
                dbCustomer.SubmitChanges();
                //Xác nhận chỉnh sửa
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpDelete]
        public bool DeleteCustomer(string id)
        {
            try
            {
                DBCustomerDataContext dbCustomer = new
               DBCustomerDataContext();
                //Lấy mã khách đã có
                tblKhach customer =
               dbCustomer.tblKhaches.FirstOrDefault(x => x.MaKhach == id);
                if (customer == null) return false;

                dbCustomer.tblKhaches.DeleteOnSubmit(customer);
                dbCustomer.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }


    }
}
