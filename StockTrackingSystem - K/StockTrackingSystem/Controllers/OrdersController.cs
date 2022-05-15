using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using StockTrackingSystem.Models.Entity;


namespace StockTrackingSystem.Controllers
{
    public class OrdersController : Controller
    {
        // GET: Orders
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index()
        {
            var order = db.Order.ToList();
            return View(order);
        }
        [HttpGet]
        public ActionResult NewOrder()
        {
            //ürünler
            List<SelectListItem> urun = (from x in db.Product.ToList()
                                            select new SelectListItem
                                            {
                                                Text = x.Name,  
                                                Value = x.ID.ToString()  

                                            }).ToList();
          
            ViewBag.drop1 = urun;
            //personel
            List<SelectListItem> per = (from x in db.Employee.ToList()
                                        select new SelectListItem
                                        {
                                            Text = x.Name, 
                                            Value = x.Id.ToString() 

                                        }).ToList();

            ViewBag.drop2 = per;
            //müşteriler
            List<SelectListItem> custo = (from x in db.Customer.ToList()
                                         select new SelectListItem
                                         {
                                             Text = x.Name,  
                                             Value = x.Id.ToString()  

                                         }).ToList();
          
            ViewBag.drop3 = custo;
           
           
            return View();
        }
        [HttpPost]
        public ActionResult NewOrder(Order o)
        {
            
            var urun = db.Product.Where(x => x.ID == o.Product.ID).FirstOrDefault();
            var employee = db.Employee.Where(x => x.Id == o.Employee.Id).FirstOrDefault();
            var custo = db.Customer.Where(x => x.Id == o.Customer.Id).FirstOrDefault();
            o.Customer = custo;
            o.Employee = employee;
            o.Product = urun;
            o.Date = DateTime.Parse(DateTime.Now.ToShortDateString());
            db.Order.Add(o);  
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}