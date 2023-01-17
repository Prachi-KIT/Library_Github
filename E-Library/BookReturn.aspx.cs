using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class BookReturn1 : System.Web.UI.Page
    {
        int CurrentStock = 0;
        BusinessLayer BL = new BusinessLayer();
        public void GetBookIssueDetails(int memberId, int BookId)
        {
            try
            {
                Business_BookIssueDetails MAB = new Business_BookIssueDetails();
                MAB = BL.GetBookIssueDetailsBYBookIdAndMemberId(memberId, BookId);
                if(MAB.BookName== "Book Not Found" && MAB.MemberName== "Member Not Found" && 
                   MAB.BookIssueDate== "Book Issue Date is not there")
                {
                    lblmsg.Style.Add("display", "block");
                    AlertContent.InnerText = "Member and book not found";
                    txtbookid.Text = "";
                    txtMember.Text = "";
                    txtbookid.Text = "";
                    txtBooknm.Text = "";
                    txtIssueDt.Text = "";
                    txtTentativeBookReturnDt.Text = "";
                    
                }
                else
                {
                    txtBooknm.Text = MAB.BookName;
                    txtMember.Text = MAB.MemberName;
                    txtIssueDt.Text = MAB.BookIssueDate.ToString();
                    txtTentativeBookReturnDt.Text = MAB.BookDueDate.ToString();
                    CurrentStock = MAB.CurrentStock;
                    CurrentStock = CurrentStock + 1;
                }
                
            }
            catch (Exception ex)
            {
                throw;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            GrdBookReturnList.DataBind();
            lblmsg.Style.Add("display", "none");
            AlertContent.InnerText = "";
        }

        protected void BtnBooksearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtmemberId.Text.Trim() != "" && txtbookid.Text.Trim() != "")
                {
                    GetBookIssueDetails(Convert.ToInt32(txtmemberId.Text.Trim()), Convert.ToInt32(txtbookid.Text.Trim()));
                }
                else
                {
                    lblmsg.Style.Add("display", "block");
                    AlertContent.InnerText = "Member Id and Book Id can't be blank";
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void BtnBookReturn_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtmemberId.Text!="" && txtMember.Text!="" && txtbookid.Text!="" && txtBooknm.Text!="" && txtIssueDt.Text!="" && txtTentativeBookReturnDt.Text!="" && CurrentStock>-1)
                {
                    string ActualReturn_DT = DateTime.Now.ToString("dd/MM/yyyy");
                    BusinessLayer Bl = new BusinessLayer();
                    bool status= Bl.AddBookReturn(Convert.ToInt32(txtmemberId.Text.Trim()), txtMember.Text.Trim(), Convert.ToInt32(txtbookid.Text.Trim()), txtBooknm.Text.Trim(), ActualReturn_DT, "true", CurrentStock);
                    if(!status)
                    {
                        GrdBookReturnList.DataBind();
                        Page.ClientScript.RegisterStartupScript(BtnBookReturn.GetType(), "show", "<script type=\"text/javascript\"> $('#BookReturnModal').modal('show');</script>", false);
                        txtbookid.Text = "";
                        txtMember.Text = "";
                        txtbookid.Text = "";
                        txtBooknm.Text = "";
                        txtIssueDt.Text = "";
                        txtTentativeBookReturnDt.Text = "";
                    }
                    else
                    {

                    }
                    
                }
                else
                {
                    lblmsg.Style.Add("display", "block");
                    AlertContent.InnerText = "There is some problem in Book Return";
                }
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}