using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppBusinessLayer
{
    public class Business_BookIssueDetails
    {
        public int MemberId { get; set; }
        public string MemberName { get; set; }
        public int BookId { get; set; }
        public string BookName { get; set; }
        public string BookIssueDate { get; set; }
        public string BookDueDate { get; set; }
        public string IsReturn { get; set; }
        public int CurrentStock { get; set; }
    }
}
