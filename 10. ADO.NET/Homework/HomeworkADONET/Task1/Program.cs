//1. Write a program that retrieves from the Northwind sample database in MS SQL Server the number of rows in the Categories table.

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;

namespace Task1
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
                string sqlString = "SELECT COUNT(*) FROM Categories";
                SqlCommand command = new SqlCommand(sqlString, connection);
                int count = (int)command.ExecuteScalar();
                Console.WriteLine("Number of rows in table Categories: {0}", count);
            }
        }
    }
}
