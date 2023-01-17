<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminAuthor.aspx.cs" Inherits="E_Library.AdminAuthor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        <link href="CSS/Style.css" rel="stylesheet" />

        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).DataTable()
        });
    </script>

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
        .space{
            margin-top:15px;
        }
    </style>
    <div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <h3>Author Details</h3>
                                <img src="images/book-Author.gif" style="height: 200px; width: 410px;" />

                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <label><strong>Author Id</strong></label>
                                            <div class="form-group">
                                                <div class="input-group">
                                                    <asp:TextBox ID="txtAuthorId" runat="server" CssClass="form-control" placeholder="Id"></asp:TextBox>
                                                    <asp:Button ID="BtnAuthorSearch" type="button" class="btn btn-success" Text="Go" runat="server" OnClick="BtnAuthorSearch_Click"></asp:Button>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="col-md-8">
                                            <label><strong>Author Name</strong></label>
                                            <asp:TextBox ID="txtAuthorNm" runat="server" CssClass="form-control" placeholder="Author Name"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">
                                            <div id="AlertCnt" class="alert alert-danger"  runat="server" style="margin-top:10px;display:none;text-align:center">
                                              <strong id="lblmsg" runat="server">Book Id cant be blank</strong>
                                            </div>
                                      </div>                                        
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div id="lblIsblankAuthor" class="alert alert-danger" style="margin-top:4px;display:none" runat="server">
                                                <strong>Author Name can't be blank</strong>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnAddAuthor" type="button" class="btn space btn-success btn btn-block" Text="Add" runat="server" OnClick="BtnAddAuthor_Click" data-target="#AdminAuthorAddedModal" data-toggle="modal"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnEdit" type="button" class="btn space btn-secondary btn btn-block" Text="Edit" runat="server" OnClick="BtnEdit_Click"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnUpdateAuthor" type="button" class="btn space btn-primary btn btn-block" Text="Update" runat="server" OnClick="BtnUpdateAuthor_Click" data-target="#AdminAuthorUpdateModal" data-toggle="modal"></asp:Button>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="BtnDeleteAuthor" type="button" class="btn space btn-danger btn btn-block" Text="Delete" runat="server" OnClick="BtnDeleteAuthor_Click" data-target="#AdminAuthorDeletedModal" data-toggle="modal"></asp:Button>
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
                                    <h4>Author List</h4>
                                    <hr />
                                </center>
                            </div>
                        </div>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:eLibraryConnectionString %>" SelectCommand="SELECT * FROM [author_master]"></asp:SqlDataSource>
                        <div class="row">
                            <div class="col">                                
                                <asp:GridView ID="GrdAuthorDetails" runat="server" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="author_id" DataSourceID="SqlDataSource1">
                                    <Columns>
                                        <asp:BoundField DataField="author_id" HeaderText="Author Id" InsertVisible="False" ReadOnly="True" SortExpression="author_id" />
                                        <asp:BoundField DataField="author_name" HeaderText="Author Name" SortExpression="author_name" />
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
    <%--<div class="container">
        <%--<div class="row">
            <div class="fade modal" tabindex="-1" id="AdminAuthorAddedModal"
                role="dialog"
                aria-labelledby="ModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">
                                <h3 id="modal_body"></h3>
                                <asp:Label runat="server" ID="lblMainMsg" Text="Author Details added succesfullyy  !!!!!"></asp:Label>
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
            <div class="fade modal" tabindex="-1" id="AdminAuthorUpdateModal"
                role="dialog"
                aria-labelledby="ModalLabel2" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">                                
                                <asp:Label runat="server" ID="Label1" Text="Author Details Updated succesfullyy  !!!!!"></asp:Label>
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
            <div class="fade modal" tabindex="-1" id="AdminAuthorDeletedModal"
                role="dialog"
                aria-labelledby="ModalLabel3" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-body">
                            <div class="form-group">                                
                                <asp:Label runat="server" ID="Label2" Text="Author Details Deleted succesfullyy  !!!!!"></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>

</asp:Content>
