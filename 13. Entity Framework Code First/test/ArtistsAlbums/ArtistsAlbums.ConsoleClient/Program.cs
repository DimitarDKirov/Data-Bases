using ArtistsAlbums.Data;
using ArtistsAlbums.Data.Migrations;
using ArtistsAlbums.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.ConsoleClient
{
    public class StartUp
    {
        static void Main(string[] args)
        {
            Database.SetInitializer(new MigrateDatabaseToLatestVersion<ArtistsDbContext, Configuration>());
           IArtistsDbContext  db = new ArtistsDbContext();

            Artist artist = new Artist
            {
                Name = "Madona",
                Gender=GenderType.Female
            };

            //db.Configuration.LazyLoadingEnabled = false;
            //db.Configuration.ValidateOnSaveEnabled = false;
            db.Artists.Add(artist);
            db.SaveChanges();

            //db.Configuration.LazyLoadingEnabled = true;
            //db.Configuration.ValidateOnSaveEnabled = true;

            Console.WriteLine(db.Artists.Count());
        }
    }
}
