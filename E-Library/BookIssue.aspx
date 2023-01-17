<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookIssue.aspx.cs" Inherits="E_Library.BookIssue" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        label
        {
            font-size:15px;
            margin-bottom:5px;
        }
        .form-control
        {
            margin-bottom:13px;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="modal fade" id="BookIssuedModal"
                tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                <img src="images/success.png" height="220" width="515"/>
                                <center><h3 style="color:#09c16c">Book Issued Sucessfully</h3></center>                                
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
                <div class="row">
                       <div class="col">
                           <div class="card">
                               <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>Book Issuing</h4>
                                                <img src="images/book.png" style="height:120px;width:120px;"/>
                                            </center>         
                                        </div>
                                    </div>
                                 
                                    <div class="row">
                                        <div class="col">
                                            <hr/>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">                                        
                                                <div class="row">
                                                    <div class="col-md-5"></div>
                                                    <div class="col-md-7 form-group">
                                                        <button ID="BtnAllbooks" runat="server" type="button" class="btn" data-toggle="collapse" data-target="#demo"><span style="color:#0a2aa5;font-weight:600"><i class="fa-solid fa-star"></i><i class="fa-solid fa-star"></i> Click here to get list of books.</span></button>
                                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT [book_id], [book_nm] FROM [book_master]"></asp:SqlDataSource>                                                   
                                                    </div> 
                                                    <div class="col collapse in" id="demo">
                                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="book_id">
                                                            <Columns>
                                                                <asp:BoundField DataField="book_id" HeaderText="book_id" InsertVisible="False" ReadOnly="True" SortExpression="book_id" />
                                                                <asp:BoundField DataField="book_nm" HeaderText="book_nm" SortExpression="book_nm" />
                                                            </Columns>
                                                        </asp:GridView>
                                                   </div>  
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <label><strong>Member Id</strong></label>
                                                        <asp:TextBox ID="txtmemberId" runat="server" CssClass="form-control" placeholder="Member Id"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label><strong>Book Id</strong></label>
                                                        <div class="form-group">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="txtbookid" runat="server" CssClass="form-control" placeholder="Book Id"></asp:TextBox>
                                                                <asp:Button ID="BtnBooksearch" runat="server" CssClass="btn btn-secondary" Text="Go" OnClick="BtnBooksearch_Click" />
                                                            </div>
                                                        </div>
                                                    </div>
                                               </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="alert alert-danger" id="lblBookandMemberAvailability" runat="server" style="margin-top:4px;display:none">
                                                       <strong id="lblvalidation" runat="server">Fill valid Book id or Member Id</strong>
                                                   </div>
                                                </div>
                                            </div>
                                                <div class="row">
                                                    <div class="col-md-5">
                                                        <label><strong>Member Name</strong></label>
                                                        <asp:TextBox ID="txtMember" runat="server" CssClass="form-control" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-7">
                                                        <label><strong>Select Book Issue Days/Week</strong></label>
                                                        <asp:DropDownList ID="drpIssueType" runat="server" CssClass="form-control">
                                                            <asp:ListItem>1 Day</asp:ListItem>
                                                            <asp:ListItem>1 Week</asp:ListItem>
                                                            <asp:ListItem>2 Weeks</asp:ListItem>
                                                            <asp:ListItem>10 Days</asp:ListItem>
                                                        </asp:DropDownList>                                                        
                                                    </div>
                                                    
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-9">
                                                        <label><strong>Book Name</strong></label>
                                                        <asp:TextBox ID="txtBooknm" runat="server" CssClass="form-control" placeholder="Book Name" ReadOnly="true" ></asp:TextBox>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <label><strong>Av. Stock</strong></label>
                                                        <asp:TextBox ID="txtAv_Stock" runat="server" CssClass="form-control" placeholder="Avl. Stock" ReadOnly="true" ></asp:TextBox>
                                                    </div>     
                                                </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="alert alert-danger" id="Div1" runat="server" style="margin-top:4px;display:none">
                                                       <strong id="Av_stock" runat="server">Book is out of Stock...</strong>
                                                   </div>
                                                </div>
                                            </div>
                                                <div class="row" id="books_img" runat="server">

                                                </div>
                                                <div class="row">
                                            <div class="col-md-7 mx-auto"> 
                                                <asp:button  Id ="BtnBookIssue" type="button" class="btn btn-primary btn btn-block" Text="Book Issue" runat="server" OnClick="BtnBookIssue_Click1"></asp:button>
                                            </div>                                                
                                            </div>
                                         
                                      </div>
                                    </div>
                                    
                               </div>
                           </div>
                       </div>
                </div>
            </div>

           <div class="col-md-7">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                 <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>Your Issued Book List</h4>
                                            <center>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col">
                                            <hr/>
                                        </div>
                                    </div>
                                     <div class="row">
                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT * FROM [tbl_BookIssue]"></asp:SqlDataSource>
                                         <div class="col">
                                             <asp:GridView ID="GrpIssueBookList" runat="server" CssClass="table table-striped table-bordered table-responsive table-hover" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                                 <Columns>
                                                     <asp:BoundField DataField="member_id" HeaderText="Member Id" SortExpression="member_id" />
                                                     <asp:BoundField DataField="member_nm" HeaderText="Member" SortExpression="member_nm" ItemStyle-Width="150px" />
                                                     <asp:BoundField DataField="book_id" HeaderText="BookId" SortExpression="book_id" />
                                                     <asp:BoundField DataField="book_name" HeaderText="Book" SortExpression="book_name" ItemStyle-Width="180px" />
                                                     <asp:BoundField DataField="issue_dt" HeaderText="issue date" SortExpression="issue_dt" ItemStyle-Width="115px" />
                                                     <asp:BoundField DataField="book_approx_returnDT" HeaderText="Tentative Return Date" SortExpression="due_dt"  ItemStyle-Width="115px"/>
                                                 </Columns>
                                             </asp:GridView>
                                         </div>
                                     </div>
                                  </div>
                            </div>
                        </div>
                    </div>
            </div>

        </div>
    </div>
</asp:Content>
