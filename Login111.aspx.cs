using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Login111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // "Sign In" બટન પર ક્લિક — C# થી Validation
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            // Validation 1: Email
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "⚠ Please enter your email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 2: Email Format
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                lblMessage.Text = "⚠ Please enter a valid email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 3: Password
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "⚠ Please enter your password.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 4: Password Length
            if (txtPassword.Text.Length < 6)
            {
                lblMessage.Text = "⚠ Password must be at least 6 characters.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // બધું બરાબર — સફળ સંદેશ
            lblMessage.Text = "✓ Login successful! Redirecting...";
            lblMessage.ForeColor = System.Drawing.Color.LightGreen;

            // (અહીં તમે ડેટાબેઝ ચેક કરવાનો કોડ લખી શકો)
            // Response.Redirect("Home111.aspx");  // જો ઈચ્છો તો
        }
    }
}