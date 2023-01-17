using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class Adminpublisher : System.Web.UI.Page
    {
        bool status;
        bool flg = true;
        string PublisherStatus;
        BusinessLayer BL = new BusinessLayer();

        public void ClearControlsdata()
        {
            txtpublisherId.Text = "";
            txtPublisherNm.Text = "";
        }

        public bool CheckIfPublisherAlreadyExist(int authorId)
        {
            PublisherStatus = BL.CheckIfPublisherAlreadyExist(authorId);
            if (PublisherStatus != "" && PublisherStatus != null)
            {
                if (PublisherStatus == "Not found")
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
                if (flg)
                {
                    txtpublisherId.ReadOnly = true;
                    BtnSearch.Enabled = false;
                    txtpublisherId.Text = Convert.ToString(BL.GetPublisherId() + 1);
                    flg = false;
                    txtpublisherId.ReadOnly = true;
                    BtnSearch.Enabled = false;

                    int PublisherId = BL.GetPublisherId();
                    if (PublisherId < 0)
                    {
                        txtpublisherId.Text = "1";
                    }
                    else
                    {
                        txtpublisherId.Text = txtpublisherId.Text.ToString();
                    }
                    flg = true;
                }
            }
            else
            {
                if (!flg)
                {
                    flg = true;
                }
                else
                {
                    flg = false;
                }

            }
            AlertCnt.Style.Add("display", "none");
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (txtpublisherId.Text.Trim() != "")
            {
                if (BL.SearchPublisherById(Convert.ToInt32(txtpublisherId.Text.Trim())) == "Not found")
                {
                    AlertCnt.Style.Add("display", "block");
                    lblmsg.InnerHtml = "Invalid Publisher Id";
                    txtPublisherNm.Text = "";
                }
                else
                {
                    AlertCnt.Style.Add("display", "none");
                    txtPublisherNm.Text = BL.SearchPublisherById(Convert.ToInt32(txtpublisherId.Text.Trim()));
                }

            }
            else
            {
                AlertCnt.Style.Add("display", "block");
                lblmsg.InnerHtml = "Publisher Id can't be blank";
            }

        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckIfPublisherAlreadyExist(Convert.ToInt32(txtpublisherId.Text.Trim())))
                {
                    if (txtPublisherNm.Text.Trim().ToString() != "")
                    {
                        status = BL.AddPublisher(txtPublisherNm.Text.Trim());
                        if (status)
                        {
                            Page.ClientScript.RegisterStartupScript(BtnAdd.GetType(), "show", "<script type=\"text/javascript\"> $('#AdminAuthorAddedModal').modal('show');" +
                           "</script>", false);
                        }
                        flg = true;
                        ClearControlsdata();
                        txtpublisherId.Text = Convert.ToString(BL.GetPublisherId() + 1);
                        GrdPublisherDetails.DataBind();

                    }
                    else
                    {
                        AlertCnt.Style.Add("display", "block");
                        lblmsg.InnerHtml = "Please Enter Publisher name";
                    }
                }
                else
                {
                    Response.Write("<script>alert('Publisher Already Exist')<script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void BtnEdit_Click(object sender, EventArgs e)
        {
            flg = true;
            txtpublisherId.ReadOnly = false;
            BtnSearch.Enabled = true;
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckIfPublisherAlreadyExist(Convert.ToInt32(txtpublisherId.Text.Trim())))
                {
                    status = BL.UpdatePublisher(txtPublisherNm.Text.Trim(), Convert.ToInt32(txtpublisherId.Text.Trim()));
                    if (!status)
                    {
                        Page.ClientScript.RegisterStartupScript(BtnAdd.GetType(), "show1", "<script type=\"text/javascript\"> $('#AdminAuthorUpdateModal').modal('show');" +
                             "</script>", false);
                    }
                    txtpublisherId.ReadOnly = true;
                    BtnSearch.Enabled = false;
                    ClearControlsdata();
                    txtpublisherId.Text = Convert.ToString(BL.GetPublisherId() + 1);
                    GrdPublisherDetails.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Publisher Does not Exist')<script>");
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (CheckIfPublisherAlreadyExist(Convert.ToInt32(txtpublisherId.Text.Trim())))
                {
                    status = BL.DeletePublisher(Convert.ToInt32(txtpublisherId.Text.Trim()));
                    if (!status)
                    {
                        Page.ClientScript.RegisterStartupScript(BtnAdd.GetType(), "show2", "<script type=\"text/javascript\"> $('#AdminAuthorDeletedModal').modal('show');" +
                            "</script>", false);
                        flg = true;
                        txtpublisherId.ReadOnly = true;
                        BtnSearch.Enabled = false;
                        ClearControlsdata();
                        txtpublisherId.Text = Convert.ToString(BL.GetPublisherId() + 1);
                        GrdPublisherDetails.DataBind();
                    }

                }
                else
                {
                    Response.Write("<script>alert('Publisher Does not Exist')<script>");
                }
            }
            catch (Exception ex)
            {

            }
        }
    }
}