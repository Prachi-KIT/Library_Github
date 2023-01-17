<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adminpublisher.aspx.cs" Inherits="E_Library.Adminpublisher" %>

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

        .space {
            margin-top: 10px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h3>Publisher Details</h3>
                                <img src="images/book-publish.gif" style="height: 240px; width: 400px;" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label style="font-weight: 600">Publisher Id</label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtpublisherId" runat="server" CssClass="form-control" placeholder="Id"></asp:TextBox>
                                                    <asp:Button ID="BtnSearch" type="button" class="btn btn-success" Text="Go" runat="server" OnClick="BtnSearch_Click"></asp:Button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-8">
                                            <label style="font-weight: 600">Publisher Name</label>
                                            <asp:TextBox ID="txtPublisherNm" runat="server" CssClass="form-control" placeholder="Publisher Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div id="AlertCnt" class="alert alert-danger" runat="server" style="display:none;margin-top:40px;">
                                                <strong id="lblmsg" runat="server">Invalid Publisher Id</strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnAdd" type="button" class="btn btn-success btn btn-block space" Text="Add" runat="server" OnClick="BtnAdd_Click"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnEdit" type="button" class="btn btn-secondary btn btn-block space" Text="Edit" runat="server" OnClick="BtnEdit_Click"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnUpdate" type="button" class="btn btn-primary btn btn-block space" Text="Update" runat="server" OnClick="BtnUpdate_Click"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnDelete" type="button" class="btn btn-danger btn btn-block space" Text="Delete" runat="server" OnClick="BtnDelete_Click"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Publisher List</h4>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT * FROM [publisher_master]"></asp:SqlDataSource>
                                <asp:GridView ID="GrdPublisherDetails" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="publisher_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="publisher_id" HeaderText="Publisher Id" InsertVisible="False" ReadOnly="True" SortExpression="publisher_id" />
                                        <asp:BoundField DataField="publisher_nm" HeaderText="Publisher Name" SortExpression="publisher_nm" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
