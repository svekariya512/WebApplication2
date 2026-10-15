using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // પેજ લોડ થાય ત્યારે કંઈ કરવાની જરૂર નથી
        }

        // "Book Now" બટન દબાવવાથી ચાલશે
        protected void btnMovie_Click(object sender, EventArgs e)
        {
            // Master Page માં રહેલા Premium Popup ને શોધો
            Panel pnlPremiumModal = (Panel)this.Master.FindControl("pnlPremiumModal");

            if (pnlPremiumModal != null)
            {
                // Popup ખોલો (Login/Signup માટે)
                pnlPremiumModal.Visible = true;
            }
        }
    }
}