using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SmallMarketTask.Models;


namespace SmallMarketTask.Controllers
{
    public class InvoicesController : Controller
    {
        //
      //GET: All Items

        public JsonResult AllItems() 
        {
            
          List<Item> items = new List<Item>();
          using (SmallMarketDBEntities db = new SmallMarketDBEntities())
          {
              items = db.Items.OrderBy(a=>a.Name).ToList();
          }
          return Json(items,JsonRequestBehavior.AllowGet);
        }

        //GET: All Customers and suppliers
        public JsonResult CustomersSuppliers()
        {

            List<CustomersSupplier> CustomersSuppliers = new List<CustomersSupplier>();
            using (SmallMarketDBEntities db = new SmallMarketDBEntities())
            {
                CustomersSuppliers = db.CustomersSuppliers.OrderBy(a => a.Name).ToList();
            }
            return Json(CustomersSuppliers, JsonRequestBehavior.AllowGet);
        }


 

        [HttpPost]
        public JsonResult SaveOrder(PurchaseSellInvoice item)
        {
            bool status = false;
            DateTime dateOrg;
            var isValidDate = DateTime.TryParseExact(item.DateString, "mm-dd-yyyy", null, System.Globalization.DateTimeStyles.None, out dateOrg);
            if (isValidDate)
            {
                item.Date = dateOrg;
            }
            var isValidModel = TryUpdateModel(item);
            if (isValidModel)
            {
                using (SmallMarketDBEntities dc = new SmallMarketDBEntities())
                {
                    dc.PurchaseSellInvoices.Add(item);
                    dc.SaveChanges();
                    status = true;
                }
            }
            return new JsonResult { Data = new { status = status } };
        }

        

       
    }
}
