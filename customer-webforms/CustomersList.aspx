<%@ Page 
    Title="Customers" 
    Language="C#" 
    MasterPageFile="~/Site.Master" 
    AutoEventWireup="true" 
    CodeBehind="CustomersList.aspx.cs" 
    Inherits="CustomerDatalayer.WebForms.CustomersList" 
%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Content/Styles.css" rel="stylesheet" type="text/css" />
    <script>
        let setExactPage = (page) => {
            let baseUrl = "https://localhost:44366/CustomersList?page=";
            window.location.href = baseUrl + page;
        }
        
    </script>
    <h4>Customers List</h4>
    <div class="table">
        <% foreach (var customer in Customers) { %>
                <div class="table-row">
                    <div class="table-cell">
                        <% =customer.FirstName %>
                    </div>
                    <div class="table-cell">
                        <% =customer.LastName %>
                    </div>
                    <div class="table-cell">
                        <a class="btn btn-link" href="CustomerEdit.aspx?customerId=<% =customer.CustomerId %>">Edit</a>
                    </div>
                </div>
           <% } %>
    </div>
    <div class="pagination">
        <asp:Button ID="btnPrev" CssClass="btn btn-secondary" Text="Prev" runat="server" OnClick="OnClickPrev"></asp:Button>
        <% for (int i = 1; i <= pagesCount; i++) { %>
            <div class="pagination-item" onclick="javascript:setExactPage(<% =i %>)"><% =i %></div>
        <% } %>
        <asp:Button ID="btnNext" CssClass="btn btn-secondary" Text="Next" runat="server" OnClick="OnClickNext"></asp:Button>
    </div>
    
    <a class="btn btn-primary" href="AddCustomer.aspx">New Customer</a>

</asp:Content>
