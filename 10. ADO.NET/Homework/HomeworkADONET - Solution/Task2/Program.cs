//2. Write a program that retrieves the name and description of all categories in the Northwind DB.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Task2
{
    class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=.\\SQLEXPRESS;Database=Northwind;Integrated Security=true";
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            using (connection)
            {
                string sqlString = "SELECT CategoryName, Description FROM Categories";
                SqlCommand command = new SqlCommand(sqlString, connection);
                SqlDataReader reader = command.ExecuteReader();
                using (reader)
                {
                    Console.WriteLine("Category name - Description");
                    while (reader.Read())
                    {
                        string name = (string)reader["CategoryName"];
                        string description = (string)reader["Description"];
                        Console.WriteLine("{0} - {1}", name, description);
                    }
                }
            }
        }
    }
}
