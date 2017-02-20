using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.Web.Mvc;
using SmallMarketTask.Models;
using System.Data.Entity.Migrations;
using System.Data.Entity.Infrastructure;


namespace SmallMarketTask.Controllers
{
    public class ItemsController : Controller
    {

     
        // GET: /Items/
        public JsonResult AllItems()
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var items = from pr in db.Items

                        join ct in db.Categories
                        on pr.CategoryId equals ct.Id
                        join un in db.Units
                        on pr.UnitId equals un.Id
                        select new
                        {
                            pr.Id,
                            pr.Name,
                            pr.UnitId,
                            pr.CategoryId,
                            pr.PurchasePrice,
                            pr.SellPrice,
                            pr.ValidQuantity,
                            UnName = un.Name,
                            CatName = ct.Name
                        };
            return Json(items, JsonRequestBehavior.AllowGet);

        }

        // retrive all units

        public JsonResult GetAllUnits()
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var units = db.Units.ToList();
            return Json(units, JsonRequestBehavior.AllowGet);
        }


        // retrieve all categories
        public JsonResult GetAllCategories()
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var categories = db.Categories.ToList();
            return Json(categories, JsonRequestBehavior.AllowGet);
        }

        // GET: /Item By Id
        public JsonResult GetItemById(string Id)
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var itemId = Convert.ToInt32(Id);
            var getItemId = db.Items.Find(itemId);
            return Json(getItemId, JsonRequestBehavior.AllowGet);

        }

        // save function which can update or add item 
        [HttpPost]
        public JsonResult SaveItem(Item item)
        {

            SmallMarketDBEntities db = new SmallMarketDBEntities();

            if (item.Id > 0)
            {

                var dbitem = db.Items.FirstOrDefault(x => x.Id == item.Id);
                dbitem.Name = item.Name;
                dbitem.CategoryId = item.CategoryId;
                dbitem.PurchasePrice = item.PurchasePrice;
                dbitem.SellPrice = item.SellPrice;
                dbitem.UnitId = item.UnitId;
                dbitem.ValidQuantity = item.ValidQuantity;
                db.SaveChanges();
                return Json(dbitem,JsonRequestBehavior.AllowGet);
            }
            else
            db.Items.Add(item);
            db.SaveChanges();
            return Json(item,JsonRequestBehavior.AllowGet);
            {

            }
        }

        // retrieve new item
        [HttpGet]
        public JsonResult NewItem()
        {
            
            return Json ( new Item(),JsonRequestBehavior.AllowGet);
        }


        // delete item 
        [HttpPost]
        public void DeleteItem(int Id)
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            var item = db.Items.FirstOrDefault(x => x.Id == Id);
            db.Items.Remove(item);
            db.SaveChanges();
        }

        protected override void Dispose(bool disposing)
        {
            SmallMarketDBEntities db = new SmallMarketDBEntities();
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}