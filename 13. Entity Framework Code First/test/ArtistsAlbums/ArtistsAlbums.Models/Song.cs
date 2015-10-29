using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.Models
{
    public class Song
    {
        public int Id { get; set; }
        [Required]
        public string Title { get; set; }
        public int Duration { get; set; }
        public Guid AlbumId { get; set; }
        public virtual Album Album { get; set; }
    }
}
