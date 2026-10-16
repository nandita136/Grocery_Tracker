using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text.Trim();
            string email = TextBox2.Text.Trim();
            string password = TextBox3.Text;
            string confirmPassword = TextBox4.Text;

            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password) || string.IsNullOrEmpty(confirmPassword))
            {
                string scriptErr = "var err = document.querySelector('#form-error'); if(err){ err.textContent = 'All fields are required.'; err.style.display = 'block'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "regErr", scriptErr, true);
                return;
            }

            if (!email.Contains("@") || !email.Contains("."))
            {
                string scriptErr = "var err = document.querySelector('#form-error'); if(err){ err.textContent = 'Enter a valid email address.'; err.style.display = 'block'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "regErr", scriptErr, true);
                return;
            }

            if (password.Length < 6)
            {
                string scriptErr = "var err = document.querySelector('#form-error'); if(err){ err.textContent = 'Password must be at least 6 characters.'; err.style.display = 'block'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "regErr", scriptErr, true);
                return;
            }

            if (password != confirmPassword)
            {
                string scriptErr = "var err = document.querySelector('#form-error'); if(err){ err.textContent = 'Passwords do not match.'; err.style.display = 'block'; }";
                ClientScript.RegisterStartupScript(this.GetType(), "regErr", scriptErr, true);
                return;
            }

            string script = string.Format(@"
                var users = getData('users') || [];
                var exists = users.some(function(u) {{
                    return u.email.toLowerCase() === '{0}'.toLowerCase();
                }});

                var err = document.querySelector('#form-error');
                var succ = document.querySelector('#form-success');
                if (err) err.style.display = 'none';

                if (exists) {{
                    if (err) {{
                        err.textContent = 'An account with this email already exists.';
                        err.style.display = 'block';
                    }}
                }} else {{
                    var newUser = {{
                        id: generateId(users),
                        name: '{1}',
                        email: '{0}',
                        password: '{2}',
                        role: 'user'
                    }};
                    users.push(newUser);
                    saveData('users', users);
                    if (succ) {{
                        succ.textContent = 'Registration successful! Redirecting to login...';
                        succ.style.display = 'block';
                    }}
                    setTimeout(function() {{
                        window.location.href = 'login.aspx';
                    }}, 800);
                }}
            ",
                email.Replace("'", "\\'"),
                name.Replace("'", "\\'"),
                password.Replace("'", "\\'")
            );

            ClientScript.RegisterStartupScript(this.GetType(), "registerSuccess", script, true);
        }
    }
}