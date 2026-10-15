using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SetActiveLink();
        }

        private void SetActiveLink()
        {
            string currentPage = System.IO.Path.GetFileName(Request.Url.AbsolutePath).ToLower();

            lnkHome.CssClass = "nav-link";
            lnkAbout.CssClass = "nav-link";
            lnkGallery.CssClass = "nav-link";
            lnkTheater.CssClass = "nav-link";
            lnkContact.CssClass = "nav-link";

            switch (currentPage)
            {
                case "home111.aspx":
                    lnkHome.CssClass = "nav-link active-link";
                    break;
                case "about111.aspx":
                    lnkAbout.CssClass = "nav-link active-link";
                    break;
                case "movies111.aspx":
                    lnkGallery.CssClass = "nav-link active-link";
                    break;
                case "theater111.aspx":
                    lnkTheater.CssClass = "nav-link active-link";
                    break;
                case "contact111.aspx":
                    lnkContact.CssClass = "nav-link active-link";
                    break;
            }
        }

        // Popup ખોલવા માટે (Login / Signup click પર)
        protected void btnOpenModal_Click(object sender, EventArgs e)
        {
            pnlPremiumModal.Visible = true;
        }

        // Popup બંધ કરવા માટે (X click પર)
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlPremiumModal.Visible = false;
        }

        // Popup માંથી Login પેજ પર
        protected void btnModalLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login111.aspx");
        }

        // Popup માંથી Signup પેજ પર
        protected void btnModalSignup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Signup111.aspx");
        }
    }
}