using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery
{
    public partial class forgot_password : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrEmpty(email))
            {
                form_error.InnerText = "Please enter your email address.";
                form_error.Visible = true;
                form_success.Visible = false;
                return;
            }

            form_success.InnerText = "If an account exists with this email, a password reset link has been sent. Please check your inbox.";
            form_success.Visible = true;
            form_error.Visible = false;
            txtEmail.Text = "";
        }
    }
}