using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class Settings : System.Web.UI.Page
    {
        // =========================================
        // IN-MEMORY SETTINGS DATA
        // =========================================
        private SettingsData Config
        {
            get
            {
                if (Session["SettingsData"] == null)
                {
                    Session["SettingsData"] = new SettingsData
                    {
                        CinemaName = "CinePulse Global",
                        Headquarters = "Rajkot, Gujarat",
                        Timezone = "IST",
                        Currency = "INR",
                        SessionTimeout = 30,
                        DashboardTheme = "CinematicDark",
                        SystemLanguage = "en-US",
                        FooterMessage = "System maintenance scheduled for Sunday 02:00 AM IST.",
                        SystemAlerts = true,
                        DailySms = true,
                        AdminPush = false,
                        Marketing = false,
                        TwoFactor = true
                    };
                }
                return (SettingsData)Session["SettingsData"];
            }
            set { Session["SettingsData"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSettings();
            }
        }

        // =========================================
        // LOAD SETTINGS
        // =========================================
        private void LoadSettings()
        {
            try
            {
                SettingsData c = Config;

                txtCinemaName.Text = c.CinemaName;
                txtHeadquarters.Text = c.Headquarters;
                txtSessionTimeout.Text = c.SessionTimeout.ToString();
                txtFooterMessage.Text = c.FooterMessage;

                if (ddlTimezone.Items.FindByValue(c.Timezone) != null)
                    ddlTimezone.SelectedValue = c.Timezone;

                if (ddlCurrency.Items.FindByValue(c.Currency) != null)
                    ddlCurrency.SelectedValue = c.Currency;

                if (ddlDashboardTheme.Items.FindByValue(c.DashboardTheme) != null)
                    ddlDashboardTheme.SelectedValue = c.DashboardTheme;

                if (ddlSystemLanguage.Items.FindByValue(c.SystemLanguage) != null)
                    ddlSystemLanguage.SelectedValue = c.SystemLanguage;

                chkSystemAlerts.Checked = c.SystemAlerts;
                chkDailySms.Checked = c.DailySms;
                chkAdminPush.Checked = c.AdminPush;
                chkMarketing.Checked = c.Marketing;
                hdnTwoFactor.Value = c.TwoFactor.ToString().ToLower();
            }
            catch (Exception ex)
            {
                SetDefaultValues();
                System.Diagnostics.Debug.WriteLine("Load error: " + ex.Message);
            }
        }

        private void SetDefaultValues()
        {
            txtCinemaName.Text = "CinePulse Global";
            txtHeadquarters.Text = "Rajkot, Gujarat";
            txtSessionTimeout.Text = "30";
            txtFooterMessage.Text = "System maintenance scheduled for Sunday 02:00 AM IST.";
            chkSystemAlerts.Checked = true;
            chkDailySms.Checked = true;
            chkAdminPush.Checked = false;
            chkMarketing.Checked = false;
            hdnTwoFactor.Value = "true";
        }

        // =========================================
        // SAVE WITH C# VALIDATION
        // =========================================
        protected void btnSaveConfiguration_Click(object sender, EventArgs e)
        {
            lblSessionError.Visible = false;
            lblFooterError.Visible = false;
            lblSettingsMessage.Visible = false;

            string cinemaName = txtCinemaName.Text.Trim();
            string headquarters = txtHeadquarters.Text.Trim();
            string timezone = ddlTimezone.SelectedValue;
            string currency = ddlCurrency.SelectedValue;
            string sessionTimeout = txtSessionTimeout.Text.Trim();
            string dashboardTheme = ddlDashboardTheme.SelectedValue;
            string systemLanguage = ddlSystemLanguage.SelectedValue;
            string footerMessage = txtFooterMessage.Text.Trim();
            bool twoFactor = hdnTwoFactor.Value.ToLower() == "true";

            // ==================== VALIDATION ====================

            if (string.IsNullOrEmpty(cinemaName))
            {
                ShowError("Cinema Name is required.");
                return;
            }

            if (cinemaName.Length < 2 || cinemaName.Length > 100)
            {
                ShowError("Cinema Name must be between 2 and 100 characters.");
                return;
            }

            if (!System.Text.RegularExpressions.Regex.IsMatch(cinemaName, @"^[a-zA-Z0-9\s&.\-]+$"))
            {
                ShowError("Cinema Name contains invalid characters.");
                return;
            }

            if (string.IsNullOrEmpty(headquarters))
            {
                ShowError("Headquarters Location is required.");
                return;
            }

            if (headquarters.Length < 2 || headquarters.Length > 100)
            {
                ShowError("Headquarters must be between 2 and 100 characters.");
                return;
            }

            if (string.IsNullOrEmpty(timezone))
            {
                ShowError("Please select a Timezone.");
                return;
            }

            if (string.IsNullOrEmpty(currency))
            {
                ShowError("Please select a Currency.");
                return;
            }

            if (string.IsNullOrEmpty(sessionTimeout))
            {
                lblSessionError.Text = "Session Timeout is required.";
                lblSessionError.Visible = true;
                return;
            }

            int timeoutValue;
            if (!int.TryParse(sessionTimeout, out timeoutValue))
            {
                lblSessionError.Text = "Session Timeout must be a number.";
                lblSessionError.Visible = true;
                return;
            }

            if (timeoutValue < 5 || timeoutValue > 1440)
            {
                lblSessionError.Text = "Session Timeout must be between 5 and 1440 minutes.";
                lblSessionError.Visible = true;
                return;
            }

            if (string.IsNullOrEmpty(dashboardTheme))
            {
                ShowError("Please select a Dashboard Theme.");
                return;
            }

            if (string.IsNullOrEmpty(systemLanguage))
            {
                ShowError("Please select a System Language.");
                return;
            }

            if (!string.IsNullOrEmpty(footerMessage) && footerMessage.Length > 150)
            {
                lblFooterError.Text = "Footer message cannot exceed 150 characters.";
                lblFooterError.Visible = true;
                return;
            }

            // ==================== SAVE TO SESSION ====================
            try
            {
                SettingsData c = Config;

                c.CinemaName = cinemaName;
                c.Headquarters = headquarters;
                c.Timezone = timezone;
                c.Currency = currency;
                c.SessionTimeout = timeoutValue;
                c.DashboardTheme = dashboardTheme;
                c.SystemLanguage = systemLanguage;
                c.FooterMessage = footerMessage ?? "";
                c.SystemAlerts = chkSystemAlerts.Checked;
                c.DailySms = chkDailySms.Checked;
                c.AdminPush = chkAdminPush.Checked;
                c.Marketing = chkMarketing.Checked;
                c.TwoFactor = twoFactor;

                Config = c;

                lblSettingsMessage.Text = "Configuration saved successfully.";
                lblSettingsMessage.ForeColor = System.Drawing.Color.FromArgb(127, 224, 155);
                lblSettingsMessage.Visible = true;
            }
            catch (Exception ex)
            {
                ShowError("Save error: " + ex.Message);
            }
        }

        private void ShowError(string message)
        {
            lblSettingsMessage.Text = message;
            lblSettingsMessage.ForeColor = System.Drawing.Color.FromArgb(255, 102, 102);
            lblSettingsMessage.Visible = true;
        }
    }

    // =========================================
    // MODEL CLASS
    // =========================================
    public class SettingsData
    {
        public string CinemaName { get; set; }
        public string Headquarters { get; set; }
        public string Timezone { get; set; }
        public string Currency { get; set; }
        public int SessionTimeout { get; set; }
        public string DashboardTheme { get; set; }
        public string SystemLanguage { get; set; }
        public string FooterMessage { get; set; }
        public bool SystemAlerts { get; set; }
        public bool DailySms { get; set; }
        public bool AdminPush { get; set; }
        public bool Marketing { get; set; }
        public bool TwoFactor { get; set; }
    }
}