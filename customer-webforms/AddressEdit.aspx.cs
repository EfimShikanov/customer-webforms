using CustomerDatalayer.Repositories;
using CustomerDatalayer.Entities;
using System;

namespace CustomerDatalayer.WebForms
{
    public partial class AddressEdit : System.Web.UI.Page
    {
        readonly AddressRepository AddressRepository = new AddressRepository();

        Entities.Address Address;

        protected void Page_Load(object sender, EventArgs e)
        {
            var addressIdStr = Request.QueryString["addressId"];
            if (addressIdStr == null)
            {
                Response.Redirect("CustomersList.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    Address = AddressRepository.Read(int.Parse(addressIdStr));

                    addressLine.Text = Address.AddressLine;
                    addressLine2.Text = Address.AddressLine2;
                    addressType.Text = Address.AddressType;
                    city.Text = Address.City;
                    postalCode.Text = Address.PostalCode;
                    state.Text = Address.State;
                    country.Text = Address.Country;
                }
            }
        }

        protected void OnSubmit(object sender, EventArgs e)
        {
            var addressIdStr = Request.QueryString["addressId"];
            if (addressIdStr == null)
            {
                Address = AddressRepository.Read(int.Parse(addressIdStr));
                Address.AddressLine = addressLine.Text;
                Address.AddressLine2 = addressLine2.Text;
                Address.AddressType = addressType.Text;
                Address.City = city.Text;
                Address.PostalCode = postalCode.Text;
                Address.State = state.Text;
                Address.Country = country.Text;

                AddressRepository.Update(Address);
            }

            var customerIdStr = Request.QueryString["customerId"];
            if (customerIdStr != null)
            {
                Address = new CustomerDatalayer.Entities.Address
                {
                    CustomerId = int.Parse(customerIdStr),
                    AddressLine = addressLine.Text,
                    AddressLine2 = addressLine2.Text,
                    AddressType = addressType.Text,
                    City = city.Text,
                    PostalCode = postalCode.Text,
                    State = state.Text,
                    Country = country.Text,
                };

                AddressRepository.Create(Address);
            }

            Response.Redirect("CustomerList.aspx?customerId=" + Address.CustomerId);
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            var addressIdStr = Request.QueryString["addressId"];
            Address = AddressRepository.Read(int.Parse(addressIdStr));
            AddressRepository.Delete(Address.AddressId);

            Response.Redirect("CustomerList.aspx?customerId=" + Address.CustomerId);
        }
    }
}