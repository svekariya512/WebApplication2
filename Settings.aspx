<%@ Page Title="Settings" Language="C#" MasterPageFile="~/Site1.Master" 
    AutoEventWireup="true" CodeBehind="Settings.aspx.cs" 
    Inherits="WebApplication2.Settings" %>

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

        .settings-main-card {
            width: 100%;
            max-width: 100%;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 22px;
        }

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

        .access-local-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 30px;
        }

        .security-column,
        .localization-column { width: 100%; }

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

        .toggle {
            width: 32px;
            height: 18px;
            background: #ffaaa1;
            border-radius: 10px;
            position: relative;
            cursor: pointer;
            transition: 0.2s;
        }

        .toggle-circle {
            width: 14px;
            height: 14px;
            background: #ffffff;
            border-radius: 50%;
            position: absolute;
            top: 2px;
            right: 2px;
            transition: 0.2s;
        }

        .local-field { margin-bottom: 14px; }
        .local-field:last-child { margin-bottom: 0; }

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

        .settings-message {
            display: none;
            margin-top: 12px;
            color: #7fe09b;
            font-size: 10px;
            text-align: right;
        }

        /* Error message styling */
        .settings-error {
            display: block;
            color: #ff6666;
            font-size: 10px;
            margin-top: 5px;
        }

        .home-hamburger {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 4px;
            width: 24px;
            height: 24px;
            cursor: pointer;
            flex-shrink: 0;
        }
        .home-hamburger span {
            display: block;
            width: 20px;
            height: 2px;
            background: #FFC3B9;
            border-radius: 2px;
            transition: 0.2s;
        }
        .home-hamburger:hover span { background: #ffb0a3; }

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

    <!-- JAVASCRIPT: Show hamburger + Inject "Settings" title in header -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("settingsHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "settingsHeaderTitle";
                titleEl.innerText = "Settings";
                titleEl.style.color = "#FFC3B9";
                titleEl.style.fontSize = "22px";
                titleEl.style.fontWeight = "500";
                titleEl.style.letterSpacing = "0.5px";
                titleEl.style.whiteSpace = "nowrap";
                titleEl.style.flexShrink = "0";
                titleEl.style.marginLeft = "10px";
                titleEl.style.marginRight = "10px";
                header.insertBefore(titleEl, searchArea);
            }
        });

        /* Toggle Two-Factor - aa JavaScript ma j rahe chhe UI mate */
        function toggleTwoFactor() {
            var toggle = document.getElementById("twoFactorToggle");
            var circle = toggle.querySelector(".toggle-circle");
            var hdn = document.getElementById("hdnTwoFactor");

            if (toggle.style.background === "rgb(60, 60, 60)") {
                toggle.style.background = "#ffaaa1";
                circle.style.right = "2px";
                circle.style.left = "";
                if (hdn) hdn.value = "true";
            }
            else {
                toggle.style.background = "#3c3c3c";
                circle.style.right = "";
                circle.style.left = "2px";
                if (hdn) hdn.value = "false";
            }
        }

        /* Discard */
        function discardSettings() {
            var result = confirm("Discard all changes?");
            if (result) { location.reload(); }
        }

        /* Character counter - visual only */
        var announcement = document.getElementById("footerMessage");
        if (announcement) {
            announcement.addEventListener("input", function () {
                if (this.value.length > 150) {
                    this.value = this.value.substring(0, 150);
                }
            });
        }
    </script>

    <div class="settings-page">

        <div class="settings-page-header">
            <div class="settings-subtitle">
                Global control center
                <span>·</span>
                Admin preferences &amp; configuration
            </div>
        </div>


        <div class="settings-main-card">

            <!-- GENERAL CONFIGURATION -->
            <div class="settings-section">
                <div class="settings-section-title">General Configuration</div>
                <div class="settings-section-line"></div>

                <div class="settings-grid">
                    <div class="settings-field">
                        <label class="settings-label">Cinema Name</label>
                        <asp:TextBox ID="txtCinemaName" runat="server" ClientIDMode="Static" 
                            CssClass="settings-input" MaxLength="100" />
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Headquarters Location</label>
                        <asp:TextBox ID="txtHeadquarters" runat="server" ClientIDMode="Static" 
                            CssClass="settings-input" MaxLength="100" />
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Default Timezone</label>
                        <asp:DropDownList ID="ddlTimezone" runat="server" ClientIDMode="Static" 
                            CssClass="settings-select">
                            <asp:ListItem Text="India Standard Time (IST)" Value="IST" />
                            <asp:ListItem Text="UTC" Value="UTC" />
                            <asp:ListItem Text="Eastern Standard Time" Value="EST" />
                            <asp:ListItem Text="Pacific Standard Time" Value="PST" />
                        </asp:DropDownList>
                    </div>

                    <div class="settings-field">
                        <label class="settings-label">Operating Currency</label>
                        <asp:DropDownList ID="ddlCurrency" runat="server" ClientIDMode="Static" 
                            CssClass="settings-select">
                            <asp:ListItem Text="Indian Rupee (₹)" Value="INR" />
                            <asp:ListItem Text="US Dollar ($)" Value="USD" />
                            <asp:ListItem Text="Euro (€)" Value="EUR" />
                            <asp:ListItem Text="Pound Sterling (£)" Value="GBP" />
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
                        <asp:CheckBox ID="chkSystemAlerts" runat="server" ClientIDMode="Static" 
                            CssClass="communication-checkbox" />
                        <div class="communication-content">
                            <div class="communication-title">System Alerts (Email)</div>
                            <div class="communication-description">Receive critical system downtime and error reports.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkDailySms" runat="server" ClientIDMode="Static" 
                            CssClass="communication-checkbox" />
                        <div class="communication-content">
                            <div class="communication-title">Daily SMS Summaries</div>
                            <div class="communication-description">Ticket sales and revenue summaries via text.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkAdminPush" runat="server" ClientIDMode="Static" 
                            CssClass="communication-checkbox" />
                        <div class="communication-content">
                            <div class="communication-title">Admin Push Notifications</div>
                            <div class="communication-description">Real-time alerts for high-value transactions.</div>
                        </div>
                    </div>

                    <div class="communication-box">
                        <asp:CheckBox ID="chkMarketing" runat="server" ClientIDMode="Static" 
                            CssClass="communication-checkbox" />
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

                    <div class="security-column">
                        <div class="settings-section-title">Access &amp; Security</div>
                        <div class="settings-section-line"></div>

                        <div class="two-factor-box">
                            <div>
                                <div class="two-factor-title">Two-Factor Authentication</div>
                                <div class="two-factor-description">Require OTP on login</div>
                            </div>
                            <div class="toggle" id="twoFactorToggle" onclick="toggleTwoFactor();">
                                <div class="toggle-circle"></div>
                            </div>
                        </div>

                        <asp:HiddenField ID="hdnTwoFactor" runat="server" ClientIDMode="Static" Value="true" />

                        <div class="settings-field">
                            <label class="settings-label">Session Timeout (Minutes)</label>
                            <asp:TextBox ID="txtSessionTimeout" runat="server" ClientIDMode="Static" 
                                CssClass="settings-input" TextMode="Number" />
                            <asp:Label ID="lblSessionError" runat="server" CssClass="settings-error" Visible="false" />
                        </div>
                    </div>

                    <div class="localization-column">
                        <div class="settings-section-title">Localization</div>
                        <div class="settings-section-line"></div>

                        <div class="local-field">
                            <label class="settings-label">Admin Dashboard Theme</label>
                            <asp:DropDownList ID="ddlDashboardTheme" runat="server" ClientIDMode="Static" 
                                CssClass="settings-select">
                                <asp:ListItem Text="Cinematic Dark (Active)" Value="CinematicDark" />
                                <asp:ListItem Text="Classic Dark" Value="ClassicDark" />
                                <asp:ListItem Text="Light" Value="Light" />
                            </asp:DropDownList>
                        </div>

                        <div class="local-field">
                            <label class="settings-label">System Language</label>
                            <asp:DropDownList ID="ddlSystemLanguage" runat="server" ClientIDMode="Static" 
                                CssClass="settings-select">
                                <asp:ListItem Text="English (US)" Value="en-US" />
                                <asp:ListItem Text="English (UK)" Value="en-GB" />
                                <asp:ListItem Text="Gujarati" Value="gu-IN" />
                                <asp:ListItem Text="Hindi" Value="hi-IN" />
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
                <asp:TextBox ID="txtFooterMessage" runat="server" ClientIDMode="Static" 
                    CssClass="announcement-textarea" TextMode="MultiLine" MaxLength="150" />
                <asp:Label ID="lblFooterError" runat="server" CssClass="settings-error" Visible="false" />
            </div>


            <!-- ACTION BUTTONS -->
            <div class="settings-actions">
                <button type="button" class="discard-button" onclick="discardSettings();">Discard Changes</button>
                <asp:Button ID="btnSaveConfiguration" runat="server" ClientIDMode="Static" 
                    CssClass="save-config-button" Text="⊙  Save Configuration" 
                    OnClick="btnSaveConfiguration_Click" />
            </div>

            <asp:Label ID="lblSettingsMessage" runat="server" CssClass="settings-message" Visible="false" />
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