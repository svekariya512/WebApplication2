using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class MyTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movie = Session["BookedMovie"] as string;
                string poster = Session["BookedPoster"] as string;

                // Dynamic Movie Name
                if (!string.IsNullOrEmpty(movie))
                {
                    lblMovie.Text = movie;
                }
                else
                {
                    lblMovie.Text = "No Booking Yet";
                }

                // Dynamic Movie Poster
                if (!string.IsNullOrEmpty(poster))
                {
                    imgSpiderman.ImageUrl = "~/Images/" + poster;
                }
            }
        }
    }
}