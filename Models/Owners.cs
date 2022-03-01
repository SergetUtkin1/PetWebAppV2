using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebApp.Models
{
    public class Owners
    {
        private int id;

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        private string name = "Не указано";

        public string Name
        {
            get { return name; }
            set { name = value; }
        }

    }
}