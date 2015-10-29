using System;
using System.Data.Entity;

namespace ArtistsAlbums.Data
{
    public interface IArtistsDbContext
    {
        IDbSet<ArtistsAlbums.Models.Album> Albums { get; set; }
        IDbSet<ArtistsAlbums.Models.Artist> Artists { get; set; }
        IDbSet<ArtistsAlbums.Models.Image> Images { get; set; }
        IDbSet<ArtistsAlbums.Models.Song> Songs { get; set; }
        int SaveChanges();
    }
}
