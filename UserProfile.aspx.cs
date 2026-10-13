using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Profile data database mathi load kari shakay
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string mobile = txtMobile.Text;
            string email = txtEmail.Text;
            string dob = txtDOB.Text;
            string gender = ddlGender.SelectedValue;
            string address = txtAddress.Text;

            // Ahiya database UPDATE query mukvani
        }
    }
}