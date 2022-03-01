using PetWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PetWebApp.Controllers
{
    public class HomeController : Controller
    {
        PetDbContext dbContext = new PetDbContext();
        public ActionResult Index()
        {
            ViewBag.PetsInfo = dbContext.ListofPetsInfo;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Owners = dbContext.ListOfOwners;
            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            return View();
        }

        [HttpPost]
        public string Contact(PetInfo petInfo)
        {
            dbContext.AddNewPet(petInfo);
            return "Вы добавили собаку " + petInfo.Name;
        }
    }
}