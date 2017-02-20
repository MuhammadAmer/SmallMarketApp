using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SmallMarketTask.Models;

namespace SmallMarketTask.Controllers
{
    public class CustomersSuppliersController : Controller
    {
       // Get: customer/supplier type 
        public JsonResult SupplierCustomerType() 
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
           var CustomersSuppliersType= db.CustomerSuppliertypes.ToList();
            return Json(CustomersSuppliersType,JsonRequestBehavior.AllowGet);
        }

        // Get: All Customers
        public JsonResult AllCustomersSuppliers()
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var customerssuppliersList = from pr in db.CustomersSuppliers

                        join ty in db.CustomerSuppliertypes
                        on pr.TypeId equals ty.Id
                        select new
                        {
                            pr.Id,
                            pr.Name,
                            pr.Phone,
                            pr.TypeId,
                            pr.DiscountPurchasing,
                            pr.DiscountSelling,
                            TypeName = ty.Name
                            
                        };
            return Json(customerssuppliersList, JsonRequestBehavior.AllowGet);

        }


        // save function which can update or add customer/supplier 
        [HttpPost]
        public JsonResult Save(CustomersSupplier customersupplier)
        {

            SmallMarketDBEntities db = new SmallMarketDBEntities();

            if (customersupplier.Id > 0)
            {

                var dbcussup = db.CustomersSuppliers.FirstOrDefault(x => x.Id == customersupplier.Id);
                dbcussup.Name = customersupplier.Name;
                dbcussup.Phone = customersupplier.Phone;
                dbcussup.TypeId = customersupplier.TypeId;
                dbcussup.DiscountPurchasing = customersupplier.DiscountPurchasing;
                dbcussup.DiscountSelling = customersupplier.DiscountSelling;
                db.SaveChanges();
                return Json(dbcussup, JsonRequestBehavior.AllowGet);
            }
            else
            db.CustomersSuppliers.Add(customersupplier);
            db.SaveChanges();
            return Json(customersupplier, JsonRequestBehavior.AllowGet);
            {

            }
        }


        // function to add customer/supplier
        [HttpGet]
        public JsonResult NewCusSup()
        {

            return Json(new CustomersSupplier(), JsonRequestBehavior.AllowGet);
        }
    }
}
