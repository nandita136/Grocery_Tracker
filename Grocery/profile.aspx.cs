using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            string current = txtCurrentPassword.Text;
            string newPassword = txtNewPassword.Text;
            string confirm = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(current) || string.IsNullOrEmpty(newPassword) || string.IsNullOrEmpty(confirm))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "pwdValidation",
                    "showToast('Please fill in all password fields.', 'error');", true);
                return;
            }

            if (newPassword.Length < 6)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "pwdValidation",
                    "showToast('New password must be at least 6 characters.', 'error');", true);
                return;
            }

            if (newPassword != confirm)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "pwdValidation",
                    "showToast('Passwords do not match.', 'error');", true);
                return;
            }

            string script = string.Format(@"
                var user = getCurrentUser();
                if (!user) {{
                    showToast('Please sign in first.', 'error');
                }} else if (user.password !== '{0}') {{
                    showToast('Current password is incorrect.', 'error');
                }} else {{
                    var users = getData('users') || [];
                    var record = users.find(function(u) {{ return u.id === user.id; }});
                    if (record) {{
                        record.password = '{1}';
                        saveData('users', users);
                    }}
                    user.password = '{1}';
                    saveData('currentUser', user);
                    showToast('Password changed successfully!');
                }}
            ",
                current.Replace("'", "\\'"),
                newPassword.Replace("'", "\\'")
            );

            ClientScript.RegisterStartupScript(this.GetType(), "pwdUpdateSuccess", script, true);

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";
        }
    }
}