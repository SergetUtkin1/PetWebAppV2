using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace PetWebApp.Models
{
    public class PetDbContext
    {
        public List<PetInfo> ListofPetsInfo
        {
            get { return GetListOfPI(); }
        }

        private List<PetInfo> GetListOfPI()
        {
            var mList = new List<PetInfo>();
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConStr"].ConnectionString);

            cnn.Open();
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM PetInfo", cnn);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();
            while(dataReader.Read())
            {
                var petinfoObj = new PetInfo();
                    petinfoObj.Name = (string)dataReader.GetValue(0);
                    petinfoObj.Breed = (string)dataReader.GetValue(1);
                    petinfoObj.Birthdate = (DateTime)dataReader.GetValue(2);
                    petinfoObj.Count_of_medal = (int)dataReader.GetValue(3);
                    petinfoObj.ID = (int)dataReader.GetValue(4);
                

                mList.Add(petinfoObj);
            }
            cnn.Close();

            return mList;
        }

        public List<Owners> ListOfOwners
        {
            get { return GetListOfOwners(); }
        }

        private List<Owners> GetListOfOwners()
        {
            var mList = new List<Owners>();
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConStr"].ConnectionString);

            cnn.Open();
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Owners", cnn);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();
            while (dataReader.Read())
            {
                var OwnersObj = new Owners();
                    OwnersObj.Name = (string)dataReader.GetValue(1);
                    OwnersObj.ID = (int)dataReader.GetValue(0);

                mList.Add(OwnersObj);
            }
            cnn.Close();

            return mList;
        }

        public List<Pet_Owner_realations> ListOfPet_Owner_realations
        {
            get { return GetListOfPet_Owner_realations(); }
        }

        private List<Pet_Owner_realations> GetListOfPet_Owner_realations()
        {
            var mList = new List<Pet_Owner_realations>();
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConStr"].ConnectionString);

            cnn.Open();
            SqlCommand sqlCommand = new SqlCommand("SELECT * FROM Pet_Owner_realations", cnn);
            SqlDataReader dataReader = sqlCommand.ExecuteReader();
            while (dataReader.Read())
            {
                var Pet_Owner_realationsObj = new Pet_Owner_realations();
                    Pet_Owner_realationsObj.Pet_id = (int)dataReader.GetValue(0);
                    Pet_Owner_realationsObj.Owner_id = (int)dataReader.GetValue(1);

                mList.Add(Pet_Owner_realationsObj);
            }
            cnn.Close();

            return mList;
        }

        public void AddNewPet(PetInfo pet)
        {
            SqlConnection cnn = new SqlConnection(WebConfigurationManager.ConnectionStrings["myConStr"].ConnectionString);
            SqlCommand command = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            cnn.Open();
            String sql = $"INSERT INTO PetInfo (name, breed, birthdate, count_of_medal) VALUES('{pet.Name}', '{pet.Breed}', '{pet.Birthdate.ToString()}', {pet.Count_of_medal.ToString()})";

            command = new SqlCommand(sql, cnn);
            
            adapter.InsertCommand = new SqlCommand(sql, cnn);
            adapter.InsertCommand.ExecuteNonQuery();

            command.Dispose();
            cnn.Close();
        }
    }
}