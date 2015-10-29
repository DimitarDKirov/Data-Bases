using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ArtistsAlbums.Models;

namespace ArtistsAlbums.Data
{
    public class ArtistsDbContext : DbContext, ArtistsAlbums.Data.IArtistsDbContext
    {
        public ArtistsDbContext()
            : base("ArtistsDB")
        {
          
        }
        public virtual IDbSet<Album> Albums { get; set; }

        public virtual IDbSet<Song> Songs { get; set; }

        public virtual IDbSet<Artist> Artists { get; set; }

        public virtual IDbSet<Image> Images { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Artist>().HasKey(a => a.Id);   
            base.OnModelCreating(modelBuilder);
        }
    }
}
