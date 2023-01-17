<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BookReturn.aspx.cs" Inherits="E_Library.BookReturn1" %>
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
            <div class="modal fade" id="BookReturnModal"
                tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                <img src="images/book_return.gif" height="230" width="490"/>
                                <center><h3 style="color:#09c16c">Book Returned Sucessfully</h3></center>                                
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
                                                <h4>Book Return</h4>
                                                <img src="images/book-return.PNG" class="img-fluid"/>
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
                                        <div class="form-group">
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
                                                      <div class="col-12 alert alert-danger" id="lblmsg" runat="server" style="display:none;margin:10px 0;">
                                                          <strong id="AlertContent" runat="server"></strong>
                                                      </div>
                                                  </div>
                                                  <div class="row">
                                                      <div class="col-md-4">
                                                          <label><strong>Member Name</strong></label>
                                                          <asp:TextBox ID="txtMember" runat="server" CssClass="form-control" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                                      </div>
                                                      <div class="col-md-8">
                                                          <label><strong>Book Name</strong></label>
                                                          <asp:TextBox ID="txtBooknm" runat="server" CssClass="form-control" placeholder="Book Name" ReadOnly="true" ></asp:TextBox>
                                                      </div>
                                                  </div>
                                                  <div class="row">
                                                      
                                                      <div class="col-md-6">
                                                          <label><strong>Book Issue Date</strong></label>
                                                          <asp:TextBox ID="txtIssueDt" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Book Issue Date"></asp:TextBox>
                                                      </div>
                                                      <div class="col-md-6">
                                                          <label><strong>Tentative Book Return Date</strong></label>
                                                          <asp:TextBox ID="txtTentativeBookReturnDt" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Tentative Return Date"></asp:TextBox>
                                                      </div>
     
                                                  </div>
                                                  <div class="row">
                                                     <div class="col-md-8 mx-auto"> 
                                                        <asp:button ID="BtnBookReturn" type="button" class="btn btn-success btn btn-block" Text="Book Return" runat="server" OnClick="BtnBookReturn_Click"></asp:button>
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

           <div class="col-md-7">
                    <div class="row">
                        <div class="col">
                            <div class="card">
                                 <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>Return Book List</h4>
                                            <center>
                                        </div>
                                    </div>
                                     <div class="row">
                                        <div class="col">
                                            <hr/>
                                        </div>
                                    </div>
                                     <div class="row">
                                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT * FROM [tbl_BookIssue] where Is_Return='true'"></asp:SqlDataSource>
                                         <div class="col">
                                             <asp:GridView ID="GrdBookReturnList" runat="server" CssClass="table table-hover table-responsive table-striped table-bordered" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                                                 <Columns>                                                     
                                                     <asp:BoundField DataField="member_nm" HeaderText="Member Name" SortExpression="member_nm" />                                                     
                                                     <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" ItemStyle-Width="185px" />
                                                     <asp:BoundField DataField="issue_dt" HeaderText="Issue Date" SortExpression="issue_dt" ItemStyle-Width="150px"/>
                                                     <asp:BoundField DataField="book_approx_returnDT" HeaderText="Tentative Return" SortExpression="book_approx_returnDT" ItemStyle-Width="169px" />
                                                     <asp:BoundField DataField="book_returnDt" HeaderText="Book Return" SortExpression="book_returnDt" />
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
