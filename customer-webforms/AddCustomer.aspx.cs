using CustomerDatalayer.Entities;
using CustomerDatalayer.Repositories;
using System;
using System.Collections.Generic;

namespace CustomerDatalayer.WebForms
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        CustomerRepository CustomerRepository = new CustomerRepository();
        Customer Customer;
        public List<Address> Address;

        protected void Page_Load(object sender, EventArgs e)
        {
            Address = new List<Address>();
        }

        protected void OnSubmit(object sender, EventArgs e)
        {
            var customer = new Customer()
            {
                FirstName = firstName.Text,
                LastName = lastName.Text,
                PhoneNumber = phoneNumber.Text,
                Email = email.Text,
                TotalPurchasesAmount = Customer?.TotalPurchasesAmount,
            };

            var customerIdStr = Request.QueryString["customerId"];
            if (customerIdStr != null)
            {
                customer.CustomerId = int.Parse(customerIdStr);

                CustomerRepository.Update(customer);
            }
            else
            {
                CustomerRepository.Create(customer);
            }

            Response.Redirect("CustomersList.aspx");
        }
    }
}