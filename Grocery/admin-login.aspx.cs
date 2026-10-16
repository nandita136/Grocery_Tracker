//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Grocery
//{
//    public partial class admin_login : System.Web.UI.Page
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
    public partial class admin_login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdminSignIn_Click(object sender, EventArgs e)
        {
            string script = @"
                var admin = {
                    id: 1,
                    name: 'Administrator',
                    email: 'admin@grocerytracker.com',
                    role: 'admin'
                };

                localStorage.setItem('currentAdmin', JSON.stringify(admin));
                window.location.href = 'admin-dashboard.aspx';
            ";

            ClientScript.RegisterStartupScript(
                this.GetType(),
                "adminLoginSuccess",
                script,
                true
            );
        }
    }
}