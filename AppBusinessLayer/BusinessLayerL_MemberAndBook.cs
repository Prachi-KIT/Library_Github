using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppBusinessLayer
{
    public class BusinessLayerL_MemberAndBook
    {
        public string MemberName { get; set; }

        public string BookName { get; set; }

        public string BookImgPath
        {
            get;
            set;
        }

        public int Aval_stock { get; set; }
    }
}
