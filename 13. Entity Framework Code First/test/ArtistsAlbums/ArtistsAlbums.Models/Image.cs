using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.Models
{
    public class Image
    {
        public int Id { get; set; }

        public byte[] Content { get; set; }

        public string FileExtension { get; set; }

        public string OriginalFileName { get; set; }

        public Guid? AlbumId { get; set; }

        public virtual Album Album { get; set; }
    }
}
