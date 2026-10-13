<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="WebApplication2.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    .edit-page { width:100%; min-height:calc(100vh - 82px); background:#111; color:#fff; padding:25px 34px 40px; }
    .edit-subtitle { color:#858585; font-size:12px; margin-bottom:24px; }
    .edit-container { width:100%; display:grid; grid-template-columns:250px minmax(0,1fr); gap:18px; align-items:start; }
    .edit-user-card { background:#292929; border-radius:7px; min-height:280px; padding:22px 18px; text-align:center; }
    .edit-user-icon { width:78px; height:78px; margin:0 auto 14px; background:#53677f; border-radius:12px; display:flex; justify-content:center; align-items:center; position:relative; cursor:pointer; overflow:hidden; }
    .edit-user-icon svg { width:42px; height:42px; fill:#dce4ee; }
    .edit-upload-overlay { position:absolute; inset:0; background:rgba(0,0,0,.65); display:flex; align-items:center; justify-content:center; color:#FFC3B9; font-size:20px; opacity:0; transition:.2s; }
    .edit-user-icon:hover .edit-upload-overlay { opacity:1; }
    .edit-user-hint { color:#858585; font-size:10px; margin-top:10px; }
    .edit-form-card { background:#292929; border-radius:7px; padding:22px; width:100%; }
    .edit-form-header { display:flex; justify-content:space-between; align-items:center; margin-bottom:20px; }
    .edit-form-title { color:#fff; font-size:14px; font-weight:500; }
    .edit-form-grid { display:grid; grid-template-columns:1fr 1fr; column-gap:16px; row-gap:16px; }
    .edit-field { width:100%; }
    .edit-field label { display:block; color:#b0b0b0; font-size:10px; margin-bottom:7px; text-transform:uppercase; letter-spacing:.3px; font-weight:500; }
    .edit-field input, .edit-field select, .edit-field textarea { width:100%; height:38px; padding:0 12px; border-radius:4px; border:1px solid #3f3f3f; outline:none; background:#1b1b1b; color:#fff; font-family:Arial,Helvetica,sans-serif; font-size:12px; box-sizing:border-box; }
    .edit-field textarea { height:80px; padding:10px 12px; resize:vertical; }
    .edit-field input:focus, .edit-field select:focus, .edit-field textarea:focus { border-color:#FFC3B9; background:#171717; }
    .edit-actions { display:flex; justify-content:flex-end; gap:10px; margin-top:22px; padding-top:18px; border-top:1px solid #3a3a3a; }
    .edit-cancel-btn, .edit-save-btn { height:34px; padding:0 20px; border-radius:5px; font-size:11px; cursor:pointer; border:none; }
    .edit-cancel-btn { background:transparent; border:1px solid #414141; color:#bdbdbd; }
    .edit-save-btn { background:#ff5f5f; color:#fff; font-weight:600; }
    .edit-save-btn:hover { background:#ff4646; }
    .edit-message { display:none; padding:10px 14px; background:rgba(74,222,128,.12); border:1px solid rgba(74,222,128,.35); border-radius:5px; color:#4ade80; font-size:11px; margin-bottom:16px; }
    .edit-message.show { display:block; }
    .edit-error { display:none; padding:10px 14px; background:rgba(255,102,102,.12); border:1px solid rgba(255,102,102,.35); border-radius:5px; color:#ff6666; font-size:11px; margin-bottom:16px; }
    .edit-error.show { display:block; }
    .error-msg { display:block; color:#ff6666; font-size:10px; margin-top:5px; }
    @media(max-width:700px){ .edit-container{grid-template-columns:1fr;} .edit-form-grid{grid-template-columns:1fr;} }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnAdminId" runat="server" ClientIDMode="Static" />
    <asp:Label ID="lblName" runat="server" Visible="false" />
    <asp:Label ID="lblEmail" runat="server" Visible="false" />
    <asp:Label ID="lblJoined" runat="server" Visible="false" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("editProfileHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "editProfileHeaderTitle";
                titleEl.innerText = "Edit Profile";
                titleEl.style.color = "#FFC3B9";
                titleEl.style.fontSize = "22px";
                titleEl.style.fontWeight = "500";
                titleEl.style.whiteSpace = "nowrap";
                titleEl.style.marginLeft = "10px";
                titleEl.style.marginRight = "10px";
                header.insertBefore(titleEl, searchArea);
            }
        });

        function previewAvatar(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    var icon = document.querySelector(".edit-user-icon");
                    icon.style.backgroundImage = "url(" + e.target.result + ")";
                    icon.style.backgroundSize = "cover";
                    icon.style.backgroundPosition = "center";
                    var svg = icon.querySelector("svg");
                    if (svg) svg.style.display = "none";
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
    </script>

    <div class="edit-page">

        <p class="edit-subtitle">Update your personal information and profile picture.</p>

        <div class="edit-container">

            <!-- LEFT AVATAR -->
            <div class="edit-user-card">
                <div class="edit-user-icon" onclick="document.getElementById('avatarInput').click();">
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M12 12c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm0 2c-3.33 0-10 1.67-10 5v3h20v-3c0-3.33-6.67-5-10-5z"/>
                    </svg>
                    <div class="edit-upload-overlay">📷</div>
                </div>
                <input type="file" id="avatarInput" style="display:none;" accept="image/*" onchange="previewAvatar(this);" />
                <div class="edit-user-hint">Click to upload<br />new profile picture</div>
            </div>

            <!-- RIGHT FORM -->
            <div class="edit-form-card">

                <div class="edit-form-header">
                    <div class="edit-form-title">Edit Profile Information</div>
                </div>

                <asp:Label ID="lblSuccess" runat="server" CssClass="edit-message" Visible="false" />
                <asp:Label ID="lblError" runat="server" CssClass="edit-error" Visible="false" />

                <div class="edit-form-grid">

                    <div class="edit-field">
                        <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" ClientIDMode="Static" />
                    </div>

                    <div class="edit-field">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" ClientIDMode="Static" TextMode="Email" />
                    </div>

                    <div class="edit-field">
                        <label>Role Title</label>
                        <asp:TextBox ID="txtRole" runat="server" ClientIDMode="Static" />
                    </div>

                    <div class="edit-field">
                        <label>Birth Date</label>
                        <asp:TextBox ID="txtBirthDate" runat="server" ClientIDMode="Static" TextMode="Date" />
                    </div>

                    <div class="edit-field">
                        <label>Gender</label>
                        <asp:DropDownList ID="ddlGender" runat="server" ClientIDMode="Static">
                            <asp:ListItem Value="">Select Gender</asp:ListItem>
                            <asp:ListItem Value="Male">Male</asp:ListItem>
                            <asp:ListItem Value="Female">Female</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="edit-field">
                        <label>Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" ClientIDMode="Static" />
                    </div>

                    <div class="edit-field" style="grid-column: span 2;">
                        <label>Location / Address</label>
                        <asp:TextBox ID="txtLocation" runat="server" ClientIDMode="Static" />
                    </div>

                    <div class="edit-field" style="grid-column: span 2;">
                        <label>Bio / About</label>
                        <asp:TextBox ID="txtBio" runat="server" ClientIDMode="Static" TextMode="MultiLine" />
                    </div>

                </div>

                <div class="edit-actions">
                    <asp:Button ID="btnCancel" runat="server" CssClass="edit-cancel-btn"
                        Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    <asp:Button ID="btnSaveProfile" runat="server" ClientIDMode="Static"
                        CssClass="edit-save-btn" Text="Save Changes"
                        OnClick="btnSaveProfile_Click" />
                </div>

            </div>

        </div>

    </div>

</asp:Content>