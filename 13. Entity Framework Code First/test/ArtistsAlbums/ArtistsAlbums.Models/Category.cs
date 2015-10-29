using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ArtistsAlbums.Models
{
    public class Category
    {
        private ICollection<Category> subCategories;

        public Category()
        {
            this.subCategories = new HashSet<Category>();
        }

        public virtual ICollection<Category> SubCategories
        {
            get { return subCategories; }
            set { subCategories = value; }
        }

        public int Id { get; set; }

        public string Name { get; set; }

        public int ParentId { get; set; }

        [InverseProperty("Subcategories")]
        public Category Parent { get; set; }


    }
}
