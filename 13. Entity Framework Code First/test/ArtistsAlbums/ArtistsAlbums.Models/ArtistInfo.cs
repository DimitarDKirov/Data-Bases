using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.Models
{
    [ComplexType] //v edna tablica s Artist
    public class ArtistInfo
    {
        [Column("Age")]
        public int Age { get; set; }

        [Column("Biography")]
        [MaxLength(200)]
        public string Biography { get; set; }
    }
}
