using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AppBusinessLayer;

namespace E_Library
{
    public partial class BookInventory : System.Web.UI.Page
    {
        static string global_filepath;
        static int global_actualstock, global_currentstock, global_issuedbooks;

        public void CheckIfBooksExists()
        {

        }

        public void ClearControlsdata()
        {
            txtbookId.Text = "";
            txtbookNm.Text = "";
            txtbookdesc.Text = "";
            txtbookCost.Text = "";
            txtactualCost.Text = "";
            txtcurrentCost.Text = "";
            txtEdition.Text = "";
            txtpages.Text = "";
            txtpublishDt.Text = "";
            txtIssueBook.Text = "";
            txtbookCost.Text = "";
            drpAuthor.SelectedIndex = -1;
            drplang.SelectedIndex = -1;
            drppublisherNm.SelectedIndex = -1;

        }
        BusinessLayer BL = new BusinessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                
                GrpIssueBookList.DataBind();
                ArrayList Authors = BL.FillAuthor();
                drpAuthor.DataSource = Authors;
                drpAuthor.DataBind();
                ArrayList Publishers = BL.FillPublishers();
                drppublisherNm.DataSource = Publishers;
                drppublisherNm.DataBind();
            }   
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            string publishdt = txtpublishDt.ToString();
            string genres="";
            foreach (int  index in lstGenre.GetSelectedIndices())
            {
                genres = genres + lstGenre.Items[index] + ",";
            }
            genres = genres.Remove(genres.Length - 1);

            string filepath = "~/Img_Book_Inventory/book.png";
            string filenm = Path.GetFileName(fleupload.PostedFile.FileName);
            fleupload.SaveAs(Server.MapPath("Img_Book_Inventory/"+filenm));
            filepath = "~/Img_Book_Inventory/" + filenm;
            
            BL.AddBookDetails(filepath.ToString(),txtbookNm.Text.Trim(),genres,drpAuthor.Text.Trim(),drppublisherNm.Text.Trim(),txtpublishDt.Text.Trim(),drplang.Text.Trim(),
                             txtEdition.Text.Trim(),Convert.ToInt32(txtbookCost.Text.Trim()),Convert.ToInt32(txtpages.Text.Trim()),
                             Convert.ToInt32(txtactualCost.Text.Trim()),1,
                             txtbookdesc.Text.Trim(),1);
            ClearControlsdata();
            GrpIssueBookList.DataBind();
            Page.ClientScript.RegisterStartupScript(btnAdd.GetType(), "show", "<script type=\"text/javascript\"> $('#BookAddedModal').modal('show');</script>", false);
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int actual_stock = Convert.ToInt32(txtactualCost.Text);
            int current_stock = Convert.ToInt32(txtcurrentCost.Text);
            if(global_actualstock!=actual_stock)
            {
                if(actual_stock<global_issuedbooks)
                {
                    Response.Write("<script>alert('Actual stock value can't be less than Issued books - ')</script>");
                    return;
                }
                else
                {
                    current_stock = actual_stock - global_actualstock;
                    txtcurrentCost.Text = current_stock.ToString();
                }
            }

            string genres = "";
            foreach (int index in lstGenre.GetSelectedIndices())
            {
                genres = genres + lstGenre.Items[index] + ",";
            }
            genres = genres.Remove(genres.Length - 1);

            
            string filepath = "~/Img_Book_Inventory/book.png";
            string filenm = Path.GetFileName(fleupload.PostedFile.FileName);
            
            if(filenm=="" || filenm == null)
            {
                filepath = global_filepath;
            }
            else
            {
                fleupload.SaveAs(Server.MapPath("Img_Book_Inventory/" + filenm));
                filepath = "~/Img_Book_Inventory/" + filenm;
            }

            BL.UpdateBookDetailsByBookId(Convert.ToInt32(txtbookId.Text.Trim()),filepath.ToString(), txtbookNm.Text.Trim(), genres, 
                                         drpAuthor.SelectedItem.Value.Trim(), drppublisherNm.SelectedItem.Value.Trim(), txtpublishDt.Text.Trim(), drplang.SelectedItem.Value.Trim(),
                                         txtEdition.Text.Trim(), Convert.ToInt32(txtbookCost.Text.Trim()), Convert.ToInt32(txtpages.Text.Trim()),
                                         Convert.ToInt32(txtactualCost.Text.Trim()), 1,txtbookdesc.Text.Trim(), 1);

            ClearControlsdata();
            GrpIssueBookList.DataBind();
            Page.ClientScript.RegisterStartupScript(btnAdd.GetType(), "show", "<script type=\"text/javascript\"> $('#BookDetailsUpdatedModal').modal('show');</script>", false);
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            BL.DeleteBooksDetails(Convert.ToInt32(txtbookId.Text.Trim()));
            ClearControlsdata();
            GrpIssueBookList.DataBind();
            Page.ClientScript.RegisterStartupScript(btnAdd.GetType(), "show", "<script type=\"text/javascript\"> $('#BookDeletedModal').modal('show');</script>", false);
        }

        protected void lknBookSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtbookId.Text.Trim()!="")
                {
                    Business_BookDetails b;
                    b = BL.GetBooksDetailWithBookId(Convert.ToInt32(txtbookId.Text.Trim()));
                    txtbookNm.Text = b.BookName;
                    if(txtbookNm.Text== "Book not found with this Id")
                    {
                        txtbookNm.Text = "";
                        this.statusnoti.InnerHtml = "Book not found";
                        statusnoti.Attributes.Add("Class", "alert alert-warning");
                        statusnoti.Style.Add("display", "block");
                    }
                    else
                    {
                        drplang.SelectedValue = b.Language;
                        if (b.AuthorName != null && b.AuthorName != "")
                        {
                            drpAuthor.SelectedValue = b.AuthorName.Trim();
                            drpAuthor.SelectedItem.Text = b.AuthorName.Trim();
                        }

                        lstGenre.SelectedValue = b.genre.ToString().Trim();
                        drppublisherNm.SelectedValue = b.PublisherName;
                        txtpublishDt.Text = b.Publish_dt;
                        txtEdition.Text = b.Edition;
                        txtbookCost.Text = b.book_cost.ToString();
                        txtpages.Text = b.no_of_pages.ToString();
                        txtactualCost.Text = b.actual_stock.ToString();
                        txtcurrentCost.Text = b.current_Stock.ToString();
                        txtIssueBook.Text = "" + (Convert.ToInt32(b.current_Stock.ToString()) - Convert.ToInt32(b.actual_stock.ToString()));
                        txtbookdesc.Text = b.Book_desc;
                        global_filepath = b.Bookimg_link.ToString();
                        //fleupload = global_filepath.ToString();
                        lstGenre.ClearSelection();
                        string[] genres = b.genre.ToString().Trim().Split(',');
                        for (int i = 0; i < genres.Length; i++)
                        {
                            for (int j = 0; j < lstGenre.Items.Count; j++)
                            {
                                if (lstGenre.Items[j].ToString() == genres[i])
                                {
                                    lstGenre.Items[j].Selected = true;
                                }

                            }
                        }
                    }
                    

                    global_actualstock = b.actual_stock;
                    global_currentstock = b.current_Stock;
                    global_issuedbooks = b.no_of_issuedbook;
                    global_filepath = b.Bookimg_link.ToString();
                    
                }
                else
                {
                    Response.Write("<script>alert('Book Id can't be blank')</script>");
                }
            }
            catch (Exception ex)
            {

                throw;
            }
            
            
            
        }

        protected void lstGenre_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}