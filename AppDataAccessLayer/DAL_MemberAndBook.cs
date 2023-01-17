using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppDataAccessLayer
{
    public class DAL_MemberAndBook
    {
        public string MemberName { get; set; }

        public string BookName { get; set; }

        public string BookImagPath { get; set; }

        public int Available_Stock { get; set; }
    }
}
