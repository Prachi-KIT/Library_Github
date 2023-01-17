<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminMemberManagement.aspx.cs" Inherits="E_Library.AdminMemberManagement" %>

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
            margin-bottom: 13px;
        }
        .auto-style1 {
            position: relative;
            display: -ms-flexbox;
            display: flex;
            -ms-flex-wrap: wrap;
            flex-wrap: wrap;
            -ms-flex-align: stretch;
            align-items: stretch;
            width: 100%;
            left: 0px;
            top: 0px;
        }
    </style>
    <div class="container-fluid">

        <div class="row">
            <div class="modal fade" id="MemberPopupModal"
                tabindex="-1" role="dialog"
                aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblMainMsg" Text="Member Deleted Succesfullyy  !!!!!"></asp:Label>
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
                                        <h4>Member Details</h4>
                                                                                   
                                            <img src="images/member.PNG" style="height: 200px; width: 410px;margin-left:15px;" />
                                        
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
                                                <div class="col-md-3">
                                                    
                                                    <label><strong>Member Id</strong></label>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <asp:TextBox ID="txtmemberid" runat="server" CssClass="form-control" placeholder="Member Id"></asp:TextBox>
                                                            <asp:LinkButton ID="lknSearch" runat="server" CssClass="btn btn-secondary" Text="Go" OnClick="lknSearch_Click"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-3">
                                                    <label><strong>Full Name</strong></label>
                                                    <asp:TextBox ID="txtMembernm" runat="server" CssClass="form-control" ReadOnly="true" placeholder="Name"></asp:TextBox>
                                                </div>
                                                <div class="col-md-6">
                                                    <label><strong>Account Status</strong></label>
                                                    <div class="form-group">
                                                        <div class="input-group">
                                                            <asp:TextBox ID="txtAccountStatus" runat="server" CssClass="form-control mr-1" placeholder="Account status" ReadOnly="true"></asp:TextBox>
                                                            <asp:LinkButton ID="lknstatusActive" runat="server" CssClass="btn btn-success mr-1" Text='<i class="fas fa-check-circle"></i>' OnClick="lknstatusActive_Click"></asp:LinkButton>
                                                            <asp:LinkButton ID="lknstatusPending" runat="server" CssClass="btn btn-warning mr-1" Text='<i class="fas fa-pause-circle"></i>' OnClick="lknstatusPending_Click"></asp:LinkButton>
                                                            <asp:LinkButton ID="lknstatusDeleted" runat="server" CssClass="btn btn-danger mr-1 " Text='<i class="fas fa-times-circle"></i>' OnClick="lknstatusDeleted_Click"></asp:LinkButton>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <div class="alert alert-success" id="statusnoti" runat="server" style="margin-top:4px;display:none">
                                                       <strong>User/Member status has been updated</strong>
                                                   </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>DOB</strong></label>
                                                    <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control" placeholder="Member Name" ReadOnly="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Contact</strong></label>
                                                    <asp:TextBox ID="txtcontact" runat="server" CssClass="form-control" placeholder="Contact" ReadOnly="true" TextMode="Number"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Email</strong></label>
                                                    <asp:TextBox ID="txtemail" runat="server" CssClass="form-control" placeholder="User Email" ReadOnly="true" TextMode="Email"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label><strong>State</strong></label>
                                                    <asp:DropDownList runat="server" ID="drpstate" CssClass="form-control"></asp:DropDownList>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>City</strong></label>
                                                    <asp:TextBox ID="txtcity" runat="server" CssClass="form-control" placeholder="User City" ReadOnly="true"></asp:TextBox>
                                                </div>
                                                <div class="col-md-4">
                                                    <label><strong>Pin Code</strong></label>
                                                    <asp:TextBox ID="txtpincode" runat="server" CssClass="form-control" placeholder="Pin Code" TextMode="Number" ReadOnly="true" MaxLength="10"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col">
                                                    <label><strong>Full Address</strong></label>
                                                    <asp:TextBox ID="txtaddress" runat="server" CssClass="form-control" ReadOnly="true" placeholder="" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-8 mx-auto">
                                                    <asp:Button ID="BtnDeleteMember" type="button" class="btn btn-danger btn btn-block" Text="Delete User Permanently" runat="server" OnClick="BtnDeleteMember_Click" data-target="#MemberPopupModal" data-toggle="modal"></asp:Button>
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
                                            <h4>Member List</h4>
                                            <center>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <hr />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT * FROM [member_master]"></asp:SqlDataSource>
                                        <asp:GridView ID="GrpIssueBookList" runat="server" CssClass="table table-striped table-bordered table-hover table-responsive" AutoGenerateColumns="False" DataKeyNames="member_id" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />                                                
                                                <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                                                <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                                                <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                                                <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                                                <asp:BoundField DataField="pincode" HeaderText="Pincode" SortExpression="pincode" />                                                
                                                <asp:BoundField DataField="account_status" HeaderText="Status" SortExpression="account_status" />
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
    </div>
</asp:Content>
