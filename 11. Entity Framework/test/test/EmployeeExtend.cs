using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace test
{
   public partial class Employee
    {
       public string FullName()
       {
           return this.FirstName + " " + this.LastName;
       }
    }
}
