using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class SeatSelection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string movie = Request.QueryString["movie"];

                if (!string.IsNullOrEmpty(movie))
                {
                    lblMovie.Text = movie;
                }
                else
                {
                    lblMovie.Text = "Jhamkudi";
                }

                string seats = Request.QueryString["seats"];

                if (!string.IsNullOrEmpty(seats))
                {
                    lblSeats.Text = seats;
                }
            }
        }
    }
}