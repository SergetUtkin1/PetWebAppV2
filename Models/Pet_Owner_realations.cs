using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetWebApp.Models
{
    public class Pet_Owner_realations
    {
        private int pet_id;

        public int Pet_id
        {
            get { return pet_id; }
            set { pet_id = value; }
        }

        private int owner_id;

        public int Owner_id
        {
            get { return owner_id; }
            set { owner_id = value; }
        }
    }
}