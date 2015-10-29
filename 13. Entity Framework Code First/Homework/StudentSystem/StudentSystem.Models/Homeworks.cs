using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentSystem.Models
{
    public class Homeworks
    {
        public int Id { get; set; }

        public string Content { get; set; }

        public DateTime TimeSent { get; set; }

        public int StudentsId { get; set; }

        public virtual Students Students { get; set; }

        public int CoursesId { get; set; }

        public virtual Courses Courses { get; set; }
    }
}
