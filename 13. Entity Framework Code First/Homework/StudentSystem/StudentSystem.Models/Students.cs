using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StudentSystem.Models
{
    public class Students
    {
        private ICollection<Courses> courses;

        private ICollection<Homeworks> homeworks;

        public Students()
        {
            this.courses = new HashSet<Courses>();
            this.homeworks = new HashSet<Homeworks>();
        }
        public ICollection<Courses> Courses
        {
            get { return courses; }
            set { courses = value; }
        }

        public ICollection<Homeworks> Homeworks
        {
            get { return homeworks; }
            set { homeworks = value; }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int Number { get; set; }
    }
}
