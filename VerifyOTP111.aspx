<%@ Page Title="Verify OTP" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="VerifyOTP111.aspx.cs" Inherits="WebApplication2.VerifyOTP111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .verify-wrapper {
            min-height: 85vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            background: linear-gradient(180deg, rgba(11,11,11,0.85) 0%, rgba(11,11,11,0.95) 100%),
                        url('Images/login-bg.jpg') center/cover no-repeat fixed;
        }

        .verify-card {
            background: #181818;
            border: 1px solid #2a2a2a;
            border-radius: 16px;
            padding: 40px 35px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
            text-align: center;
        }

        .lock-icon {
            font-size: 2.2rem;
            color: #e50914;
            margin-bottom: 15px;
        }

        .verify-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 8px;
        }

        .verify-subtitle {
            color: #888;
            font-size: 0.88rem;
            margin-bottom: 25px;
        }

        .resend-alert {
            background: rgba(46, 125, 50, 0.2);
            border: 1px solid #2e7d32;
            color: #81c784;
            padding: 10px;
            border-radius: 8px;
            font-size: 0.82rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        /* Single Input Box styling to look like 6 boxes without JavaScript */
        .otp-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .single-otp-input {
            width: 290px;
            height: 52px;
            background: #0f0f0f;
            border: 1px solid #2a2a2a;
            border-radius: 8px;
            color: #fff;
            font-size: 1.5rem;
            font-weight: 700;
            text-align: center;
            letter-spacing: 18px;
            font-family: monospace;
            padding-left: 18px;
        }

        .single-otp-input:focus {
            outline: none;
            border-color: #e50914;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);
        }

        .attempts-text {
            color: #777;
            font-size: 0.8rem;
            margin-bottom: 25px;
        }

        .btn-verify {
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 13px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            margin-bottom: 20px;
        }

        .btn-verify:hover {
            background: #b80710;
        }

        .resend-row {
            color: #888;
            font-size: 0.85rem;
            margin-bottom: 20px;
        }

        .btn-resend-link {
            background: none;
            border: none;
            color: #e50914;
            font-weight: 600;
            cursor: pointer;
            padding: 0;
            font-size: 0.85rem;
        }

        .btn-resend-link:hover {
            text-decoration: underline;
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
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="verify-wrapper">
        <div class="verify-card">
            <div class="lock-icon"><i class="fa-solid fa-lock"></i></div>
            <h2 class="verify-title">Verify OTP</h2>
            <p class="verify-subtitle">Enter the 6-digit code sent to your email.</p>

            <asp:Panel ID="pnlResendAlert" runat="server" CssClass="resend-alert" Visible="false">
                <i class="fa-regular fa-circle-check"></i>
                <asp:Label ID="lblResendMsg" runat="server" Text="OTP has been resent successfully to your email."></asp:Label>
            </asp:Panel>

            <!-- Single Input Box for smooth typing without JS -->
            <div class="otp-container">
                <asp:TextBox ID="txtOtp" runat="server" CssClass="single-otp-input" MaxLength="6" placeholder="______"></asp:TextBox>
            </div>

            <div class="attempts-text">
                <i class="fa-regular fa-circle-info"></i>
                <asp:Label ID="lblAttempts" runat="server" Text="Attempts remaining: 3/3"></asp:Label>
            </div>

            <asp:Button ID="btnVerifyOTP" runat="server" Text="Verify OTP" CssClass="btn-verify" OnClick="btnVerifyOTP_Click" />

            <div class="resend-row">
                Didn't receive the code? 
                <asp:Button ID="btnResend" runat="server" Text="Resend OTP Now" CssClass="btn-resend-link" OnClick="btnResend_Click" />
            </div>

            <div class="back-link">
                <asp:HyperLink ID="lnkBackLogin" runat="server" NavigateUrl="Login111.aspx">← Back to Login</asp:HyperLink>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="msg-label"></asp:Label>
        </div>
    </div>
</asp:Content>