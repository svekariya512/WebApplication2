using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class TicketDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movie = Session["BookedMovie"] as string;
                string poster = Session["BookedPoster"] as string;

                if (!string.IsNullOrEmpty(movie))
                {
                    lblMovie.Text = movie;
                }

                if (!string.IsNullOrEmpty(poster))
                {
                    imgMovie.ImageUrl = "~/Images/" + poster;
                }

            }
        }
    }
}