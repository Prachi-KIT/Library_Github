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
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["username"].ToString() != "" && Session["username"] != null)
                {
                    BusinessLayer BL = new BusinessLayer();
                    Business_MemberDetails Member = BL.GetMemberAllDetailsForUserProfile(Session["username"].ToString(), Session["Useremail"].ToString());
                    txtusernm.Text = Member.MemberName;
                    txtemail.Text = Member.email;
                    txtpincode.Text = Member.pincode;
                    txtcontact.Text = Member.Contact;
                    txtcity.Text = Member.city;
                    txtuserId.Text = Member.MemberId.ToString();
                    txtpassword.Text = Member.password;
                    drpstate.SelectedItem.Text = Member.state.ToString();
                    txtDOB.Text = Member.DOB;
                    txtaddress.Text = Member.address;
                    lblacc_status.Text = Member.accountstatus;
                    if (lblacc_status.Text.ToString() == "pending")
                    {
                        lblacc_status.CssClass = "badge badge-pill  badge-warning";
                    }
                    else if (lblacc_status.Text.ToString() == "active")
                    {
                        lblacc_status.CssClass = "badge badge-pill badge-success";
                    }
                    else
                    {
                        lblacc_status.CssClass = "badge badge-pill badge-danger";
                    }

                    DataTable dt = new DataTable();

                    BusinessLayer bl = new BusinessLayer();
                    dt = bl.GetBookIssueDetailsForMember(Convert.ToInt32(txtuserId.Text.Trim()));
                    this.GrdDetails.AutoGenerateColumns = false;

                    foreach (DataColumn col in dt.Columns)
                    {
                        BoundField field = new BoundField();

                        field.DataField = col.ColumnName;

                        field.HeaderText = col.ColumnName;

                        GrdDetails.Columns.Add(field);
                    }

                    this.GrdDetails.Columns[0].HeaderText = "Member Name";
                    this.GrdDetails.Columns[1].HeaderText = "Book";
                    this.GrdDetails.Columns[2].HeaderText = "Issue Date";
                    this.GrdDetails.Columns[3].HeaderText = "Due Date";

                    GrdDetails.DataSource = dt;
                    GrdDetails.DataBind();
                }
            }
            
        }

        protected void BtnUserUpdate_Click(object sender, EventArgs e)
        {
            string Newpwd = string.Empty;
            if (txtnewpwd.Text.Trim()!="")
            {
                Newpwd = txtnewpwd.Text.Trim();
            }
            else
            {
                Newpwd = txtpassword.Text.Trim();
            }

            BusinessLayer BL = new BusinessLayer();
            bool status= BL.UpdateMemberProfilr(txtusernm.Text.Trim().ToString(), txtDOB.Text.Trim().ToString(), txtcontact.Text.Trim().ToString(), txtemail.Text.Trim().ToString(), drpstate.SelectedItem.Text, txtcity.Text.Trim().ToString(), txtpincode.Text.Trim().ToString(), 
                         txtaddress.Text.Trim().ToString(), Newpwd);
            if(!status)
            {

            }
        }
    }
}