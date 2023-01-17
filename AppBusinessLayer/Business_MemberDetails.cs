using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppBusinessLayer
{
   public class Business_MemberDetails
    {
        public int MemberId { get; set; }
        public string MemberName { get; set; }
        public string DOB { get; set; }
        public string Contact { get; set; }
        public string email { get; set; }
        public string state { get; set; }
        public string city { get; set; }
        public string pincode { get; set; }
        public string address { get; set; }
        public string accountstatus { get; set; }
        public string password { get; set; }
    }
}
