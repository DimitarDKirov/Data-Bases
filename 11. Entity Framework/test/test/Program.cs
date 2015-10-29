using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace test
{
    class Program
    {
        static void Main(string[] args)
        {
            using(var db=new TelerikAcademyEntities())
            {
                var list = new List<Employee>();
                list.FirstOrDefault(e => e.EmployeeID == 1);
                var res = db.Employees.Where(x => x.DepartmentID == 1).FirstOrDefault();
                Console.WriteLine(res.FirstName);
                var employee = db.Employees.Find(1);
                var employee2 = db.Employees.FirstOrDefault(e => e.EmployeeID == 1);
                var employees = db.Employees.Select(e => new { e.EmployeeID, e.FirstName });
                var query = db.Addresses.Where(a => a.TownID == 2).Select(ad => new { ad.AddressText, ad.Town.Name });
                Console.WriteLine(query.ToString());

                Console.WriteLine(db.Employees);

                var town = new Town
                {
                    Name = "Sofiq"
                };
                var addr = new Address
                {
                    AddressText = "Maldost 140",
                    Town = town
                };

                var deltown = db.Towns.FirstOrDefault(t => t.Name == "Sofia");
               // db.Towns.Remove(deltown);

                db.Addresses.Add(addr);
                try
                {
                    db.SaveChanges();
                }
                catch(Exception e)
                {

                }
                Expression<Func<Employee, bool>> exp = e => e.EmployeeID == 1;
                Console.WriteLine(exp.Name);

                var towns = db.Towns
                    .Where(t => t.Addresses.Any())
                    .Select(t => new
                    {
                        t.Name,
                        Address = t.Addresses.Select(a => a.AddressText)
                    }).ToList();

                foreach(var town1 in towns)
                {
                    Console.WriteLine(town1.Name);
                    foreach(var addre in town1.Address)
                    {
                        Console.WriteLine(addre);
                    }
                }

                var emplo = db.Employees.Select(e => new
                {
                    Full = e.FirstName + " " + e.LastName,
                    Town = e.Address.Town.Name,
                    Addr = e.Address.AddressText,
                    Project = e.Projects.Select(pr => pr.Name).FirstOrDefault(),
                    Dep = e.Department.Name
                });

                Console.WriteLine(emplo.FirstOrDefault());

                var combine = db.Employees.Join(db.Departments,
                    e => e.DepartmentID, d => d.DepartmentID,
                    (e,d)=>new
                    {
                        EmlName = e.FirstName,
                        Dep = d.Name
                    }).ToList();
                Console.WriteLine(combine[0].EmlName+" "+combine[1].Dep);

                var employ = db.Employees.GroupBy(e => e.Department.Name).ToList();
                foreach (var em in employ)
                {
                    Console.WriteLine("-----------------");
                    Console.WriteLine(em.Key);
                    foreach (var employn in em)
                    {
                        Console.WriteLine(" {0}",employn.FirstName);
                    }
                    
                }

                var updtEmpl = db.Employees.Where(e => e.EmployeeID == 3).FirstOrDefault();
                updtEmpl.FirstName = "Petko";
                db.SaveChanges();


                var dbEntry = db.Entry(updtEmpl);
                dbEntry.State = System.Data.Entity.EntityState.Added;
                

            }
        }
    }
}
