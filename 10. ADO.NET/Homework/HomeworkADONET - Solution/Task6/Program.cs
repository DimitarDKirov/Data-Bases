using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.OleDb;

namespace Task6
{
    class Program
    {
        static void Main(string[] args)
        {
            OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;" +
            @"Data Source=..\..\table.xls;Persist Security Info=False;Extended Properties=Excel 8.0");
            connection.Open();
            OleDbCommand command = new OleDbCommand("select * from [Sheet1$]", connection);
            OleDbDataReader reader = command.ExecuteReader();
            Console.WriteLine("Name\tScore");
            using (connection)
            {
                while (reader.Read())
                {
                    Console.WriteLine("{0}\t{1}", reader[0], reader[1]);
                }
            }
        }
    }
}
