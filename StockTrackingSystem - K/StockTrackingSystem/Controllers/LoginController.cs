using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StockTrackingSystem;
using System.Web.Security;
using StockTrackingSystem.Models.Entity;

namespace StockTrackingSystem.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Admin p)
        {
            var info = db.Admin.FirstOrDefault(x => x.Username == p.Username && x.Password == p.Password);
            if (info != null)
            {
                FormsAuthentication.SetAuthCookie(info.Username, false);
                return RedirectToAction("Index","Customer");  
            }
            else
            {
                return View();
            }
          
        }
    }
}