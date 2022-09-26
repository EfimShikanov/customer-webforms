using System;
using System.Collections.Generic;
using CustomerDatalayer.Repositories;
using CustomerDatalayer.Entities;
using Microsoft.Ajax.Utilities;

namespace CustomerDatalayer.WebForms
{
    public partial class CustomersList : System.Web.UI.Page
    {
        private const int PageSize = 5;
        private CustomerRepository _customerRepository = new CustomerRepository();
        private int pageNum;
        public List<Customer> Customers { get; set; }
        public decimal pagesCount;

        protected void Page_Load(object sender, EventArgs e)
        {
            var pageStr = Request.QueryString["page"];
            pageNum = string.IsNullOrEmpty(pageStr) ? 1 : int.Parse(pageStr);

            CustomerRepository _customerRepository = new CustomerRepository();

            pagesCount = (_customerRepository.GetCount() % 5) > 0 ? _customerRepository.GetCount() / 5 + 1 : _customerRepository.GetCount() / 5;

            btnPrev.Enabled = pageNum > 1;
            btnNext.Enabled = pageNum < (_customerRepository.GetCount() + PageSize - 1) / PageSize;

            Customers = _customerRepository.GetPage(PageSize, pageNum, "FirstName");
        }

        public string GetPage()
        {
            var pageStr = Request.QueryString["page"];
            pageStr = string.IsNullOrEmpty(pageStr) ? "1" : pageStr;
            return pageStr;
        }

        protected void OnClickPrev(object sender, EventArgs e)
        {
            Response.Redirect($"CustomersList.aspx?page={pageNum - 1}");
        }

        protected void OnClickNext(object sender, EventArgs e)
        {
            Response.Redirect($"CustomersList.aspx?page={pageNum + 1}");
        }

        protected void SetExactPage(object sender, EventArgs e)
        {
            //Response.Redirect($"CustomersList.aspx?page={page}");
        }
    }
}