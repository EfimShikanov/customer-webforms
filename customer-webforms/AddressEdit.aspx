<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddressEdit.aspx.cs" Inherits="CustomerDatalayer.WebForms.AddressEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:Label ID="addEdit" Text="New Address" runat="server"></asp:Label>

        <div class="form-group">
            <asp:Label Text="Address line" runat="server"></asp:Label>
            <asp:TextBox ID="addressLine" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="addressLine" ErrorMessage="Address line is required"/>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="addressLine" ValidationExpression=".{1,100}" ErrorMessage="Address line is too long"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Address line 2" runat="server"></asp:Label>
            <asp:TextBox ID="addressLine2" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="addressLine" ValidationExpression=".{0,100}" ErrorMessage="Address line 2 is too long"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Type" runat="server"></asp:Label>
            <asp:TextBox ID="addressType" CssClass="form-control" runat="server"></asp:TextBox>
            <!-- <asp:RegularExpressionValidator runat="server" ControlToValidate ="addressType" ValidationExpression='@"(Shipping|Billing)"' ErrorMessage="Address type should match Shipping or Billing"/> -->
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="addressType" ErrorMessage="Type is required"/>
        </div>

        <div class="form-group">
            <asp:Label Text="City" runat="server"></asp:Label>
            <asp:TextBox ID="city" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="city" ErrorMessage="City is required"/>
            <asp:RegularExpressionValidator runat="server" ControlToValidate ="city" ValidationExpression=".{1,50}" ErrorMessage="City is too long"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Postal code" runat="server"></asp:Label>
            <asp:TextBox ID="postalCode" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="postalCode" ErrorMessage="Postal code is required"/>
        </div>

        <div class="form-group">
            <asp:Label Text="State" runat="server"></asp:Label>
            <asp:TextBox ID="state" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="state" ErrorMessage="State is required"/>
        </div>

        <div class="form-group">
            <asp:Label Text="Country" runat="server"></asp:Label>
            <asp:TextBox ID="country" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator runat="server" ControlToValidate ="country" ErrorMessage="Country is required"/>
        </div>

        <asp:Button CssClass="btn btn-primary" Text="Save" runat="server" OnClick="OnSubmit"></asp:Button>

        <asp:Button ID="delete" CssClass="btn btn-danger" Text="Delete" Visible="false" runat="server" OnClick="OnDelete"></asp:Button>
    </div>

</asp:Content>
