using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Signup111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // "Sign Up" બટન પર ક્લિક — C# થી Validation
        protected void btnSignup_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            // Validation 1: Full Name
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                lblMessage.Text = "⚠ Please enter your full name.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 2: Email
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "⚠ Please enter your email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 3: Email Format
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                lblMessage.Text = "⚠ Please enter a valid email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 4: Password
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.Text = "⚠ Please enter your password.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 5: Password Length
            if (txtPassword.Text.Length < 6)
            {
                lblMessage.Text = "⚠ Password must be at least 6 characters.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 6: Confirm Password
            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "⚠ Passwords do not match.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // (અહીં ડેટાબેઝમાં નોંધણી માટેનો કોડ ઉમેરી શકો છો)

            // બધું બરાબર — સફળતાપૂર્વક પોપઅપ ડિસ્પ્લે કરો
            pnlSuccessModal.Visible = true;

            // ફોર્મ ખાલી કરો
            txtFullName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtConfirmPassword.Text = "";
        }

        // Popup -> Login Now Button Click
        protected void btnLoginNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login111.aspx");
        }

        // Popup -> Go To Home Button Click
        protected void btnGoToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home111.aspx"); // જરૂરિયાત મુજબ હોમ પેજ URL બદલો
        }
    }
}
