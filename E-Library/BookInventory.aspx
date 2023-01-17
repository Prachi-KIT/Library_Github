<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookInventory.aspx.cs" Inherits="E_Library.BookInventory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
    <script type="text/javascript">
        function ReadURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#ImgView').attr('src', e.target.result);
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <style>
            label {
                font-size: 15px;
                margin-bottom: 5px;
            }

            .form-control {
                margin-bottom: 13px;
            }
        </style>
        <div class="container-fluid">
            <div class="row">
                <div class="modal fade" id="BookAddedModal"
                    tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="lblMainMsg" Text="Book Details has been added successfully  !!!!!"></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="modal fade" id="BookDetailsUpdatedModal"
                    tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="Label1" Text="Book DetailsUpdated succesfully.."></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="modal fade" id="BookDeletedModal"
                    tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-body">
                                <div class="form-group">
                                    <asp:Label runat="server" ID="Label2" Text="Book details has been deleted"></asp:Label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close"></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-5">
                    <div>
                        <img src="images/book-racktrans.gif" />
                    </div>
                    <div>
                        <h3>A Room Without Books
                            <span style="font-weight: 500;">Like A Body Without A Soul. –</span>
                        </h3>
                    </div>
                </div>

                <div class="col-md-7">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <h4>Add Books Details</h4>
                                            <img id="ImgView" src="images/book-inventory.PNG" class="img-fluid" />
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col">
                                            <hr />
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:FileUpload ID="fleupload" runat="server" CssClass="form-control" onChange="ReadURL(this)" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>Book Id</strong></label>
                                                    <div class="input-group">
                                                        <asp:TextBox ID="txtbookId" runat="server" CssClass="form-control mr-1" placeholder="Book Id"></asp:TextBox>
                                                        <asp:LinkButton ID="lknBookSearch" runat="server" CssClass="btn btn-primary" Text="Go" OnClick="lknBookSearch_Click"></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <div class="col-md-8">
                                                    <label><strong>Book Name</strong></label>
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtbookNm" runat="server" CssClass="form-control" placeholder="Book Name"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="alert alert-success" id="statusnoti" runat="server" style="margin-top:4px;display:none">
                                                       <strong>Book not found with this Id</strong>
                                                   </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>Language</strong></label>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="drplang" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Hindi" Value="Hindi"></asp:ListItem>
                                                            <asp:ListItem Text="English" Value="English"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <label><strong>Publisher Name</strong></label>
                                                    <div class="form-group">

                                                        <asp:DropDownList ID="drppublisherNm" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Publisher 1" Value="Publisher 1"></asp:ListItem>
                                                            <asp:ListItem Text="Publisher 2" Value="Publisher 2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                </div>

                                                <div class="col-md-4">
                                                    <label><strong>Author</strong></label>
                                                    <div class="form-group">
                                                        <asp:DropDownList ID="drpAuthor" runat="server" CssClass="form-control">
                                                            <asp:ListItem Text="Author 1" Value="Author 1"></asp:ListItem>
                                                            <asp:ListItem Text="Author 2" Value="Author 2"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </div>

                                                    <label><strong>Publish Date</strong></label>
                                                    <div class="form-group">
                                                        <asp:TextBox ID="txtpublishDt" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                    </div>


                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Genre</strong></label>
                                                    <div class="form-group">
                                                        <asp:ListBox ID="lstGenre" runat="server" CssClass="form-control" SelectionMode="Multiple" Rows="5" OnSelectedIndexChanged="lstGenre_SelectedIndexChanged">
                                                            <asp:ListItem Text="Adventure" Value="Adventure"></asp:ListItem>
                                                            <asp:ListItem Text="Self Love" Value="Self Love"></asp:ListItem>
                                                            <asp:ListItem Text="Motivation" Value="Motivation"></asp:ListItem>
                                                        </asp:ListBox>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>Edition</strong></label>
                                                    <asp:TextBox runat="server" ID="txtEdition" placeholder="Edition" CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Book Cost(per pages)</strong></label>
                                                    <asp:TextBox ID="txtbookCost" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Pages</strong></label>
                                                    <asp:TextBox ID="txtpages" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>Actual stock</strong></label>
                                                    <asp:TextBox ID="txtactualCost" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Current Stock</strong></label>
                                                    <asp:TextBox ID="txtcurrentCost" runat="server" CssClass="form-control" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Issued Books</strong></label>
                                                    <asp:TextBox ID="txtIssueBook" runat="server" CssClass="form-control" TextMode="Number" ReadOnly="true"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label><strong>Book Description</strong></label>
                                                    <asp:TextBox ID="txtbookdesc" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-4">
                                                    <asp:Button ID="btnAdd" type="button" class="btn btn-success btn-block" Text="Add" runat="server" OnClick="btnAdd_Click"></asp:Button>
                                                </div>
                                                <div class="col-4">
                                                    <asp:Button ID="btnUpdate" type="button" class="btn btn-primary btn-block" Text="Update" runat="server" OnClick="btnUpdate_Click"></asp:Button>
                                                </div>
                                                <div class="col-4">
                                                    <asp:Button ID="btnDelete" type="button" class="btn btn-danger  btn-block" Text="Delete" runat="server" OnClick="btnDelete_Click"></asp:Button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row" style="margin-top: 30px;">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col">
                                    <center>
                                        <h4>Book Inventory List</h4>
                                    <center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <hr />
                                </div>
                            </div>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT book_nm,book_id,genre,author_nm,publisher_nm,publish_dt,language,edition,book_cost,actual_stock,current_Stock FROM [book_master]"></asp:SqlDataSource>
                            <div class="row">
                                <div class="col">
                                    <asp:GridView ID="GrpIssueBookList" runat="server" CssClass="table table-striped table-bordered table-hover table-responsive" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="book_id">
                                        <Columns>
                                            <asp:BoundField DataField="book_nm" HeaderText="Book Name" SortExpression="book_nm" ItemStyle-Width="200px" />
                                            <asp:BoundField DataField="genre" HeaderText="Genre" SortExpression="genre" ItemStyle-Width="250px" />
                                            <asp:BoundField DataField="author_nm" HeaderText="Author Name" SortExpression="author_nm" ItemStyle-Width="150px" />
                                            <asp:BoundField DataField="publisher_nm" HeaderText="Publisher Name" SortExpression="publisher_nm" ItemStyle-Width="140px" />
                                            <asp:BoundField DataField="publish_dt" HeaderText="Publish Date" SortExpression="publish_dt" />
                                            <asp:BoundField DataField="language" HeaderText="Language" SortExpression="language" />
                                            <asp:BoundField DataField="edition" HeaderText="Edition" SortExpression="edition" />
                                            <asp:BoundField DataField="book_cost" HeaderText="Book_cost" SortExpression="book_cost" />
                                            <asp:BoundField DataField="actual_stock" HeaderText="Stock" SortExpression="actual_stock" />
                                            <asp:BoundField DataField="current_Stock" HeaderText="Current Stock" SortExpression="current_Stock" />
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
