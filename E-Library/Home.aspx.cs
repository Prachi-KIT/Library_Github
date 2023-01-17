using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class Home : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            GetAllBooks();
        }

        public void GetAllBooks()
        {
            DataTable Dt = new DataTable();
            Dt = BL.GetAllBookDetails();
            booklist1.DataSource = Dt;
            booklist1.DataBind();
            DataList2.DataSource = Dt;
            DataList2.DataBind();
            DataList3.DataSource = Dt;
            DataList3.DataBind();
        }
    }
}