<%@ Page Title="Reset Password" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="ResetPassword111.aspx.cs" Inherits="WebApplication2.ResetPassword111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .reset-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            background: linear-gradient(180deg, rgba(11,11,11,0.85) 0%, rgba(11,11,11,0.95) 100%),
                        url('Images/login-bg.jpg') center/cover no-repeat fixed;
        }

        .reset-card {
            background: #181818;
            border: 1px solid #2a2a2a;
            border-radius: 16px;
            padding: 40px 35px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
            text-align: left;
        }

        .reset-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 8px;
            text-align: center;
        }

        .reset-subtitle {
            color: #888;
            font-size: 0.88rem;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #bbb;
            font-size: 0.82rem;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            background: #0f0f0f;
            border: 1px solid #2a2a2a;
            color: #fff;
            padding: 12px 15px;
            border-radius: 8px;
            font-size: 0.9rem;
        }

        .form-control:focus {
            outline: none;
            border-color: #e50914;
        }

        .btn-update {
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 13px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .btn-update:hover {
            background: #b80710;
        }

        .back-link {
            text-align: center;
        }

        .back-link a {
            color: #FFC3B9;
            text-decoration: none;
            font-size: 0.88rem;
        }

        .msg-label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.85rem;
            text-align: center;
        }

        /* Server-Side Modal (Zero JS) */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.85);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .modal-box {
            background: #181818;
            border: 1px solid #2d2d2d;
            border-radius: 16px;
            padding: 40px 30px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.8);
        }

        .modal-icon {
            width: 55px;
            height: 55px;
            background: #e50914;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: #fff;
            font-size: 1.5rem;
            box-shadow: 0 0 15px rgba(229, 9, 20, 0.4);
        }

        .modal-title {
            color: #fff;
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .modal-desc {
            color: #aaa;
            font-size: 0.88rem;
            line-height: 1.5;
            margin-bottom: 25px;
        }

        .btn-modal-login {
            display: block;
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-modal-login:hover {
            background: #b80710;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="reset-wrapper">
        <div class="reset-card">
            <h2 class="reset-title">Reset Password</h2>
            <p class="reset-subtitle">Create a strong new password for your account.</p>

            <div class="form-group">
                <label>New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter new password"></asp:TextBox>
            </div>

            <div class="form-group">
                <label>Confirm New Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Re-enter new password"></asp:TextBox>
            </div>

            <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn-update" OnClick="btnUpdatePassword_Click" />

            <div class="back-link">
                <asp:HyperLink ID="lnkBackLogin" runat="server" NavigateUrl="Login111.aspx">← Back to Login</asp:HyperLink>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="msg-label"></asp:Label>
        </div>
    </div>

    <!-- SUCCESS MODAL POPUP -->
    <asp:Panel ID="pnlSuccessModal" runat="server" CssClass="modal-overlay" Visible="false">
        <div class="modal-box">
            <div class="modal-icon">✓</div>
            <div class="modal-title">Password Updated Successfully!</div>
            <div class="modal-desc">
                Your password has been changed. You can now log in with your new credentials to access your cinematic experience.
            </div>
            <asp:Button ID="btnGoToLogin" runat="server" Text="Go to Login →" CssClass="btn-modal-login" OnClick="btnGoToLogin_Click" />
        </div>
    </asp:Panel>
</asp:Content>