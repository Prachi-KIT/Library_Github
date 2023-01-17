using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json.Linq;
using System.Configuration;
using System.Net;
using System.IO;

namespace E_Library
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string eventTarget = (this.Request["__EVENTTARGET"] == null) ? string.Empty : this.Request["__EVENTTARGET"];
                if (eventTarget == "CallServerSideFunctionPostBack")
                {
                    LogoutFunction();
                }

                    if (!IsPostBack)
                {
                    if (HttpContext.Current.Session.Count==0)
                    {
                        lknLogin.Visible = true;
                        lknSignup.Visible = true;
                        lknAdminLogin.Visible = true;
                        lknLogout.Visible = false;
                        lknuserinfo.Visible = false;
                        lknAdminMemberMgmt.Visible = false;
                        lknAdminPublisher.Visible = false;
                        lknBookInventory.Visible = false;
                        lknAuthorMgmnt.Visible = false;
                        lknBookReturn.Visible = false;
                        lknbookIssue.Visible = false;
                    }
                    else if (Session["role"].Equals("user"))
                    {
                        lknLogin.Visible = false;
                        lknSignup.Visible = false;
                        lknLogout.Visible = true;
                        lknuserinfo.Visible = true;
                        lknuserinfo.Text = "Hello " + Session["username"].ToString();
                        lknAdminMemberMgmt.Visible = false;
                        lknAdminPublisher.Visible = false;
                        lknBookInventory.Visible = false;
                        lknAuthorMgmnt.Visible = false;
                        lknBookReturn.Visible = false;
                        lknbookIssue.Visible = false;
                    }
                    else if (Session["role"].Equals("admin"))
                    {
                        lknLogin.Visible = false;
                        lknSignup.Visible = false;
                        lknLogout.Visible = true;
                        lknuserinfo.Visible = true;
                        lknAdminLogin.Visible = false;
                        lknuserinfo.Text = "Hello Admin";
                        lknAdminMemberMgmt.Visible = true;
                        lknAdminPublisher.Visible = true;
                        lknBookInventory.Visible = true;
                        lknAuthorMgmnt.Visible = true;
                        lknBookReturn.Visible = true;
                        lknbookIssue.Visible = true;
                    }
                }
            }
            catch(Exception ex)
            {

            }

        }

        protected void lknViewbooks_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }


        protected void lknSignup_Click(object sender, EventArgs e)
        {
            lknSignup.Attributes.Add("data-toggle", "modal");
            lknSignup.Attributes.Add("data-target", "#SignupModal");
            Response.Redirect("Signup.aspx");
            lknSignup_Click(sender,e);
        }

        protected void lknLogin_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");

        }

        //protected void lknLogout_Click1(object sender, EventArgs e)
        //{
           
        //    Response.Redirect("Home.aspx");
        //    HttpContext.Current.Session["username"] = "";
        //    HttpContext.Current.Session["role"] = "";
        //    HttpContext.Current.Session["status"] = "";
        //    HttpContext.Current.Session["useremail"] = "";

        //    lknLogin.Visible = true;
        //    lknSignup.Visible = true;
        //    lknLogout.Visible = false;
        //    lknuserinfo.Visible = false;
        //    lknAdminMemberMgmt.Visible = false;
        //    lknAdminPublisher.Visible = false;
        //    lknBookInventory.Visible = false;
        //    lknAuthorMgmnt.Visible = false;
        //}

        public void LogoutFunction()
        {
            lknLogout.Visible = false;
            lknuserinfo.Visible = false;
        }

        protected void lknBookReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookReturn.aspx");
        }

        protected void lknHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void lknuserinfo_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserProfile.aspx");
        }

        protected void lknLogout_Click(object sender, EventArgs e)
        {
            
        }

        protected void lknLogout_Click1(object sender, EventArgs e)
        {
            
            HttpContext.Current.Session["username"] = "";
            HttpContext.Current.Session["role"] = "";
            HttpContext.Current.Session["status"] = "";
            HttpContext.Current.Session["useremail"] = "";
            Session.RemoveAll();

            lknLogin.Visible = true;
            lknSignup.Visible = true;
            lknLogout.Visible = false;
            lknuserinfo.Visible = false;
            lknAdminMemberMgmt.Visible = false;
            lknAdminPublisher.Visible = false;
            lknBookInventory.Visible = false;
            lknAuthorMgmnt.Visible = false;
            Response.Redirect("Home.aspx");
        }
    }
}