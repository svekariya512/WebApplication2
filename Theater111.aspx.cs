using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Theater111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // "Book Now" બટન પર ક્લિક
        protected void btnBookNow_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string movieName = btn.CommandArgument;

            // Master Page માં રહેલા Premium Popup ને શોધો
            Panel pnlPremiumModal = (Panel)this.Master.FindControl("pnlPremiumModal");
            if (pnlPremiumModal != null)
            {
                pnlPremiumModal.Visible = true;
            }
        }
    }
}