using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class Login : System.Web.UI.Page
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
                
                if(txtusermail.Text.Trim()!="" && txtpassword.Text.Trim()!="")
                {
                    status = BL.UserLogin(txtusermail.Text.Trim(), txtpassword.Text.Trim());
                    if (status)
                    {
                        Response.Redirect("BookInventory.aspx", false);
                    }
                    else
                    {
                        lblmsg.InnerHtml = "Invalid User Name or password";
                        errormsg.Style.Add("display", "block");
                    }
                }
                else
                {
                    lblmsg.InnerHtml = "User Name or password can't be blank";
                    errormsg.Style.Add("display", "block");
                }
                
            }
            catch (Exception ex)
            {
                lblmsg.InnerHtml = "Invalid User Name or password";
                errormsg.Style.Add("display", "block");
            }

        }



        protected void BtnSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup.aspx");
        }
    }
}