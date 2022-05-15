using StockTrackingSystem.Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace StockTrackingSystem.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        StockTrackingMVCEntities1 db = new StockTrackingMVCEntities1();
        public ActionResult Index(string p)
        {
           
            var products =db.Product.Where(x => x.Status== true);
            if (!string.IsNullOrEmpty(p))
            {
                products = products.Where(x => x.Name.Contains(p) && x.Status == true);
            }
            return View(products.ToList());
        }
        [HttpGet]
        public ActionResult KProductAdd()
        {
           
            List<SelectListItem> catego = (from x in db.Category.ToList()
                                             select new SelectListItem
                                             {
                                                 Text = x.Name,  
                                                 Value=x.ID.ToString() 

                                             }).ToList();
            ViewBag.drop = catego;
            return View();
        }
        [HttpPost]
        public ActionResult KProductAdd(Product p)
        {
             
        
            p.Status = true;
            var catego = db.Category.Where(x => x.ID == p.Category.ID).FirstOrDefault();
            p.Category = catego;   
            db.Product.Add(p); 
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult UProductGetir(int id)
        {
            List<SelectListItem> categor = (from x in db.Category.ToList()
                                           select new SelectListItem
                                           {
                                               Text = x.Name, 
                                               Value = x.ID.ToString()  

                                           }).ToList();
        
            ViewBag.kategori = categor;  
            var ktgr = db.Product.Find(id);
            return View("UProductGetir", ktgr);

        }
        public ActionResult BProductUpdate(Product p)
        {
            var search = db.Product.Find(p.ID);
            search.Name = p.Name;
            search.Brand = p.Brand;
            search.Stock = p.Stock;
            search.PurchasePrice = p.PurchasePrice;
            search.SalePrice = p.SalePrice;
            var catego = db.Category.Where(x => x.ID == p.Category.ID).FirstOrDefault();
            search.CategoryId = catego.ID;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult RDelete(Product p)
        {
           
            var findproduct = db.Product.Find(p.ID);
            findproduct.Status = false;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}