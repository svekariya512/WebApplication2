<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication2.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* =========================================
           ADMIN PROFILE
        ========================================= */
        .profile-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            color: #ffffff;
            padding: 25px 34px 40px 34px;
        }

        .profile-subtitle {
            color: #858585;
            font-size: 12px;
            margin-bottom: 24px;
        }

        /* =========================================
           MAIN LAYOUT
        ========================================= */
        .profile-container {
            width: 100%;
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 18px;
            align-items: start;
        }

        /* =========================================
           LEFT PROFILE CARD
        ========================================= */
        .profile-user-card {
            background: #292929;
            border-radius: 7px;
            min-height: 280px;
            padding: 22px 18px;
            text-align: center;
        }

        .profile-user-icon {
            width: 58px;
            height: 58px;
            margin: 0 auto 14px auto;
            background: #53677f;
            border-radius: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .profile-user-icon svg {
            width: 32px;
            height: 32px;
            fill: #dce4ee;
        }

        .profile-user-name {
            color: #ffffff;
            font-size: 15px;
            font-weight: 700;
            margin-bottom: 6px;
        }

        .profile-user-email {
            color: #888888;
            font-size: 11px;
            margin-bottom: 12px;
        }

        .profile-admin-badge {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            background: #401d1d;
            color: #ff6868;
            padding: 5px 12px;
            border-radius: 12px;
            font-size: 10px;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .profile-admin-badge svg {
            width: 11px;
            height: 11px;
            fill: #ff6868;
        }

        .profile-joined {
            color: #858585;
            font-size: 11px;
        }

        /* =========================================
           RIGHT SIDE
        ========================================= */
        .profile-right { width: 100%; }

        .profile-settings-card {
            background: #292929;
            border-radius: 7px;
            padding: 22px;
            width: 100%;
        }

        .profile-settings-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
            flex-wrap: wrap;
            gap: 12px;
        }

        .profile-settings-title {
            color: #ffffff;
            font-size: 14px;
            font-weight: 500;
        }

        .profile-action-buttons {
            display: flex;
            gap: 10px;
        }

        /* EDIT PROFILE BUTTON (Red) */
        .profile-edit-button {
            border: none;
            outline: none;
            background: #ff5f5f;
            color: #ffffff;
            height: 34px;
            padding: 0 18px;
            border-radius: 5px;
            font-size: 11px;
            cursor: pointer;
            font-weight: 500;
            transition: 0.2s;
        }
        .profile-edit-button:hover { background: #ff4646; }

        /* RESET PASSWORD BUTTON (Outline) */
        .profile-reset-button {
            height: 34px;
            padding: 0 16px;
            background: transparent;
            border: 1px solid #414141;
            border-radius: 5px;
            color: #bdbdbd;
            font-size: 11px;
            cursor: pointer;
            transition: 0.2s;
        }
        .profile-reset-button:hover {
            background: #343434;
            color: #ffffff;
            border-color: #555555;
        }

        /* =========================================
           FORM GRID
        ========================================= */
        .profile-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 16px;
            row-gap: 16px;
        }

        .profile-field { width: 100%; }

        .profile-field label {
            display: block;
            color: #b0b0b0;
            font-size: 10px;
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            font-weight: 500;
        }

        /* INPUT STYLE — TEXT CLEARLY VISIBLE */
        .profile-field input,
        .profile-field select {
            width: 100%;
            height: 38px;
            padding: 0 12px;
            border-radius: 4px;
            border: 1px solid #3f3f3f;
            outline: none;
            background: #1b1b1b;
            color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 12px;
            box-sizing: border-box;
        }

        .profile-field input:focus,
        .profile-field select:focus {
            border-color: #FFC3B9;
        }

        .profile-field select { cursor: pointer; }
        .profile-field select option { background: #1b1b1b; color: #ffffff; }

        /* =========================================
           HAMBURGER
        ========================================= */
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
        }

        /* =========================================
           RESPONSIVE
        ========================================= */
        @media screen and (max-width: 900px) {
            .profile-page { padding: 25px 20px; }
            .profile-container { grid-template-columns: 200px minmax(0, 1fr); }
        }
        @media screen and (max-width: 700px) {
            .profile-page { padding: 20px 15px; }
            .profile-container { grid-template-columns: 1fr; }
            .profile-form-grid { grid-template-columns: 1fr; }
            .profile-settings-header { flex-direction: column; align-items: stretch; }
            .profile-action-buttons { justify-content: stretch; }
            .profile-edit-button, .profile-reset-button { flex: 1; }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Add "Admin Profile" title -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var titleEl = document.createElement("div");
                titleEl.innerText = "Admin Profile";
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
    </script>


    <div class="profile-page">

        <!-- PAGE SUBTITLE -->
        <p class="profile-subtitle">
            Manage your personal settings, security, and administrative preferences.
        </p>


        <!-- MAIN CONTAINER -->
        <div class="profile-container">

            <!-- LEFT USER CARD -->
            <div class="profile-user-card">
                <div class="profile-user-icon">
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 12c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm0 2c-3.33 0-10 1.67-10 5v3h20v-3c0-3.33-6.67-5-10-5z"/>
                    </svg>
                </div>

                <div class="profile-user-name">Vekariya Shriya</div>
                <div class="profile-user-email">v.shriya@cinepulse.com</div>

                <div class="profile-admin-badge">
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 2L4 5v6c0 5.25 3.4 10.18 8 11 4.6-.82 8-5.75 8-11V5l-8-3z"/>
                    </svg>
                    ADMIN
                </div>

                <div class="profile-joined">Joined: Oct 2021</div>
            </div>


            <!-- RIGHT CONTENT -->
            <div class="profile-right">

                <div class="profile-settings-card">

                    <div class="profile-settings-header">
                        <div class="profile-settings-title">Profile Settings</div>

                        <div class="profile-action-buttons">
                            <button type="button" class="profile-edit-button" onclick="editProfile();">
                                ✎ &nbsp; Edit Profile
                            </button>

                            <button type="button" class="profile-reset-button" onclick="resetPassword();">
                                ↻ &nbsp; Reset Password
                            </button>
                        </div>
                    </div>


                    <div class="profile-form-grid">

                        <div class="profile-field">
                            <label>Full Name</label>
                            <input type="text" value="Vekariya Shriya" readonly />
                        </div>

                        <div class="profile-field">
                            <label>Email Address</label>
                            <input type="email" value="v.shriya@cinepulse.com" readonly />
                        </div>

                        <div class="profile-field">
                            <label>Role Title</label>
                            <input type="text" value="Senior System Administrator" readonly />
                        </div>

                        <div class="profile-field">
                            <label>Birth Date</label>
                            <input type="date" value="1995-05-15" readonly />
                        </div>

                        <div class="profile-field">
                            <label>Gender</label>
                            <select disabled>
                                <option>Female</option>
                            </select>
                        </div>

                        <div class="profile-field">
                            <label>Phone Number</label>
                            <input type="text" value="+1 (555) 000-0000" readonly />
                        </div>

                        <div class="profile-field">
                            <label>Location / Address</label>
                            <input type="text" value="City, Country" readonly />
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->
    <script type="text/javascript">

        function editProfile() {
            window.location.href = "EditProfile.aspx";
        }

        function resetPassword() {
            window.location.href = "Reset.aspx";
        }

    </script>

</asp:Content>