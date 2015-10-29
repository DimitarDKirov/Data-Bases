//5.Write a program that retrieves the images for all categories in the Northwind database and stores them as JPG files in the file system.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace Task5
{
    class Program
    {
        private static SqlConnection connection;
        private static IDictionary<string, byte[]> categoryImages = new Dictionary<string, byte[]>();

        private static void OpenConnection()
        {
            ConnectionStringSettings dbConnection = ConfigurationManager.ConnectionStrings["MSSQL"];
            connection = new SqlConnection(dbConnection.ConnectionString);
            connection.Open();
        }

        private static void CloseConnection()
        {
            if (connection != null)
            {
                connection.Close();
            }
        }

        private static void ReadFromDB()
        {
            string commandQuery = "SELECT CategoryName, Picture FROM Categories";
            SqlCommand command = new SqlCommand(commandQuery, connection);
            SqlDataReader reader = command.ExecuteReader();
            using (reader)
            {
                while (reader.Read())
                {
                    byte[] image = (byte[])reader["Picture"];
                    string category = (string)reader["CategoryName"];
                    categoryImages.Add(category, image);
                }
            }
        }

        private static void CreateFiles()
        {
            foreach (KeyValuePair<string, byte[]> categoryImage in categoryImages)
            {
                string fileName=string.Format("..\\..\\images\\{0}.bmp", categoryImage.Key.Replace('/', '_'));
                FileStream fileStream = File.OpenWrite(fileName);
                using (fileStream)
                {
                    fileStream.Write(categoryImage.Value, 0, categoryImage.Value.Length);
                }
            }
        }

        static void Main(string[] args)
        {
            OpenConnection();
            ReadFromDB();
            CloseConnection();
            CreateFiles();
        }
    }
}
