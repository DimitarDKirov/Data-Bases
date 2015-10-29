using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ArtistsAlbums.Models
{
    public class Artist
    {
        private ICollection<Album> albums;

        public Artist()
        {
            this.Members = 1;
            this.albums = new HashSet<Album>();
            this.Info = new ArtistInfo();
        }

        [Key]
        public int Id { get; set; }

        [Required(ErrorMessage="Задължително име")]
        [MaxLength(50)]
        public string Name { get; set; }

        public GenderType Gender { get; set; }

        public ArtistInfo Info { get; set; }

        public int Members { get; set; }

        public virtual ICollection<Album> Albums
        {
            get { return albums; }
            set { albums = value; }
        }

        [NotMapped]//za da ne vliza v BD
        public bool IsGroup
        {
            get { return this.Members > 1; }
        }
    }
}
