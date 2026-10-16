using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text.Trim();
            string email = TextBox2.Text.Trim();
            string subject = TextBox3.Text.Trim();
            string message = TextBox4.Text.Trim();

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(subject) || string.IsNullOrEmpty(message))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "contactValidation",
                    "showToast('Please fill in all fields.', 'error');", true);
                return;
            }

            string script = string.Format(@"
                var messages = JSON.parse(localStorage.getItem('contactMessages')) || [];
                messages.push({{
                    id: Date.now(),
                    name: '{0}',
                    email: '{1}',
                    subject: '{2}',
                    message: '{3}',
                    date: new Date().toISOString()
                }});
                localStorage.setItem('contactMessages', JSON.stringify(messages));
                showToast('Thank you! Your message has been sent successfully.', 'success');
            ",
                name.Replace("'", "\\'"),
                email.Replace("'", "\\'"),
                subject.Replace("'", "\\'"),
                message.Replace("'", "\\'").Replace("\r\n", "\\n").Replace("\n", "\\n")
            );

            ClientScript.RegisterStartupScript(this.GetType(), "contactSuccess", script, true);

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
        }
    }
}