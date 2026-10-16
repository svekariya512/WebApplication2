using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Settings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ⭐ હેડરમાં "Settings" સેટ કરવા માટે
                SetHeaderTitle("Settings");

                // ⭐ સેટિંગ્સ લોડ કરો
                LoadSettings();
            }
        }

        // ⭐ હેડર ટાઈટલ સેટ કરવાની મેથડ (C# થી)
        private void SetHeaderTitle(string title)
        {
            if (this.Master != null)
            {
                Label lbl = this.Master.FindControl("lblPageTitle") as Label;
                if (lbl != null)
                {
                    lbl.Text = title;
                }
            }
        }

        // =========================================
        // LOAD SETTINGS
        // =========================================
        private void LoadSettings()
        {
            // સેશનમાંથી સેટિંગ્સ લોડ કરો, જો ન હોય તો ડિફોલ્ટ વેલ્યુ
            txtCinemaName.Text = Session["CinemaName"] as string ?? "CinePulse Global";
            txtHeadquarters.Text = Session["Headquarters"] as string ?? "Rajkot, Gujarat";
            txtSessionTimeout.Text = Session["SessionTimeout"] as string ?? "30";
            txtFooterMessage.Text = Session["FooterMessage"] as string ?? "System maintenance scheduled for Sunday 02:00 AM IST. Expect minor disruptions.";

            chkSystemAlerts.Checked = Session["SystemAlerts"] == null ? true : (bool)Session["SystemAlerts"];
            chkDailySms.Checked = Session["DailySms"] == null ? true : (bool)Session["DailySms"];
            chkAdminPush.Checked = Session["AdminPush"] == null ? false : (bool)Session["AdminPush"];
            chkMarketing.Checked = Session["Marketing"] == null ? false : (bool)Session["Marketing"];

            chkTwoFactor.Checked = Session["TwoFactor"] == null ? true : (bool)Session["TwoFactor"];

            if (Session["Timezone"] != null)
                ddlTimezone.SelectedValue = Session["Timezone"].ToString();

            if (Session["Currency"] != null)
                ddlCurrency.SelectedValue = Session["Currency"].ToString();

            if (Session["DashboardTheme"] != null)
                ddlDashboardTheme.SelectedValue = Session["DashboardTheme"].ToString();

            if (Session["SystemLanguage"] != null)
                ddlSystemLanguage.SelectedValue = Session["SystemLanguage"].ToString();
        }

        // =========================================
        // SAVE CONFIGURATION
        // =========================================
        protected void btnSave_Click(object sender, EventArgs e)
        {
            // વેલિડેશન
            if (string.IsNullOrEmpty(txtCinemaName.Text.Trim()))
            {
                ShowMessage("Cinema Name is required.", false);
                return;
            }

            if (string.IsNullOrEmpty(txtHeadquarters.Text.Trim()))
            {
                ShowMessage("Headquarters Location is required.", false);
                return;
            }

            int timeout;
            if (!int.TryParse(txtSessionTimeout.Text.Trim(), out timeout) || timeout < 1 || timeout > 1440)
            {
                ShowMessage("Session Timeout must be between 1 and 1440 minutes.", false);
                return;
            }

            if (txtFooterMessage.Text.Length > 150)
            {
                ShowMessage("Footer Message cannot exceed 150 characters.", false);
                return;
            }

            // સેશનમાં સેવ કરો
            Session["CinemaName"] = txtCinemaName.Text.Trim();
            Session["Headquarters"] = txtHeadquarters.Text.Trim();
            Session["SessionTimeout"] = txtSessionTimeout.Text.Trim();
            Session["FooterMessage"] = txtFooterMessage.Text.Trim();

            Session["SystemAlerts"] = chkSystemAlerts.Checked;
            Session["DailySms"] = chkDailySms.Checked;
            Session["AdminPush"] = chkAdminPush.Checked;
            Session["Marketing"] = chkMarketing.Checked;

            Session["TwoFactor"] = chkTwoFactor.Checked;

            Session["Timezone"] = ddlTimezone.SelectedValue;
            Session["Currency"] = ddlCurrency.SelectedValue;
            Session["DashboardTheme"] = ddlDashboardTheme.SelectedValue;
            Session["SystemLanguage"] = ddlSystemLanguage.SelectedValue;

            ShowMessage("Configuration saved successfully.", true);
        }

        // =========================================
        // DISCARD CHANGES
        // =========================================
        protected void btnDiscard_Click(object sender, EventArgs e)
        {
            // ફોર્મ રીલોડ કરો (જૂની વેલ્યુ સાથે)
            LoadSettings();
            ShowMessage("Changes discarded.", true);
        }

        // =========================================
        // SHOW MESSAGE
        // =========================================
        private void ShowMessage(string message, bool success)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;
            lblMessage.CssClass = success ? "settings-message" : "settings-message error";
        }
    }
}
