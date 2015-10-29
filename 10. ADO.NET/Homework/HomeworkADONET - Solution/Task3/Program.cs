using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
//3. Write a program that retrieves from the `Northwind` database all product categories and the names of the products in each category.
 //   *   Can you do this with a single SQL query (with table join)?
namespace Task3
{
    class Program
    {
        private static SqlConnection GetConnection()
        {
             string connectionString = "Server=.\\SQLEXPRESS;Database=Northwind; Integrated Security=true";
             SqlConnection connection = new SqlConnection(connectionString);
             connection.Open();
             return connection;
        }

        static void Main(string[] args)
        {
            SqlConnection connection = GetConnection();
            string query="SELECT c.CategoryName, p.ProductName FROM Categories c INNER JOIN Products p ON c.CategoryID=p.CategoryID ORDER BY c.CategoryName";
            SqlCommand queryCommand = new SqlCommand(query, connection);
            SqlDataReader reader = queryCommand.ExecuteReader();
            using(reader)
            {
                Console.WriteLine("Categories\t-\tProducts");
                while(reader.Read())
                {
                    string category = (string)reader["CategoryName"];
                    string product = (string)reader["ProductName"];
                    Console.WriteLine("{0}\t-\t{1}", category, product);
                }
                
            }

            connection.Close();
        }
    }
}
