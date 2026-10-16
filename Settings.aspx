<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="WebApplication2.Settings" %>

<asp:Content ID="SettingsHead" ContentPlaceHolderID="head" runat="server">
    <style>
        /* =========================================
           SETTINGS PAGE
        ========================================= */
        .settings-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            color: #ffffff;
            padding: 25px 30px 45px 30px;
        }

        /* =========================================
           PAGE HEADER (subtitle only, title in header)
        ========================================= */
        .settings-page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .settings-subtitle {
            color: #8a8a8a;
            font-size: 12px;
        }
        .settings-subtitle span { color: #aaaaaa; }

        /* =========================================
           MAIN SETTINGS CARD
        ========================================= */
        .settings-main-card {
            width: 100%;
            max-width: 100%;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 22px;
        }

        /* =========================================
           SECTION
        ========================================= */
        .settings-section { margin-bottom: 25px; }
        .settings-section:last-child { margin-bottom: 0; }

        .settings-section-title {
            color: #ffb4a8;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 1.3px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .settings-section-line {
            width: 100%;
            height: 1px;
            background: #302b2b;
            margin-bottom: 15px;
        }

        /* =========================================
           TWO COLUMN GRID
        ========================================= */
        .settings-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 16px;
            row-gap: 15px;
        }

        .settings-field { width: 100%; }

        .settings-label {
            display: block;
            color: #a5a5a5;
            font-size: 10px;
            margin-bottom: 7px;
        }

        .settings-input,
        .settings-select {
            width: 100%;
            height: 32px;
            background: #0f0f0f;
            border: 1px solid #353535;
            border-radius: 3px;
            color: #e5e5e5;
            padding: 0 10px;
            outline: none;
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
        }
        .settings-input:focus,
        .settings-select:focus { border-color: #555555; }

        .settings-select { cursor: pointer; }
        .settings-select option { background: #181818; color: #ffffff; }

        /* =========================================
           COMMUNICATION BOXES
        ========================================= */
        .communication-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px 15px;
        }

        .communication-box {
            min-height: 58px;
            background: #101010;
            border: 1px solid #343434;
            border-radius: 3px;
            padding: 12px;
            display: flex;
            align-items: flex-start;
            gap: 10px;
        }

        .communication-checkbox {
            width: 12px;
            height: 12px;
            margin-top: 2px;
            accent-color: #ff6a68;
            flex-shrink: 0;
            cursor: pointer;
        }

        .communication-content { min-width: 0; }

        .communication-title {
            color: #dddddd;
            font-size: 11px;
            margin-bottom: 3px;
        }

        .communication-description {
            color: #888888;
            font-size: 9px;
            line-height: 13px;
            max-width: 220px;
        }

        /* =========================================
           ACCESS + LOCALIZATION
        ========================================= */
        .access-local-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 30px;
        }

        .security-column,
        .localization-column { width: 100%; }

        /* =========================================
           TOGGLE BOX
        ========================================= */
        .two-factor-box {
            width: 100%;
            height: 48px;
            background: #101010;
            border: 1px solid #343434;
            border-radius: 3px;
            padding: 8px 12px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 13px;
        }

        .two-factor-title {
            color: #dddddd;
            font-size: 10px;
        }

        .two-factor-description {
            color: #888888;
            font-size: 9px;
            margin-top: 3px;
        }

        /* =========================================
           TOGGLE SWITCH (CUSTOM)
        ========================================= */
        .toggle-wrapper {
            position: relative;
            display: inline-block;
            width: 32px;
            height: 18px;
            flex-shrink: 0;
        }

        .toggle-wrapper input[type="checkbox"] {
            opacity: 0;
            width: 0;
            height: 0;
            position: absolute;
        }

        .toggle-slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #3c3c3c;
            border-radius: 10px;
            transition: 0.2s;
        }

        .toggle-slider:before {
            position: absolute;
            content: "";
            height: 14px;
            width: 14px;
            left: 2px;
            bottom: 2px;
            background-color: #ffffff;
            border-radius: 50%;
            transition: 0.2s;
        }

        .toggle-wrapper input[type="checkbox"]:checked + .toggle-slider {
            background-color: #ffaaa1;
        }

        .toggle-wrapper input[type="checkbox"]:checked + .toggle-slider:before {
            transform: translateX(14px);
        }

        /* =========================================
           LOCALIZATION SELECTS
        ========================================= */
        .local-field { margin-bottom: 14px; }
        .local-field:last-child { margin-bottom: 0; }

        /* =========================================
           GLOBAL ANNOUNCEMENTS
        ========================================= */
        .announcement-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .announcement-limit {
            color: #858585;
            font-size: 9px;
        }

        .announcement-textarea {
            width: 100%;
            min-height: 80px;
            resize: vertical;
            background: #101010;
            border: 1px solid #363636;
            border-radius: 3px;
            color: #d7d7d7;
            padding: 12px;
            outline: none;
            font-size: 11px;
            font-family: Arial, Helvetica, sans-serif;
            line-height: 16px;
        }
        .announcement-textarea:focus { border-color: #555555; }

        /* =========================================
           ACTION BUTTONS
        ========================================= */
        .settings-actions {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 10px;
            border-top: 1px solid #303030;
            padding-top: 20px;
            margin-top: 20px;
        }

        .discard-button {
            height: 34px;
            padding: 0 18px;
            background: #191919;
            color: #aaaaaa;
            border: 1px solid #353535;
            border-radius: 3px;
            font-size: 10px;
            cursor: pointer;
            transition: 0.2s;
        }
        .discard-button:hover { background: #252525; color: #ffffff; }

        .save-config-button {
            height: 34px;
            padding: 0 20px;
            background: #ffaaa1;
            color: #321b1a;
            border: none;
            border-radius: 3px;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }
        .save-config-button:hover { background: #ff8f84; }

        /* =========================================
           BOTTOM STATUS BAR
        ========================================= */
        .settings-status-bar {
            width: 100%;
            max-width: 585px;
            min-height: 32px;
            margin: 25px auto 0 auto;
            padding: 0 15px;
            border-radius: 6px;
            background: #080808;
            border: 1px solid #252525;
            display: flex;
            justify-content: space-between;
            align-items: center;
            color: #999999;
            font-size: 9px;
        }

        .status-left, .status-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .status-active { color: #bdbdbd; }
        .status-live { color: #ff6b68; }

        /* =========================================
           MESSAGE
        ========================================= */
        .settings-message {
            display: block;
            margin-top: 12px;
            color: #7fe09b;
            font-size: 10px;
            text-align: right;
        }

        .settings-message.error {
            color: #ff6b6b;
        }

        /* =========================================
           RESPONSIVE
        ========================================= */
        @media screen and (max-width: 900px) {
            .settings-grid,
            .communication-grid,
            .access-local-grid {
                grid-template-columns: 1fr;
            }
            .settings-page { padding: 20px; }
        }

        @media screen and (max-width: 600px) {
            .settings-page { padding: 15px; }
            .settings-main-card { padding: 15px; }
            .settings-actions { justify-content: stretch; }
            .discard-button, .save-config-button { flex: 1; }
            .settings-status-bar { flex-direction: column; gap: 5px; padding: 8px; }
        }
    </style>
</asp:Content>


<asp:Content ID="SettingsContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="settings-page">

        <!-- PAGE HEADER (subtitle only) -->
        <div class="settings-page-header">
            <div class="settings-subtitle">
                Global control center
                <span>·</span>
                Admin preferences &amp; configuration
            </div>
        </div>


        <!-- MAIN SETTINGS CARD -->
        <div class="settings-main-card">

            <!-- GENERAL CONFIGURATION -->
            <div class="settings-section">
                <div class="settings-section-title">General Configuration</div>
                <div class="settings-section-line"></div>

                <div class="settings-grid">
                    <div class="settings-field">
                        <label class="settings-label">Cinema Name</label>
                        <asp:TextBox ID="txtCinemaName" runat="server" CssClass="settings-input" Text="CinePulse Global" />
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Headquarters Location</label>
                        <asp:TextBox ID="txtHeadquarters" runat="server" CssClass="settings-input" Text="Rajkot, Gujarat" />
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Default Timezone</label>
                        <asp:DropDownList ID="ddlTimezone" runat="server" CssClass="settings-select">
                            <asp:ListItem>India Standard Time (IST)</asp:ListItem>
                            <asp:ListItem>UTC</asp:ListItem>
                            <asp:ListItem>Eastern Standard Time</asp:ListItem>
                            <asp:ListItem>Pacific Standard Time</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Operating Currency</label>
                        <asp:DropDownList ID="ddlCurrency" runat="server" CssClass="settings-select">
                            <asp:ListItem>Indian Rupee (₹)</asp:ListItem>
                            <asp:ListItem>US Dollar ($)</asp:ListItem>
                            <asp:ListItem>Euro (€)</asp:ListItem>
                            <asp:ListItem>Pound Sterling (£)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>


            <!-- COMMUNICATIONS -->
            <div class="settings-section">
                <div class="settings-section-title">Communications</div>
                <div class="settings-section-line"></div>

                <div class="communication-grid">
                    <div class="communication-box">
                        <asp:CheckBox ID="chkSystemAlerts" runat="server" CssClass="communication-checkbox" Checked="true" />
                        <div class="communication-content">
                            <div class="communication-title">System Alerts (Email)</div>
                            <div class="communication-description">Receive critical system downtime and error reports.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkDailySms" runat="server" CssClass="communication-checkbox" Checked="true" />
                        <div class="communication-content">
                            <div class="communication-title">Daily SMS Summaries</div>
                            <div class="communication-description">Ticket sales and revenue summaries via text.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkAdminPush" runat="server" CssClass="communication-checkbox" />
                        <div class="communication-content">
                            <div class="communication-title">Admin Push Notifications</div>
                            <div class="communication-description">Real-time alerts for high-value transactions.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkMarketing" runat="server" CssClass="communication-checkbox" />
                        <div class="communication-content">
                            <div class="communication-title">Marketing Broadcasts</div>
                            <div class="communication-description">Receive copies of promotional campaigns sent to users.</div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- ACCESS + LOCALIZATION -->
            <div class="settings-section">
                <div class="access-local-grid">

                    <!-- ACCESS & SECURITY -->
                    <div class="security-column">
                        <div class="settings-section-title">Access &amp; Security</div>
                        <div class="settings-section-line"></div>

                        <div class="two-factor-box">
                            <div>
                                <div class="two-factor-title">Two-Factor Authentication</div>
                                <div class="two-factor-description">Require OTP on login</div>
                            </div>
                            <!-- ⭐ સાચો ટોગલ સ્વિચ -->
                            <label class="toggle-wrapper">
                                <asp:CheckBox ID="chkTwoFactor" runat="server" Checked="true" />
                                <span class="toggle-slider"></span>
                            </label>
                        </div>

                        <div class="settings-field">
                            <label class="settings-label">Session Timeout (Minutes)</label>
                            <asp:TextBox ID="txtSessionTimeout" runat="server" CssClass="settings-input" TextMode="Number" Text="30" />
                        </div>
                    </div>

                    <!-- LOCALIZATION -->
                    <div class="localization-column">
                        <div class="settings-section-title">Localization</div>
                        <div class="settings-section-line"></div>

                        <div class="local-field">
                            <label class="settings-label">Admin Dashboard Theme</label>
                            <asp:DropDownList ID="ddlDashboardTheme" runat="server" CssClass="settings-select">
                                <asp:ListItem>Cinematic Dark (Active)</asp:ListItem>
                                <asp:ListItem>Classic Dark</asp:ListItem>
                                <asp:ListItem>Light</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="local-field">
                            <label class="settings-label">System Language</label>
                            <asp:DropDownList ID="ddlSystemLanguage" runat="server" CssClass="settings-select">
                                <asp:ListItem>English (US)</asp:ListItem>
                                <asp:ListItem>English (UK)</asp:ListItem>
                                <asp:ListItem>Gujarati</asp:ListItem>
                                <asp:ListItem>Hindi</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                </div>
            </div>


            <!-- GLOBAL ANNOUNCEMENTS -->
            <div class="settings-section">
                <div class="announcement-header">
                    <div class="settings-section-title">Global Announcements</div>
                    <div class="announcement-limit">Max 150 chars</div>
                </div>
                <div class="settings-section-line"></div>

                <label class="settings-label">Footer Message (Visible to all users)</label>
                <asp:TextBox ID="txtFooterMessage" runat="server" CssClass="announcement-textarea" TextMode="MultiLine"
                    MaxLength="150" Text="System maintenance scheduled for Sunday 02:00 AM IST. Expect minor disruptions." />
            </div>


            <!-- ACTION BUTTONS -->
            <div class="settings-actions">
                <asp:Button ID="btnDiscard" runat="server" CssClass="discard-button" Text="Discard Changes"
                    OnClick="btnDiscard_Click" CausesValidation="false" />
                <asp:Button ID="btnSave" runat="server" CssClass="save-config-button" Text="⊙  Save Configuration"
                    OnClick="btnSave_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="settings-message" Visible="false" />
        </div>


        <!-- BOTTOM STATUS BAR -->
        <div class="settings-status-bar">
            <div class="status-left">
                <span class="status-active">◉ Active: SuperAdmin</span>
                <span>▣ 1.2K Tickets Managed</span>
            </div>
            <div class="status-right">
                <span>Last synced: Today, 14:32</span>
                <span class="status-live">◉ Live</span>
            </div>
        </div>

    </div>

</asp:Content>
