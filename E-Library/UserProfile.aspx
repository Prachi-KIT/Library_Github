<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="E_Library.UserProfile" %>
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
            margin-bottom:8px;
        }
        .badge{
            width:50px;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="modal fade" id="UserUpdatedModal"
                tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                
                                <center><h3 style="color:#2732ed">User Details Updated</h3></center>
                                <%--<asp:Label runat="server" ID="lblMainMsg" Text="Book Details has been added successfully  !!!!!"></asp:Label>--%>
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
                                                <img src="images/user.png" style="height:120px;width:120px;"/>
                                            </center>         
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>User Profile</h4>
                                                <span style="font-size:17px">Account status -</span>
                                                <asp:Label ID="lblacc_status" runat="server" CssClass="badge badge-pill badge-info" style="width:90px;height:28px;font-size:17px">Status</asp:Label>
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
                                                          <label><strong>Full Name</strong></label>
                                                          <asp:TextBox ID="txtusernm" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>
                                                      </div>
                                                      <div class="col-md-6">
                                                          <label><strong>Date of Birth</strong></label>
                                                          <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                                                      </div>
                                                  </div>
                                                  <div class="row">
                                                      <div class="col-md-6">
                                                          <label><strong>Contact No</strong></label>
                                                          <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control" placeholder="Contact No" TextMode="Number"></asp:TextBox>
                                                      </div>
                                                      <div class="col-md-6">
                                                          <label><strong>Email ID</strong></label>
                                                          <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="User Email" TextMode="Email"></asp:TextBox>
                                                      </div>
                                                  </div>
                                                  <div class="row">
                                                      <div class="col-md-4">
                                                          <label><strong>State</strong></label>
                                                          <asp:DropDownList runat="server" ID="drpstate" CssClass="form-control">
                                                              <asp:ListItem Text="" Value=""></asp:ListItem>
                                                          </asp:DropDownList>
                                                      </div>
                                                      <div class="col-md-4">
                                                          <label><strong>City</strong></label>
                                                          <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" placeholder="User City"></asp:TextBox>
                                                      </div>
                                                      <div class="col-md-4">
                                                          <label><strong>Pin Code</strong></label>
                                                          <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                                      </div>
                                                  </div>
                                               
                                            <div class="row">
                                                <div class="col">
                                                    <label><strong>Full Address</strong></label>
                                                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="User Id" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                              <div class="col-md-2">
                                                    <label><strong>User Id</strong></label>
                                                    <asp:TextBox ID="txtuserId" runat="server" CssClass="form-control" ReadOnly="true" placeholder="User Id"></asp:TextBox>
                                                </div>
                                              <div class="col-md-5">
                                                    <label><strong>Old Password</strong></label>
                                                    <asp:TextBox ID="txtpassword" runat="server" ReadOnly="true" CssClass="form-control" placeholder="Old password"></asp:TextBox>
                                              </div>
                                              <div class="col-md-5">
                                                    <label><strong>New Password</strong></label>
                                                    <asp:TextBox ID="txtnewpwd" runat="server" CssClass="form-control" placeholder="New password" TextMode="Password"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top:20px;">
                                                <div class="col-md-6 mx-auto"> 
                                                    <center>
                                                        <asp:button ID="BtnUserUpdate" type="button" class="btn btn-success btn btn-block" Text="Update" runat="server" OnClick="BtnUserUpdate_Click"></asp:button>
                                                    </center>
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
                                                <img src="images/book.png" style="height:120px;width:120px;"/>
                                            </center>         
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <center>
                                                <h4>Your Issue Books</h4>
                                                <asp:Label ID="Label1" runat="server" CssClass="badge badge-pill badge-info">Issue Book Status</asp:Label>
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
                                             <asp:GridView ID="GrdDetails" runat="server" CssClass="table table-striped table-bordered"></asp:GridView>
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
