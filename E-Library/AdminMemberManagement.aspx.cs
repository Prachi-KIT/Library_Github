using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class AdminMemberManagement : System.Web.UI.Page
    {
        public void ClearControlsdata()
        {
            txtmemberid.Text = "";
            txtAccountStatus.Text = "";
            txtMembernm.Text = "";
            txtemail.Text = "";
            txtDOB.Text = "";
            txtcontact.Text = "";
            txtcity.Text = "";
            txtAccountStatus.Text = "";
            txtaddress.Text = "";
            txtpincode.Text = "";
            txtAccountStatus.Text = "";

        }
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            drpstate.Attributes.Add("disabled", "disabled");
             GrpIssueBookList.DataBind();
            statusnoti.Style.Add("display", "none");
        }

        protected void lknSearch_Click(object sender, EventArgs e)
        {
            Business_MemberDetails b;
            b =BL.GetMemberDetailsWithMemberId(Convert.ToInt32(txtmemberid.Text.Trim()));
            txtMembernm.Text=b.MemberName;
            if(b.MemberName == "Member not found with this Id")
            {
                this.statusnoti.InnerHtml = "User/Member not found";
                statusnoti.Attributes.Add("Class", "alert alert-warning");
                statusnoti.Style.Add("display", "block");
            }
            
            txtpincode.Text = b.pincode;
            txtemail.Text = b.email;
            txtaddress.Text = b.address;
            txtcity.Text = b.city;
            txtcontact.Text = b.Contact.ToString();
            txtDOB.Text = b.DOB;
            drpstate.SelectedValue = b.state;
            txtAccountStatus.Text = b.accountstatus;

        }

        protected void lknstatusActive_Click(object sender, EventArgs e)
        {
            if (txtmemberid.Text.Trim() != "")
            {
                BL.UpdateMemberStatusByMemberId(Convert.ToInt32(txtmemberid.Text.Trim()), "active");
                GrpIssueBookList.DataBind();               
                this.statusnoti.InnerHtml = "User/Member status has been updated with active status";
                statusnoti.Attributes.Add("Class", "alert alert-success");
                statusnoti.Style.Add("display", "block");
            }
            else
            {
                Response.Write("<script>alert('Member Id cant be blank')</script>");
            }
        }

        protected void lknstatusPending_Click(object sender, EventArgs e)
        {
            if (txtmemberid.Text.Trim() != "")
            {
                BL.UpdateMemberStatusByMemberId(Convert.ToInt32(txtmemberid.Text.Trim()), "pending");
                GrpIssueBookList.DataBind();
                this.statusnoti.InnerHtml = "User/Member status has been updated with Pending status";
                statusnoti.Attributes.Add("Class", "alert alert-warning");
                statusnoti.Style.Add("display", "block");
            }
            else
            {
                Response.Write("<script>alert('Member Id cant be blank')</script>");
            }
        }

        protected void lknstatusDeleted_Click(object sender, EventArgs e)
        {

            if (txtmemberid.Text.Trim() != "")
            {
                BL.UpdateMemberStatusByMemberId(Convert.ToInt32(txtmemberid.Text.Trim()), "deactivated");
                GrpIssueBookList.DataBind();
                this.statusnoti.InnerHtml = "User/Member status has been Deactivated by Admin";
                statusnoti.Attributes.Add("Class", "alert alert-danger");
                statusnoti.Style.Add("display", "block");
            }
            else
            {
                Response.Write("<script>alert('Member Id cant be blank')</script>");
            }
        }

        protected void BtnDeleteMember_Click(object sender, EventArgs e)
        {
            if(txtmemberid.Text.Trim()=="")
            {
                Response.Write("<script>alert('Member Id cant be blank')</script>");
            }
            else
            {
                if (!BL.DeleteMember(Convert.ToInt32(txtmemberid.Text.Trim())))
                {
                    //Response.Write("<script>alert('Member deleted successfully')</script>");
                    Page.ClientScript.RegisterStartupScript(BtnDeleteMember.GetType(), "show3", "<script type=\"text/javascript\"> $('#MemberPopupModal').modal('show');</script>", false);
                    ClearControlsdata();
                    GrpIssueBookList.DataBind();
                };
            }
            
        }
    }
}