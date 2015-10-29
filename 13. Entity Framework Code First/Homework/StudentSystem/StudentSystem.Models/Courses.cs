using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace StudentSystem.Models
{
    public class Courses
    {
        private ICollection<Students> students;

        private ICollection<Homeworks> homeworks;

        public Courses()
        {
            this.students = new HashSet<Students>();
            this.homeworks = new HashSet<Homeworks>();
        }

        public ICollection<Homeworks> Homeworks
        {
            get { return homeworks; }
            set { homeworks = value; }
        }

        public ICollection<Students> Students
        {
            get { return this.students; }
            set { this.students = value; }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Materials { get; set; }
    }
}
