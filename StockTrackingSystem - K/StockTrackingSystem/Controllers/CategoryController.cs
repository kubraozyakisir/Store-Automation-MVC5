using StockTrackingSystem.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockTrackingSystem.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index()
        {
            var categorylist = db.Category.ToList();
            return View(categorylist);
        }
        [HttpGet]
        public ActionResult CategoryAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CategoryAdd(Category c)
        {
            db.Category.Add(c);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult KCategoryDelete(int id)
        {
            var ozyksr = db.Category.Find(id);
            db.Category.Remove(ozyksr);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        public ActionResult UCategoryGetir(int id)
        {
            var ozyksr = db.Category.Find(id);

            return View("UCategoryGetir", ozyksr);
        }
        public ActionResult BCategoryUpdate(Category k)
        {
            var kubra = db.Category.Find(k.ID);
            kubra.Name = k.Name;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}