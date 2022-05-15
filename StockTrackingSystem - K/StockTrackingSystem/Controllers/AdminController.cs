using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StockTrackingSystem.Models.Entity;

namespace StockTrackingSystem.Controllers
{
    public class AdminController : Controller
    {
        // GET: Admin
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index()
        {
            var admin = db.Admin.ToList();
            return View(admin.ToList());
        }
        [HttpGet]
        public ActionResult AddAdmin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddAdmin(Admin a)
        {
            db.Admin.Add(a);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}