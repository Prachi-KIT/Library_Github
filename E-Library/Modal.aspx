<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Modal.aspx.cs" Inherits="E_Library.Modal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="CSS/Style.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="modal fade" id="PopupModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <div style="margin-left: 140px;">
                                <center>
                                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                                </center>
                            </div>
                        </div>

                        <div class="modal-body">
                            <div class="form-group">
                                <asp:Label runat="server" ID="lblMainMsg"><strong></strong></asp:Label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button type="button" class="btn btn-secondary" data-dismiss="modal" runat="server" Text="Close"></asp:Button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
