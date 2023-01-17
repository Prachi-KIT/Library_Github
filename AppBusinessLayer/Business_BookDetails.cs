using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppBusinessLayer
{
   public class Business_BookDetails
    {
        public int Book_id { get; set; }
        public string BookName { get; set; }
        public string genre { get; set; }
        public string AuthorName { get; set; }
        public string PublisherName { get; set; }
        public string Publish_dt { get; set; }
        public string Language { get; set; }
        public string Edition { get; set; }
        public int book_cost { get; set; }
        public int no_of_pages { get; set; }
        public int actual_stock { get; set; }
        public int current_Stock { get; set; }
        public string Book_desc { get; set; }
        public string Bookimg_link { get; set; }
        public int no_of_issuedbook { get; set; }
    }

   }
