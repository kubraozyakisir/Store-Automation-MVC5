using StockTrackingSystem.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;

namespace StockTrackingSystem.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index(int page=1)
        { 
            
            var customerlist = db.Customer.Where(x=>x.Status==true).ToList().ToPagedList(page,6);
            return View(customerlist);
        }
        [HttpGet]
        public ActionResult CustomerAdd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult CustomerAdd(Customer c)
        {
    
            if (!ModelState.IsValid)
            {
                return View("CustomerAdd");
            }
           
            c.Status = true;
            db.Customer.Add(c);
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        public ActionResult CustomerDelete(Customer p)
        {
            var delete = db.Customer.Find(p.Id);
            delete.Status = false;
            db.SaveChanges();
            return RedirectToAction("Index");

        }
        public ActionResult CustomerGetir(int id)
        {
            var getir = db.Customer.Find(id);

            return View("CustomerGetir", getir);

        }
        public ActionResult CustomerUpdate(Customer p)
        {
            var update = db.Customer.Find(p.Id);
            update.Name = p.Name;
            update.Surname = p.Surname;
            update.City = p.City;
            update.Balance = p.Balance;
            db.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}