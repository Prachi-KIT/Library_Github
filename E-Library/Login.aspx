<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Library.Login" %>
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
                                <center>
                                <img src="images/userlogin.png" style="height:150px;width:150px;"/>
                            </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                  <h3>Member Login</h3>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                  <label style="font-weight:600">User Email</label>
                                  <asp:TextBox ID="txtusermail" runat="server" CssClass="form-control" placeholder="User Email"></asp:TextBox>
                                </div>
                            </div> 
                        </div>                        
                        <div class="row">
                            <div class="col">
                                 <div class="form-group">
                                      <label style="font-weight:600">User Password</label>
                                      <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="User Password" TextMode="Password"></asp:TextBox>
                                </div>
                            </div>
                       </div>
                        <div class="row">                            
                            <div class="col-md-8"> 
                                <div class="form-group">
                                    <asp:CheckBox ID="chkremember" runat="server" Text="Remember me"></asp:CheckBox>
                                </div>
                            </div>                            
                            <div class="col-md-4"> 
                                    <div class="form-group">
                                        <asp:LinkButton id="lknforgetpwd" runat="server" Text="forget password?"></asp:LinkButton>
                                    </div>
                            </div>                                
                         </div>                      
                        <div class="row">
                            <div class="col">
                                <asp:button ID="Btnlogin" type="button" class="btn btn-primary btn-block " Text="Login" runat="server" OnClick="Btnlogin_Click"></asp:button>
                                <asp:button ID="BtnSignup" type="button" class="btn btn-block custom-color" Text="Sign Up" runat="server" OnClick="BtnSignup_Click"></asp:button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="alert alert-danger" id="errormsg" runat="server" style="margin-top:10px;display:none">
                                   <strong id="lblmsg" runat="server">You have Entered Wrong UserMail and passwrd</strong>
                                </div>
                            </div>                            
                        </div>
                        
                     </div>
                </div>
            </div>
        </div>
     </div>
         

</asp:Content>
