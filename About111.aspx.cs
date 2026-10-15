using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class About111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // "View All" બટન પર ક્લિક
        //protected void btnViewAll_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Movies111.aspx");
        //}
        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Theater111.aspx");
        }

        // "View Details" બટન પર ક્લિક
        protected void btnTheater_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string theaterName = btn.CommandArgument;

            Response.Redirect("TheaterDetails.aspx?theater=" + Server.UrlEncode(theaterName));
        }
    }
}