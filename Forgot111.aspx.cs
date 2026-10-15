using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Forgot111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSendOTP_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "⚠ Please enter your email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                lblMessage.Text = "⚠ Please enter a valid email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Page Navigation purely via C# Server Side
            Response.Redirect("VerifyOTP111.aspx?email=" + Server.UrlEncode(txtEmail.Text));
        }
    }
}