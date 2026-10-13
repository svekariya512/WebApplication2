
using System;
using System.Web.UI;

namespace WebApplication1
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            Page.Validate("AdminLogin");

            if (!Page.IsValid)
                return;

            string email = txtAdminEmail.Text.Trim();
            string password = txtAdminPassword.Text;

            if (string.Equals(
                    email,
                    "vekariyashriya@gmail.com",
                    StringComparison.OrdinalIgnoreCase)
                && password == "123456")
            {
                Session["IsAdmin"] = true;
                Session["AdminEmail"] = email;

                Response.Redirect("home.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                lblMessage.Text =
                    "Invalid admin email or password.";
            }
        }
    }
}
