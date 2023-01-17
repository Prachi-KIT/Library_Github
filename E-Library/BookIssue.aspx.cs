using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class BookIssue : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            GrpIssueBookList.DataBind();
            lblBookandMemberAvailability.Style.Add("display", "none");
        }       


       public string GetMemberDetails(int memberId,int BookId)
        {
            try
            {
                BusinessLayerL_MemberAndBook MAB = new BusinessLayerL_MemberAndBook();
                MAB = BL.GetMemberAndBookNames(memberId, BookId);                            
                if(MAB.BookName== "Book not found with this Id" || MAB.MemberName== "Member not found with this Id")
                {
                    txtBooknm.Text = "";
                    txtMember.Text = "";
                    return "Book or Member not found with these Id's";                    
                }
                else
                {
                    txtBooknm.Text = MAB.BookName;
                    txtMember.Text = MAB.MemberName;
                    txtAv_Stock.Text = MAB.Aval_stock.ToString();
                    
                    HtmlImage image = new HtmlImage();
                    image.Src = MAB.BookImgPath;
                    image.Alt = "updated";
                    image.ID = "imgupdated";
                    image.Attributes.Add("class", "img-fluid");
                    books_img.Controls.Add(image);
                    return "Book and Member found.";
                }                                   
            }
            catch (Exception ex)
            {
                throw;
            }
            
        }

        protected void BtnBooksearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtbookid.Text.Trim() != "" && txtmemberId.Text.Trim() != "")
                {
                    if (GetMemberDetails(Convert.ToInt32(txtmemberId.Text.Trim()), Convert.ToInt32(txtbookid.Text.Trim()))
                        == "Book or Member not found with these Id's")
                    {
                        lblvalidation.InnerHtml = "Book or Member not found with these Id's";
                        lblBookandMemberAvailability.Style.Add("display", "block");
                    }                    
                }
                else
                {
                    lblvalidation.InnerHtml = "Book Id or Member Id can't be blank";
                    lblBookandMemberAvailability.Style.Add("display", "block");                    
                }
            }
            catch (Exception ex)
            {
                lblBookandMemberAvailability.Style.Add("display", "block");
                Response.Write(@"<script language='javascript'>alert('Some error is occured." + ex.Message+"')</script>");
                
            }
            
            
        }

        protected void BtnBookIssue_Click1(object sender, EventArgs e)
        {
            try
            {
                if (txtbookid.Text.Trim() != "" && txtmemberId.Text.Trim() != "")
                {
                    BusinessLayerL_MemberAndBook MAB = new BusinessLayerL_MemberAndBook();
                    MAB = BL.GetMemberAndBookNames(Convert.ToInt32(txtmemberId.Text.Trim()), Convert.ToInt32(txtbookid.Text.Trim()));
                    if (MAB.BookName == txtBooknm.Text && MAB.MemberName == txtMember.Text)
                    {
                        if(MAB.Aval_stock > 0)
                        {
                            if (!BookIssueEntryExist())
                            {
                                string IssueDt = DateTime.Now.ToString("dd/MM/yyyy");
                                String Aprrox_returnDT = string.Empty;
                                if (drpIssueType.SelectedItem.ToString() == "1 Day")
                                {
                                    Aprrox_returnDT = DateTime.Now.AddDays(1).ToString("dd/MM/yyyy");
                                }
                                else if (drpIssueType.SelectedItem.ToString() == "1 Week")
                                {
                                    Aprrox_returnDT = DateTime.Now.AddDays(7).ToString("dd/MM/yyyy");
                                }
                                else if (drpIssueType.SelectedItem.ToString() == "2 Weeks")
                                {
                                    Aprrox_returnDT = DateTime.Now.AddDays(15).ToString("dd/MM/yyyy");
                                }
                                else if (drpIssueType.SelectedItem.ToString() == "10 Days")
                                {
                                    Aprrox_returnDT = DateTime.Now.AddDays(10).ToString("dd/MM/yyyy");
                                }
                                bool status = BL.AddBookIssueDetails(Convert.ToInt32(txtmemberId.Text.Trim()), txtMember.Text, Convert.ToInt32(txtbookid.Text.Trim()), txtBooknm.Text, IssueDt.ToString(), Aprrox_returnDT, "false");
                                if (!status)
                                {                                    
                                    GrpIssueBookList.DataBind();
                                    txtbookid.Text = "";
                                    txtBooknm.Text = "";
                                    txtmemberId.Text = "";
                                    txtMember.Text = "";
                                    Page.ClientScript.RegisterStartupScript(BtnBookIssue.GetType(), "show", "<script type=\"text/javascript\"> $('#BookIssuedModal').modal('show');</script>", false);
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Book is  already issued By this member on Date -')</script>");
                            }
                        }
                        else
                        {
                            Div1.Style.Add("display", "block");                           
                        }
                        
                    }
                    else
                    {
                        Page.ClientScript.RegisterStartupScript(BtnBookIssue.GetType(), "show", "<script type=\"text/javascript\"> $('#BookIssuedModal').modal('show');</script>", false);
                        Response.Write("<script>alert('Book or Member details is invalid')</script>");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Book or Member ID can't be blank')</script>");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            
        }

        public bool BookIssueEntryExist()
        {
            return false;
        }
    }
}