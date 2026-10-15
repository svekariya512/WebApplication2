using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace WebApplication2
{
    public partial class EditProfile : System.Web.UI.Page
    {
        // =========================================
        // SESSION-BASED ADMIN DATA
        // (AdminData class Profile.aspx.cs ma chhe)
        // =========================================
        private AdminData Admin
        {
            get
            {
                if (Session["AdminData"] == null)
                {
                    Session["AdminData"] = new AdminData
                    {
                        Id = 1,
                        FullName = "Vekariya Shriya",
                        Email = "v.shriya@cinepulse.com",
                        Role = "Senior System Administrator",
                        Phone = "+1 (555) 000-0000",
                        Location = "City, Country",
                        Bio = "Senior System Administrator",
                        Gender = "Female",
                        BirthDate = new DateTime(1995, 5, 15),
                        CreatedAt = new DateTime(2021, 10, 1)
                    };
                }
                return (AdminData)Session["AdminData"];
            }
            set { Session["AdminData"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        // =========================================
        // LOAD PROFILE
        // =========================================
        private void LoadProfile()
        {
            AdminData a = Admin;

            hdnAdminId.Value = a.Id.ToString();
            lblName.Text = a.FullName;
            lblEmail.Text = a.Email;
            lblJoined.Text = "Joined: " + a.CreatedAt.ToString("MMM yyyy");

            txtFullName.Text = a.FullName;
            txtEmail.Text = a.Email;
            txtRole.Text = a.Role;
            txtPhone.Text = a.Phone;
            txtLocation.Text = a.Location;
            txtBio.Text = a.Bio;

            if (!string.IsNullOrEmpty(a.Gender))
                ddlGender.SelectedValue = a.Gender;

            if (a.BirthDate.HasValue)
                txtBirthDate.Text = a.BirthDate.Value.ToString("yyyy-MM-dd");
        }

        // =========================================
        // SAVE PROFILE — C# VALIDATION
        // =========================================
        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            lblSuccess.Visible = false;
            lblError.Visible = false;

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string role = txtRole.Text.Trim();
            string birthDate = txtBirthDate.Text.Trim();
            string gender = ddlGender.SelectedValue;
            string phone = txtPhone.Text.Trim();
            string location = txtLocation.Text.Trim();
            string bio = txtBio.Text.Trim();

            // ===== VALIDATION =====
            if (string.IsNullOrEmpty(fullName))
            {
                ShowError("Full Name is required.");
                return;
            }

            if (fullName.Length < 2 || fullName.Length > 100)
            {
                ShowError("Full Name must be between 2 and 100 characters.");
                return;
            }

            if (!Regex.IsMatch(fullName, @"^[a-zA-Z\s.\-']+$"))
            {
                ShowError("Full Name can only contain letters, spaces, dots, hyphens.");
                return;
            }

            if (string.IsNullOrEmpty(email))
            {
                ShowError("Email Address is required.");
                return;
            }

            if (!Regex.IsMatch(email, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                ShowError("Please enter a valid email address.");
                return;
            }

            if (!string.IsNullOrEmpty(phone))
            {
                string cleaned = Regex.Replace(phone, @"[\s\-\(\)\+]", "");
                if (!Regex.IsMatch(cleaned, @"^[0-9]{10,15}$"))
                {
                    ShowError("Phone number must contain 10 to 15 digits.");
                    return;
                }
            }

            if (!string.IsNullOrEmpty(birthDate))
            {
                DateTime parsed;
                if (!DateTime.TryParse(birthDate, out parsed))
                {
                    ShowError("Invalid Birth Date format.");
                    return;
                }

                int age = DateTime.Now.Year - parsed.Year;
                if (parsed > DateTime.Now.AddYears(-age)) age--;

                if (age < 18) { ShowError("You must be at least 18 years old."); return; }
                if (age > 120) { ShowError("Please enter a valid Birth Date."); return; }
            }

            // ===== SAVE =====
            try
            {
                AdminData a = Admin;
                a.FullName = fullName;
                a.Email = email;
                a.Role = role;
                a.Phone = phone;
                a.Location = location;
                a.Bio = bio;
                a.Gender = gender;

                if (!string.IsNullOrEmpty(birthDate))
                    a.BirthDate = Convert.ToDateTime(birthDate);

                Admin = a;

                ShowSuccess("Profile updated successfully!");

                // redirect after 2 seconds
                string script = "setTimeout(function(){ window.location.href='Profile.aspx'; }, 2000);";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "redirect", script, true);
            }
            catch (Exception ex)
            {
                ShowError("Error: " + ex.Message);
            }
        }

        // =========================================
        // CANCEL BUTTON
        // =========================================
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowSuccess(string message)
        {
            lblSuccess.Text = "✓ " + message;
            lblSuccess.CssClass = "edit-message show";
            lblSuccess.Visible = true;
        }

        private void ShowError(string message)
        {
            lblError.Text = "✗ " + message;
            lblError.CssClass = "edit-error show";
            lblError.Visible = true;
        }
    }

    // ❌ AdminData class AHI NATHI — Profile.aspx.cs ma chhe
}
