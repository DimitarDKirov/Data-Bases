using StudentSystem.Data;
using StudentSystem.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudentsSystem.ConsoleClient
{
    class Program
    {
        static void Main(string[] args)
        {
            var db = new StudentSystemDbContext();

            var dbCourse = new Courses
            {
                Name = "DataBases Fundamentals",
                Materials = "Lectures, Videos, Presentations",
                Description = "SQL, EF, JSON, XML",
            };

            var hqc = new Courses
            {
                Name = "High Quality Code",
                Materials = "Lectures, Demos",
                Description = "Design Patterns, Formating, Naming"
            };

            var petko = new Students
            {
                Name = "Petko",
                Number = 20151,
            };
            petko.Courses.Add(dbCourse);

            var mitko = new Students
            {
                Name = "Mitko",
                Number = 20152
            };

            mitko.Courses.Add(hqc);
            mitko.Courses.Add(dbCourse);

            mitko.Homeworks.Add(new Homeworks
            {
                Content = "6 tasks",
                TimeSent = DateTime.Now,
                Courses = hqc
            });

            petko.Homeworks.Add(new Homeworks{
                Courses=dbCourse,
                TimeSent=new DateTime(2013,12,1),
                Content="JSON"
            });

            db.Students.Add(mitko);
            db.Students.Add(petko);
            db.SaveChanges();

        }
    }
}
