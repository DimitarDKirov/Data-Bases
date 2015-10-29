
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.Models
{
    public class Album
    {
        private ICollection<Song> songs;

        private ICollection<Artist> artists;

        private ICollection<Image> images;

        public Album()
        {
            this.Id = Guid.NewGuid();
            this.songs = new HashSet<Song>();
            this.artists = new HashSet<Artist>();
            this.images = new HashSet<Image>();
        }
        [Required]
        public string Title { get; set; }

        public AlbumStatus Status { get; set; }

        public Guid Id { get; set; }

        public DateTime? ReleasedOn { get; set; }

        public decimal? Price { get; set; }

        public virtual ICollection<Song> Songs
        {
            get { return this.songs; }
            set { this.songs = value; }
        }

        public virtual ICollection<Artist> Artists
        {
            get { return artists; }
            set { artists = value; }
        }

        public virtual ICollection<Image> Images
        {
            get { return images; }
            set { images = value; }
        }
    }
}
