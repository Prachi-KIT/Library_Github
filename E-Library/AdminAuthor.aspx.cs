using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class AdminAuthor : System.Web.UI.Page
    {
        bool status;
        bool flg=true;
        string Authorstatus;
        BusinessLayer BL = new BusinessLayer();

        public void ClearControlsdata()
        {
            txtAuthorId.Text = "";
            txtAuthorNm.Text = "";
        }

        public bool CheckIfAuthorAlreadyExist(int authorId)
        {
           Authorstatus= BL.CheckIfAuthorAlreadyExist(authorId);
            if(Authorstatus!= "" && Authorstatus!=null)
            {
                if (Authorstatus == "Not found")
                {
                    return false;
                }
                return true;
            }
            return false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(flg)
                {
                    txtAuthorId.ReadOnly = true;
                    BtnAuthorSearch.Enabled = false;
                    txtAuthorId.Text = Convert.ToString(BL.GetAuthorId() + 1);
                    flg = false;
                    //txtAuthorId.ReadOnly = true;
                    //BtnAuthorSearch.Enabled = false;

                    //int AuthorId = BL.GetAuthorId();
                    //if (AuthorId < 0)
                    //{
                    //    txtAuthorId.Text = "1";
                    //}
                    //else
                    //{
                    //    txtAuthorId.Text = AuthorId.ToString();
                    //}
                    //flg = true;
                }                
            }
            else
            {
                if(!flg)
                {                    
                    flg = true;
                }
                else
                {
                    flg = false;
                }
                
            }
            lblIsblankAuthor.Style.Add("display", "none");
        }
    

        protected void BtnAuthorSearch_Click(object sender, EventArgs e)
        {
            if(txtAuthorId.Text.Trim()!="")
            {
                if(BL.SearchAuthorById(Convert.ToInt32(txtAuthorId.Text.Trim())) == "Not found")
                {
                    AlertCnt.Style.Add("display", "block");
                    lblmsg.InnerHtml = "Invalid Author Id";
                    txtAuthorNm.Text = "";
                }
                else
                {
                    AlertCnt.Style.Add("display", "none");
                    txtAuthorNm.Text = BL.SearchAuthorById(Convert.ToInt32(txtAuthorId.Text.Trim()));
                }
                
            }
            else
            {
                AlertCnt.Style.Add("display", "block");
                lblmsg.InnerHtml = "Author Id can't be blank";
            }
            
        }

        protected void BtnAddAuthor_Click(object sender, EventArgs e)
        {
            try
            {
                if(!CheckIfAuthorAlreadyExist(Convert.ToInt32(txtAuthorId.Text.Trim())))
                {
                    if(txtAuthorNm.Text.Trim().ToString()!="")
                    {
                        status = BL.AddAuthor(txtAuthorNm.Text.Trim());
                        if (status)
                        {
                                 Page.ClientScript.RegisterStartupScript(BtnAddAuthor.GetType(), "show", "<script type=\"text/javascript\"> $('#AdminAuthorAddedModal').modal('show');" +
                                "</script>", false);
                        }
                        flg = true;
                        ClearControlsdata();
                        txtAuthorId.Text = Convert.ToString(BL.GetAuthorId() + 1);
                        GrdAuthorDetails.DataBind();

                    }
                    else
                    {
                        AlertCnt.Style.Add("display", "block");
                        lblmsg.InnerHtml = "Please Enter author name";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Author Already Exist')<script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
                
        protected void BtnUpdateAuthor_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckIfAuthorAlreadyExist(Convert.ToInt32(txtAuthorId.Text.Trim())))
                {
                    status = BL.UpdateAuthor(txtAuthorNm.Text.Trim(), Convert.ToInt32(txtAuthorId.Text.Trim()));
                    if (!status)
                    {
                       Page.ClientScript.RegisterStartupScript(BtnAddAuthor.GetType(), "show1", "<script type=\"text/javascript\"> $('#AdminAuthorUpdateModal').modal('show');" +
                            "</script>", false);
                    }
                    txtAuthorId.ReadOnly = true;
                    BtnAuthorSearch.Enabled = false;
                    ClearControlsdata();
                    txtAuthorId.Text = Convert.ToString(BL.GetAuthorId() + 1);
                    GrdAuthorDetails.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Author Does not Exist')<script>");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void BtnDeleteAuthor_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckIfAuthorAlreadyExist(Convert.ToInt32(txtAuthorId.Text.Trim())))
                {
                    status = BL.DeleteAuthor(Convert.ToInt32(txtAuthorId.Text.Trim()));
                    if (!status)
                    {
                        Page.ClientScript.RegisterStartupScript(BtnAddAuthor.GetType(), "show2", "<script type=\"text/javascript\"> $('#AdminAuthorDeletedModal').modal('show');" +
                            "</script>", false);
                        flg = true;
                        txtAuthorId.ReadOnly = true;
                        BtnAuthorSearch.Enabled = false;
                        ClearControlsdata();
                        txtAuthorId.Text = Convert.ToString(BL.GetAuthorId() + 1);
                        GrdAuthorDetails.DataBind();
                    }
                    
                }
                else
                {
                    Response.Write("<script>alert('Author Does not Exist')<script>");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            flg = true;
            txtAuthorId.ReadOnly = false;
            BtnAuthorSearch.Enabled = true;
        }
    }
}