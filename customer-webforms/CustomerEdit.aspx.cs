using CustomerDatalayer.Repositories;
using System;
using System.Collections.Generic;
using CustomerDatalayer.Entities;

namespace CustomerDatalayer.WebForms
{
    public partial class CustomerEdit : System.Web.UI.Page
    {
        CustomerRepository CustomerRepository = new CustomerRepository();
        Customer Customer;
        public List<Address> Address;

        protected void Page_Load(object sender, EventArgs e)
        {
            var customerIdStr = Request.QueryString["customerId"];
            if (customerIdStr != null)
            {
                if (!IsPostBack)
                {
                    delete.Visible = true;

                    Customer = CustomerRepository.Read(int.Parse(customerIdStr));

                    firstName.Text = Customer.FirstName;
                    lastName.Text = Customer.LastName;
                    phoneNumber.Text = Customer.PhoneNumber;
                    email.Text = Customer.Email;

                    var addressRepository = new AddressRepository();
                    Address = addressRepository.GetCustomerAddress(Customer.CustomerId);
                }
            }
            else
            {
                Response.Redirect("AddCustomer.aspx");
            }
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

        protected void OnDelete(object sender, EventArgs e)
        {
            var customerRepository = new CustomerRepository();
            var customerIdStr = Request.QueryString["customerId"];
            customerRepository.Delete(int.Parse(customerIdStr));

            Response.Redirect("CustomersList.aspx");
        }

        protected void OnClickAddAddress(object sender, EventArgs e)
        {
            Response.Redirect("AddressEdit.aspx?customerId=" + Customer.CustomerId);
        }
    }
}