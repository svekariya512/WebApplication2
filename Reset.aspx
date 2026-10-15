<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reset.aspx.cs" Inherits="WebApplication2.Reset" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

    .reset-page {
        min-height: calc(100vh - 82px);
        background: #111111;
        padding: 25px 35px 40px 35px;
        color: #ffffff;
    }

    .reset-subtitle {
        color: #888888;
        font-size: 12px;
        margin-bottom: 25px;
    }

    .reset-layout {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 20px;
        max-width: 1000px;
    }

    .reset-card {
        background: #171717;
        border: 1px solid #2b2b2b;
        border-radius: 8px;
        padding: 25px;
    }

    .card-title {
        font-size: 15px;
        font-weight: 600;
        color: #eeeeee;
        margin-bottom: 5px;
    }

    .card-description {
        color: #777777;
        font-size: 10px;
        line-height: 16px;
        margin-bottom: 22px;
    }

    .form-group { margin-bottom: 17px; }

    .form-label {
        display: block;
        color: #aaaaaa;
        font-size: 10px;
        margin-bottom: 7px;
    }

    .form-input {
        width: 100%;
        height: 38px;
        background: #202020;
        border: 1px solid #333333;
        border-radius: 5px;
        padding: 0 12px;
        color: #ffffff;
        font-size: 11px;
        outline: none;
        box-sizing: border-box;
        transition: 0.2s;
    }

    .form-input:focus { border-color: #ffc3b9; }
    .form-input::placeholder { color: #555555; }

    .button-row {
        display: flex;
        gap: 10px;
        margin-top: 22px;
    }

    .reset-btn {
        height: 36px;
        padding: 0 20px;
        border: none;
        border-radius: 5px;
        background: #ffc3b9;
        color: #111111;
        font-size: 10px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.2s;
    }
    .reset-btn:hover { background: #ffb0a3; }

    .cancel-btn {
        height: 36px;
        padding: 0 20px;
        border: 1px solid #3a3a3a;
        border-radius: 5px;
        background: #202020;
        color: #cccccc;
        font-size: 10px;
        cursor: pointer;
        transition: 0.2s;
    }
    .cancel-btn:hover { background: #292929; }

    .security-card {
        background: #171717;
        border: 1px solid #2b2b2b;
        border-radius: 8px;
        padding: 25px;
    }

    .security-header {
        display: flex;
        align-items: center;
        gap: 12px;
        margin-bottom: 20px;
    }

    .security-icon {
        width: 38px;
        height: 38px;
        border-radius: 7px;
        background: rgba(255,195,185,.12);
        color: #ffc3b9;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 16px;
    }

    .security-title { font-size: 14px; color: #eeeeee; font-weight: 600; }
    .security-small { color: #666666; font-size: 9px; margin-top: 3px; }

    .requirement {
        display: flex;
        align-items: center;
        gap: 10px;
        padding: 12px 0;
        border-bottom: 1px solid #252525;
    }
    .requirement:last-child { border-bottom: none; }

    .check {
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background: rgba(74,222,128,.12);
        color: #4ade80;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 10px;
        flex-shrink: 0;
    }

    .requirement-text { color: #999999; font-size: 10px; }

    .security-note {
        margin-top: 20px;
        padding: 12px;
        background: rgba(250,204,21,.06);
        border: 1px solid rgba(250,204,21,.18);
        border-radius: 5px;
        color: #aaa;
        font-size: 9px;
        line-height: 15px;
    }

    .msg-success {
        display: block;
        margin-top: 15px;
        padding: 10px 12px;
        border-radius: 5px;
        background: rgba(74,222,128,.10);
        border: 1px solid rgba(74,222,128,.25);
        color: #4ade80;
        font-size: 10px;
    }
    .msg-error {
        display: block;
        margin-top: 15px;
        padding: 10px 12px;
        border-radius: 5px;
        background: rgba(255,102,102,.10);
        border: 1px solid rgba(255,102,102,.30);
        color: #ff6666;
        font-size: 10px;
    }

    @media screen and (max-width: 800px) {
        .reset-layout { grid-template-columns: 1fr; }
        .reset-page { padding: 20px; }
    }

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="reset-page">

        <div class="reset-subtitle">
            Update your CinePulse admin account password securely.
        </div>

        <div class="reset-layout">

            <!-- RESET FORM -->
            <div class="reset-card">

                <div class="card-title">Change Password</div>

                <div class="card-description">
                    Enter your current password and create a new secure
                    password for your account.
                </div>

                <div class="form-group">
                    <label class="form-label">Current Password</label>
                    <asp:TextBox ID="txtCurrentPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter current password" />
                </div>

                <div class="form-group">
                    <label class="form-label">New Password</label>
                    <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Enter new password" />
                </div>

                <div class="form-group">
                    <label class="form-label">Confirm New Password</label>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input"
                        TextMode="Password" placeholder="Confirm new password" />
                </div>

                <div class="button-row">
                    <asp:Button ID="btnReset" runat="server" CssClass="reset-btn" Text="Reset Password"
                        OnClick="btnReset_Click" CausesValidation="false" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="cancel-btn" Text="Cancel"
                        OnClick="btnCancel_Click" CausesValidation="false" />
                </div>

                <asp:Label ID="lblMsg" runat="server" Visible="false" />

            </div>


            <!-- SECURITY INFO -->
            <div class="security-card">

                <div class="security-header">
                    <div class="security-icon">🔒</div>
                    <div>
                        <div class="security-title">Password Security</div>
                        <div class="security-small">Keep your admin account protected</div>
                    </div>
                </div>

                <div class="requirement">
                    <div class="check">✓</div>
                    <div class="requirement-text">Use at least 8 characters</div>
                </div>

                <div class="requirement">
                    <div class="check">✓</div>
                    <div class="requirement-text">Include uppercase and lowercase letters</div>
                </div>

                <div class="requirement">
                    <div class="check">✓</div>
                    <div class="requirement-text">Include at least one number</div>
                </div>

                <div class="requirement">
                    <div class="check">✓</div>
                    <div class="requirement-text">Avoid using easily guessed passwords</div>
                </div>

                <div class="security-note">
                    🔐 For security purposes, never share your
                    CinePulse admin password with anyone.
                </div>

            </div>

        </div>

    </div>

</asp:Content>
