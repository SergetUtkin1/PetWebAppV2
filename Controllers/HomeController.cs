using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;

namespace PetWebApp.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            int count = 0;
            string connectionStrings = @"Data Source = DESKTOP-HTFQFDI;initial catalog=petdb;integrated security=True";
            SqlConnection cnn = new SqlConnection(connectionStrings);
            cnn.Open();
            SqlCommand command = new SqlCommand("SELECT * FROM PetInfo", cnn);
            SqlDataReader dataReader = command.ExecuteReader();
            while(dataReader.Read())
            {
                
            }
            cnn.Close();
            ViewBag.Cnt = count;
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}