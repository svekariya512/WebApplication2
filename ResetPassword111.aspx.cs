using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class ResetPassword111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (string.IsNullOrWhiteSpace(txtNewPassword.Text))
            {
                lblMessage.Text = "⚠ Please enter new password.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            if (txtNewPassword.Text.Length < 6)
            {
                lblMessage.Text = "⚠ Password must be at least 6 characters.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            if (txtNewPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "⚠ Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Toggles Modal Popup via C# Server Control Property
            pnlSuccessModal.Visible = true;
        }

        protected void btnGoToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login111.aspx");
        }
    }
}