<%@ Page 
    Title="Customer Edit" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="CustomerEdit.aspx.cs" 
    Inherits="CustomerDatalayer.WebForms.CustomerEdit" 
%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/Styles.css" rel="stylesheet" type="text/css" />

    <div>
        <h3>Edit Customer</h3>

        <div class="form-group">
            <asp:Label Text="Firstname" runat="server"></asp:Label>
            <asp:TextBox ID="firstName" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="firstname" ValidationExpression=".{1,50}" ErrorMessage="Firstname is too long"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Lastname" runat="server"></asp:Label>
            <asp:TextBox ID="lastName" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="lastName" ErrorMessage="Lastname is required"/>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="lastName" ValidationExpression=".{1,50}" ErrorMessage="Lastname is too long"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Phone Number" runat="server"></asp:Label>
            <asp:TextBox ID="phoneNumber" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="phoneNumber" ValidationExpression=".{5,15}" ErrorMessage="Invalid phone format"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Email" runat="server"></asp:Label>
            <asp:TextBox ID="email" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="email" ValidationExpression="^[^@\s]+@[^@\s\.]+\.[^@\.\s]+$" ErrorMessage="Invalid email format"/>
        </div>

        <asp:Button CssClass="btn btn-primary" Text="Save" runat="server" OnClick="OnSubmit"></asp:Button>

        <asp:Button ID="delete" CssClass="btn btn-danger" Text="Delete" Visible="false" runat="server" OnClick="OnDelete"></asp:Button>
    </div>

    <div>
        <h4>Address</h4>

        <div class="table">
            <% foreach (var address in Address)
                { %>
                    <div class="table-row">
                        <div class="table-cell">
                            <% =address.AddressLine %>
                        </div>
                        <div class="table-cell">
                            <% =address.AddressLine2 %>
                        </div>
                        <div class="table-cell">
                            <% =address.AddressType %>
                        </div>
                        <div class="table-cell">
                            <% =address.City %>
                        </div>
                        <div class="table-cell">
                            <% =address.PostalCode %>
                        </div>
                        <div class="table-cell">
                            <% =address.State %>
                        </div>
                        <div class="table-cell">
                            <% =address.Country %>
                        </div>
                        <div class="table-cell">
                            <a class="btn btn-link" href="AddressEdit.aspx?addressId=<% =address.AddressId %>">Edit</a>
                        </div>
                    </div>
               <% } %>
        </div>

        <asp:Button ID="addAddress" CssClass="btn btn-primary" Text="Add" Visible="false" runat="server" OnClick="OnClickAddAddress"></asp:Button>
    </div>

</asp:Content>