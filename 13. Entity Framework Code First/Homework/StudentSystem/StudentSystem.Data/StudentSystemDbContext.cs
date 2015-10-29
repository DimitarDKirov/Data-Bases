using StudentSystem.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSystem.Data
{
    public class StudentSystemDbContext:DbContext
    {
        public StudentSystemDbContext()
            : base("StudentsSystem")
        {
        }
        public virtual IDbSet<Students>  Students{ get; set; }

        public virtual IDbSet<Courses> Courses { get; set; }

        public virtual IDbSet<Homeworks> Homeworks { get; set; }
    }
}
