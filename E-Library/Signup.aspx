<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="E_Library.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        label {
            font-size: 15px;
            margin-bottom: 5px;
        }

        .form-control {
            margin-bottom: 8px;
        }

        .auto-style1 {
            position: relative;
            width: 100%;
            -ms-flex: 0 0 50%;
            flex: 0 0 50%;
            max-width: 50%;
            left: 0px;
            top: 0px;
            padding-left: 15px;
            padding-right: 15px;
        }
    </style>
    <div class="container">

        <div class="row">
            <div class="modal fade" id="PopupModal"
                tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblMainMsg" Text="User Sign Up succesfullyy  !!!!!"></asp:Label>
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
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">                                
                                 <img src="images/User Registration.gif" class="img-fluid" style="height: 290px; width: 670px;" />                                
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
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><strong>Full Name</strong></label>                                            
                                            <asp:TextBox ID="txtuser" runat="server" CssClass="form-control" placeholder="User Name"></asp:TextBox>                                            
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Full Name can not be blank" ControlToValidate="txtuser" ForeColor="Red"></asp:RequiredFieldValidator>
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
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Contact No. can not be blank" ControlToValidate="txtcontact" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="auto-style1">
                                            <label><strong>Email ID</strong></label>
                                            <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="User Email" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Email" ControlToValidate="txtemail" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <label><strong>State</strong></label>
                                            <asp:DropDownList runat="server" ID="drpstate" CssClass="form-control">
                                                <asp:ListItem Text="Uttar Pradesh" Value="Uttar Pradesh"></asp:ListItem>
                                                <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                                                <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                                                <asp:ListItem Text="Uttarakhand" Value="Uttarakhand"></asp:ListItem>
                                                <asp:ListItem Text="Madhya Pradesh" Value="Madhya Pradesh"></asp:ListItem>
                                                <asp:ListItem Text="Maharashtra" Value="Maharashtra"></asp:ListItem>
                                                <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                                                <asp:ListItem Text="West Bengal" Value="West Bengal"></asp:ListItem>
                                                <asp:ListItem Text="Chandigarh" Value="Chandigarh"></asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-md-4">
                                            <label><strong>City</strong></label>
                                            <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" placeholder="User City"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter City" ControlToValidate="txtcity" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-3">
                                            <label><strong>Pin Code</strong></label>
                                            <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" placeholder="Pin Code" TextMode="Number"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter Pincode." ControlToValidate="txtpincode" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <label><strong>Full Address</strong></label>
                                            <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" placeholder="" TextMode="MultiLine"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label><strong>User Id</strong></label>
                                            <asp:TextBox ID="txtuserId" runat="server" CssClass="form-control" placeholder="User Id"></asp:TextBox>
                                        </div>
                                        <div class="col-md-6">
                                            <label><strong>Password</strong></label>
                                            <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="txtpassword" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div id="ReCaptchContainer"></div>
                                             <asp:Label ID="lblMessage1" runat="server" CssClass="alert alert-danger" Visible="false" style="margin-top:10px;"></asp:Label>
                                             <br />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:Button ID="BtnSignUp" type="button" class="btn btn-success btn-block" Text="Signup" runat="server" OnClick="BtnSignUp_Click" ></asp:Button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
