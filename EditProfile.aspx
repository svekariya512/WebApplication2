<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="WebApplication2.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        /* =========================================
           EDIT PROFILE
        ========================================= */
        .edit-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            color: #ffffff;
            padding: 25px 34px 40px 34px;
        }

        .edit-subtitle {
            color: #858585;
            font-size: 12px;
            margin-bottom: 24px;
        }

        /* =========================================
           MAIN LAYOUT
        ========================================= */
        .edit-container {
            width: 100%;
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 18px;
            align-items: start;
        }

        /* =========================================
           LEFT AVATAR CARD
        ========================================= */
        .edit-user-card {
            background: #292929;
            border-radius: 7px;
            min-height: 280px;
            padding: 22px 18px;
            text-align: center;
        }

        .edit-user-icon {
            width: 78px;
            height: 78px;
            margin: 0 auto 14px auto;
            background: #53677f;
            border-radius: 12px;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
            cursor: pointer;
            transition: 0.2s;
            overflow: hidden;
        }

        .edit-user-icon:hover {
            background: #607590;
        }

        .edit-user-icon svg {
            width: 42px;
            height: 42px;
            fill: #dce4ee;
        }

        .edit-upload-overlay {
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.65);
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFC3B9;
            font-size: 20px;
            opacity: 0;
            transition: 0.2s;
        }

        .edit-user-icon:hover .edit-upload-overlay {
            opacity: 1;
        }

        .edit-user-hint {
            color: #858585;
            font-size: 10px;
            margin-top: 10px;
            line-height: 14px;
        }

        /* =========================================
           RIGHT FORM CARD
        ========================================= */
        .edit-form-card {
            background: #292929;
            border-radius: 7px;
            padding: 22px;
            width: 100%;
        }

        .edit-form-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .edit-form-title {
            color: #ffffff;
            font-size: 14px;
            font-weight: 500;
        }

        /* =========================================
           FORM GRID
        ========================================= */
        .edit-form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            column-gap: 16px;
            row-gap: 16px;
        }

        .edit-field {
            width: 100%;
        }

        .edit-field label {
            display: block;
            color: #b0b0b0;
            font-size: 10px;
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.3px;
            font-weight: 500;
        }

        .edit-field input,
        .edit-field select,
        .edit-field textarea {
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
            transition: 0.2s;
        }

        .edit-field textarea {
            height: 80px;
            padding: 10px 12px;
            resize: vertical;
            line-height: 16px;
        }

        .edit-field input:focus,
        .edit-field select:focus,
        .edit-field textarea:focus {
            border-color: #FFC3B9;
            background: #171717;
        }

        .edit-field select {
            cursor: pointer;
        }

        .edit-field select option {
            background: #1b1b1b;
            color: #ffffff;
        }

        /* =========================================
           ACTION BUTTONS
        ========================================= */
        .edit-actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 22px;
            padding-top: 18px;
            border-top: 1px solid #3a3a3a;
        }

        .edit-cancel-btn {
            height: 34px;
            padding: 0 20px;
            background: transparent;
            border: 1px solid #414141;
            border-radius: 5px;
            color: #bdbdbd;
            font-size: 11px;
            cursor: pointer;
            transition: 0.2s;
        }

        .edit-cancel-btn:hover {
            background: #343434;
            color: #ffffff;
            border-color: #555555;
        }

        .edit-save-btn {
            height: 34px;
            padding: 0 24px;
            background: #ff5f5f;
            border: none;
            border-radius: 5px;
            color: #ffffff;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .edit-save-btn:hover {
            background: #ff4646;
        }

        /* SUCCESS MESSAGE */
        .edit-message {
            display: none;
            padding: 10px 14px;
            background: rgba(74, 222, 128, 0.12);
            border: 1px solid rgba(74, 222, 128, 0.35);
            border-radius: 5px;
            color: #4ade80;
            font-size: 11px;
            margin-bottom: 16px;
        }

        .edit-message.show {
            display: block;
        }

        /* =========================================
           DYNAMIC HAMBURGER
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
            .edit-page {
                padding: 25px 20px;
            }

            .edit-container {
                grid-template-columns: 200px minmax(0, 1fr);
            }
        }

        @media screen and (max-width: 700px) {
            .edit-page {
                padding: 20px 15px;
            }

            .edit-container {
                grid-template-columns: 1fr;
            }

            .edit-form-grid {
                grid-template-columns: 1fr;
            }

            .edit-actions {
                justify-content: stretch;
            }

            .edit-cancel-btn,
            .edit-save-btn {
                flex: 1;
            }
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- =========================================
         HEADER TITLE + HAMBURGER
    ========================================= -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            /* Show hamburger */
            var hamburger = document.getElementById("mainHamburger");

            if (hamburger) {
                hamburger.style.display = "flex";
            }

            /* Add Edit Profile title */
            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {

                var oldTitle = document.getElementById("editProfileHeaderTitle");

                if (!oldTitle) {

                    var titleEl = document.createElement("div");

                    titleEl.id = "editProfileHeaderTitle";
                    titleEl.innerText = "Edit Profile";

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
            }
        });
    </script>


    <div class="edit-page">

        <!-- PAGE SUBTITLE -->
        <p class="edit-subtitle">
            Update your personal information and profile picture.
        </p>


        <!-- =========================================
             EDIT CONTAINER
        ========================================= -->
        <div class="edit-container">


            <!-- =========================================
                 LEFT AVATAR UPLOAD CARD
            ========================================= -->
            <div class="edit-user-card">

                <div class="edit-user-icon"
                     onclick="document.getElementById('avatarInput').click();">

                    <svg viewBox="0 0 24 24"
                         xmlns="http://www.w3.org/2000/svg">

                        <path d="M12 12c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm0 2c-3.33 0-10 1.67-10 5v3h20v-3c0-3.33-6.67-5-10-5z"/>

                    </svg>

                    <div class="edit-upload-overlay">📷</div>

                </div>

                <input type="file"
                       id="avatarInput"
                       style="display:none;"
                       accept="image/*"
                       onchange="previewAvatar(this);" />

                <div class="edit-user-hint">
                    Click to upload<br />
                    new profile picture
                </div>

            </div>


            <!-- =========================================
                 RIGHT FORM CARD
            ========================================= -->
            <div class="edit-form-card">

                <div class="edit-form-header">

                    <div class="edit-form-title">
                        Edit Profile Information
                    </div>

                </div>

                <div id="editMessage"
                     class="edit-message">

                    ✓ Profile updated successfully!

                </div>


                <div class="edit-form-grid">

                    <!-- FULL NAME -->
                    <div class="edit-field">

                        <label for="fullName">
                            Full Name
                        </label>

                        <input type="text"
                               id="fullName"
                               value="Vekariya Shriya" />

                    </div>


                    <!-- EMAIL -->
                    <div class="edit-field">

                        <label for="email">
                            Email Address
                        </label>

                        <input type="email"
                               id="email"
                               value="v.shriya@cinepulse.com" />

                    </div>


                    <!-- ROLE -->
                    <div class="edit-field">

                        <label for="role">
                            Role Title
                        </label>

                        <input type="text"
                               id="role"
                               value="Senior System Administrator" />

                    </div>


                    <!-- BIRTH DATE -->
                    <div class="edit-field">

                        <label for="birthDate">
                            Birth Date
                        </label>

                        <input type="date"
                               id="birthDate"
                               value="1995-05-15" />

                    </div>


                    <!-- GENDER -->
                    <div class="edit-field">

                        <label for="gender">
                            Gender
                        </label>

                        <select id="gender">

                            <option value="">
                                Select Gender
                            </option>

                            <option value="Male">
                                Male
                            </option>

                            <option value="Female"
                                    selected>
                                Female
                            </option>

                            <option value="Other">
                                Other
                            </option>

                        </select>

                    </div>


                    <!-- PHONE -->
                    <div class="edit-field">

                        <label for="phone">
                            Phone Number
                        </label>

                        <input type="text"
                               id="phone"
                               value="+1 (555) 000-0000" />

                    </div>


                    <!-- LOCATION -->
                    <div class="edit-field"
                         style="grid-column: span 2;">

                        <label for="location">
                            Location / Address
                        </label>

                        <input type="text"
                               id="location"
                               value="City, Country" />

                    </div>


                    <!-- BIO -->
                    <div class="edit-field"
                         style="grid-column: span 2;">

                        <label for="bio">
                            Bio / About
                        </label>

                        <textarea id="bio">Senior System Administrator with expertise in cinema operations and team management.</textarea>

                    </div>

                </div>


                <!-- ACTION BUTTONS -->
                <div class="edit-actions">

                    <button type="button"
                            class="edit-cancel-btn"
                            onclick="cancelEdit();">

                        Cancel

                    </button>

                    <button type="button"
                            class="edit-save-btn"
                            onclick="saveChanges();">

                        Save Changes

                    </button>

                </div>

            </div>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->
    <script type="text/javascript">

        /* PREVIEW AVATAR */
        function previewAvatar(input) {

            if (input.files && input.files[0]) {

                var reader = new FileReader();

                reader.onload = function (e) {

                    var icon = document.querySelector(".edit-user-icon");

                    icon.style.backgroundImage =
                        "url(" + e.target.result + ")";

                    icon.style.backgroundSize = "cover";
                    icon.style.backgroundPosition = "center";

                    icon.querySelector("svg").style.display = "none";
                };

                reader.readAsDataURL(input.files[0]);
            }
        }


        /* SAVE CHANGES */
        function saveChanges() {

            var msg = document.getElementById("editMessage");

            msg.classList.add("show");

            setTimeout(function () {

                window.location.href = "Profile.aspx";

            }, 1200);
        }


        /* CANCEL */
        function cancelEdit() {

            window.location.href = "Profile.aspx";

        }

    </script>

</asp:Content>