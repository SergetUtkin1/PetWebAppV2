using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebApp.Models
{
    public class PetInfo
    {
        private string name, breed = "Не указано";
        private int id, count_of_medal;
        private DateTime birthdate;

        public string Name 
        { 
            get { return name;} 
            set { name = value;} 
        }

        public string Breed 
        { 
            get { return breed; } 
            set { breed = value; } 
        }

        public int ID 
        { 
            get { return id; } 
            set { id = value; } 
        }

        public int Count_of_medal
        {
            get { return count_of_medal; }
            set { count_of_medal = value; }
        }

        public DateTime Birthdate
        {
            get { return birthdate; }
            set { birthdate = value; }
        }
    }
}