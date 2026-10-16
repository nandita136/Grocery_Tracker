//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Grocery
//{
//    public partial class login : System.Web.UI.Page
//    {
//        protected void Page_Load(object sender, EventArgs e)
//        {

//        }
//    }
//}


using System;
using System.Web.UI;

namespace Grocery
{
    public partial class login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            string script;
            if (string.IsNullOrEmpty(email) && string.IsNullOrEmpty(password))
            {
                // Default demo login
                script = @"
                    var users = getData('users') || [];
                    var user = users.find(function(u) { return u.role === 'user'; }) || {
                        id: 1,
                        name: 'Priyesha Chauhan',
                        email: 'priyesha@example.com',
                        role: 'user'
                    };

                    saveData('currentUser', user);
                    window.location.href = 'dashboard.aspx';
                ";
            }
            else
            {
                script = string.Format(@"
                    var users = getData('users') || [];
                    var user = users.find(function(u) {{
                        return u.email.toLowerCase() === '{0}'.toLowerCase() && u.password === '{1}';
                    }});

                    if (user) {{
                        saveData('currentUser', user);
                        window.location.href = 'dashboard.aspx';
                    }} else {{
                        var error = document.getElementById('form-error');
                        if (error) {{
                            error.textContent = 'Incorrect email or password.';
                            error.style.display = 'block';
                        }}
                    }}
                ",
                    email.Replace("'", "\\'"),
                    password.Replace("'", "\\'")
                );
            }

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "loginSuccess",
                script,
                true
            );
        }
    }
}