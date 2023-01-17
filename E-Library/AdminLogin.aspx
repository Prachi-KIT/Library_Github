<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="E_Library.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .custom-color
        {
            background-color:black;
            color:white;
        }
    </style>

    <div class="container">
        <div class="row">
            <div class="col-md-6 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <img src="images/Admin_log.jpg" style="height:165px;width:500px;"/>                            
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-9 mx-auto">
                                <div class="form-group">
                                  <label style="font-weight:600">Email</label>
                                  <asp:TextBox ID="txtmail" runat="server" CssClass="form-control" placeholder="Enter Email"></asp:TextBox>
                                </div>
                            </div> 
                        </div>
                        
                        <div class="row">
                            <div class="col col-md-9 mx-auto">
                                 <div class="form-group">
                                      <label style="font-weight:600">Password</label>
                                      <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                       </div>
                        <div class="row">
                            <div class="col-md-9 mx-auto">
                                <asp:button ID="Btnlogin" type="button" class="btn btn-primary btn-block " Text="Login" runat="server" OnClick="Btnlogin_Click"></asp:button>           
                            </div>
                        </div>
                     </div>
                </div>
            </div>
         </div>
    </div>

</asp:Content>
