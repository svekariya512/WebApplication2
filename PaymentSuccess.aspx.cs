using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class PaymentSuccess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movie = Request.QueryString["movie"];
                string poster = Request.QueryString["poster"];

                if (!string.IsNullOrEmpty(movie))
                {
                    lblMovie.Text = movie;
                    lblMovieHeader.Text = movie;

                    // Save selected movie
                    Session["BookedMovie"] = movie;
                }

                if (!string.IsNullOrEmpty(poster))
                {
                    imgMovie.ImageUrl = "~/Images/" + poster;

                    // Save selected poster
                    Session["BookedPoster"] = poster;
                }
            }
        }
    }
}

     