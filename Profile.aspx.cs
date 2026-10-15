using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Profile : System.Web.UI.Page
    {
        // =========================================
        // SESSION-BASED ADMIN DATA
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
                LoadAdmin();
            }
        }

        private void LoadAdmin()
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

            if (!string.IsNullOrEmpty(a.Gender))
                ddlGender.SelectedValue = a.Gender;

            if (a.BirthDate.HasValue)
                txtBirthDate.Text = a.BirthDate.Value.ToString("yyyy-MM-dd");
        }

        // =========================================
        // EDIT PROFILE BUTTON
        // =========================================
        protected void btnEditProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        // =========================================
        // RESET PASSWORD BUTTON
        // =========================================
        protected void btnResetPassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reset.aspx");
        }
    }

    // =========================================
    // ADMIN DATA — only defined here (one place)
    // =========================================
    // =========================================
    // ADMIN DATA — only defined here (one place)
    // =========================================
    public class AdminData
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Role { get; set; }
        public string Phone { get; set; }
        public string Location { get; set; }
        public string Bio { get; set; }
        public string Gender { get; set; }
        public DateTime? BirthDate { get; set; }
        public DateTime CreatedAt { get; set; }
    }

}
