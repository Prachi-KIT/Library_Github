using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        bool status;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                BusinessLayer BL = new BusinessLayer();
                status = BL.AdminLogin(txtmail.Text.Trim(), txtpassword.Text.Trim());
                if (status)
                {
                    Response.Redirect("AdminAuthor.aspx", false);
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}