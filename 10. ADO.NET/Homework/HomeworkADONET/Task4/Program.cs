//4. Write a method that adds a new product in the products table in the Northwind database.
//    Use a parameterized SQL command.


using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;

namespace Task4
{
    class Program
    {
        class Product
        {
            public Product(string name, int supplier, int category, string units, decimal price, int unitsInStock)
            {
                this.ProductName = name;
                this.SupplierId = supplier;
                this.CategoryId = category;
                this.UnitDescription = units;
                this.Price = price;
                this.UnitsInStok = unitsInStock;
                this.UnitsOnOrder = 0;
                this.ReorderLevel = 0;
                this.Discontinued = false;
            }

            public string ProductName { get; set; }
            public int SupplierId { get; set; }
            public int? CategoryId { get; set; }
            public string UnitDescription { get; set; }
            public decimal? Price { get; set; }
            public int? UnitsInStok { get; set; }
            public int? UnitsOnOrder { get; set; }
            public int? ReorderLevel { get; set; }
            public bool Discontinued { get; set; }
        }

        private static SqlConnection connection;

        private static void OpenConnection()
        {
            ConnectionStringSettings dbConnection = ConfigurationManager.ConnectionStrings["MSSQL"];
            connection = new SqlConnection(dbConnection.ConnectionString);
            connection.Open();
        }

        private static void CloseConnection()
        {
            if(connection !=null)
            {
                connection.Close();
            }
        }

        private static int StoreProduct(Product product)
        {
            string commaandString = "INSERT INTO Products VALUES(@productName, @supplier, @category, @units, @price, @unitsInStock, @unitsOnOrder, @reorderLevel, @discontinued)";
            SqlCommand command = new SqlCommand(commaandString, connection);
            command.Parameters.AddWithValue("@productName", product.ProductName);
            command.Parameters.AddWithValue("@supplier", product.SupplierId);
            command.Parameters.AddWithValue("@units", product.UnitDescription);
            command.Parameters.AddWithValue("@discontinued", product.Discontinued ? 1: 0);

            SqlParameter categoryParameter = new SqlParameter("@category", product.CategoryId);
            if (product.CategoryId == null)
            {
                categoryParameter.Value = DBNull.Value;
            }

            command.Parameters.Add(categoryParameter);

            SqlParameter priceParameter = new SqlParameter("@price", product.Price);
            if (product.Price == null)
            {
                priceParameter.Value = DBNull.Value;
            }

            command.Parameters.Add(priceParameter);

            SqlParameter stockParameter = new SqlParameter("@unitsInStock", product.UnitsInStok);
            if (product.UnitsInStok == null)
            {
                stockParameter.Value = DBNull.Value;
            }

            command.Parameters.Add(stockParameter);

            SqlParameter orderParameter = new SqlParameter("@unitsOnOrder", product.UnitsOnOrder);
            if(product.UnitsOnOrder==null)
            {
                orderParameter.Value = DBNull.Value;
            }

            command.Parameters.Add(orderParameter);

            SqlParameter reorderParameter = new SqlParameter("@reorderLevel", product.ReorderLevel);
            if(product.ReorderLevel==null)
            {
                reorderParameter.Value = DBNull.Value;
            }

            command.Parameters.Add(reorderParameter);
            command.ExecuteNonQuery();

            SqlCommand newProductIdCommand = new SqlCommand("SELECT @@Identity",connection);
            int newProductid = (int)(decimal)newProductIdCommand.ExecuteScalar();
            return newProductid;
        }

        static void Main(string[] args)
        {
            Product yogurt = new Product("Yougurt Elena", 1, 4, "Cup of 400 g", 0.99m, 20);
            OpenConnection();
            int productId = StoreProduct(yogurt);
            CloseConnection();
            Console.WriteLine("New product is with ID {0}", productId);
        }
    }
}
