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
using AppBusinessLayer;

namespace E_Library
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                BusinessLayer ob = new BusinessLayer();
                int memberId = ob.GetMemberId();
                if (memberId < 0)
                {
                    txtuserId.Text = "user-id0";
                }
                else
                {
                    memberId = memberId + 1;
                    txtuserId.Text = "user-id" + memberId;
                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void BtnSignUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (IsReCaptchValid())
                {
                    if(Page.IsValid)
                    {
                        BusinessLayer obj = new BusinessLayer();
                        bool status = obj.AddMember(txtuser.Text.Trim(), txtDOB.Text.Trim(), Convert.ToInt64(txtcontact.Text.ToString()), txtemail.Text.Trim(), drpstate.SelectedItem.Value.Trim(), txtcity.Text.Trim(), txtpincode.Text.Trim(), txtaddress.Text.Trim(), txtpassword.Text.Trim(), "Pending");
                        if (!status)
                        {
                            txtuser.Text = "";
                            txtDOB.Text = "";
                            txtcontact.Text = "";
                            txtemail.Text = "";
                            txtcity.Text = "";
                            txtpincode.Text = "";
                            txtaddress.Text = "";
                            txtpassword.Text = "";
                            drpstate.SelectedIndex = -1;
                            BtnSignUp.Attributes.Add("data-target", "#PopupModal");
                            BtnSignUp.Attributes.Add("data-toggle", "modal");
                            Page.ClientScript.RegisterStartupScript(BtnSignUp.GetType(), "show", "<script type=\"text/javascript\"> $('#PopupModal').modal('show');</script>", false);
                        }
                    }
                    
                }
                else
                {
                    lblMessage1.Visible = true;
                    lblMessage1.Style.Add("display", "block");
                    //lblMessage1.Text = "Captcha is invalid";
                    txtuser.Text = "";
                    txtDOB.Text = "";
                    txtcontact.Text = "";
                    txtemail.Text = "";
                    txtcity.Text = "";
                    txtpincode.Text = "";
                    txtaddress.Text = "";
                    txtpassword.Text = "";
                    drpstate.SelectedIndex = -1;
                }

                
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('"+ex.Message+"');</script>");

            }
            
        }

        public bool IsReCaptchValid()
        {
            var result = false;
            var captchaResponse = Request.Form["g-recaptcha-response"];
            var secretKey = "6Ld2T30iAAAAAGtjTppHmOxzonGWHjS_AH8LhBMH";
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = (isSuccess) ? true : false;
                }
            }
            return result;
        }
    }
}