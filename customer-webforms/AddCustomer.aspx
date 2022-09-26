<%@ Page 
    Title="New Customer" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="AddCustomer.aspx.cs"
    Inherits="CustomerDatalayer.WebForms.AddCustomer" 
%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <h3>New Customer</h3>

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

        <asp:Button CssClass="btn btn-primary" Text="Create" runat="server" OnClick="OnSubmit"></asp:Button>

    </div>
</asp:Content>