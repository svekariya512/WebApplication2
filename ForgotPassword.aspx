<%@ Page Title="Reset Password" Language="C#" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplication2.ForgotPassword" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Reset Password - CinePulse</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body { width: 100%; min-height: 100%; }

        body { font-family: Arial, Helvetica, sans-serif; background: #111111; color: #ffffff; }

        .forgot-page { width: 100%; min-height: 100vh; background: #111111; padding: 30px 20px; display: flex; justify-content: center; align-items: center; }

        .forgot-card { width: 100%; max-width: 520px; background: #191919; border: 1px solid #292929; border-radius: 10px; padding: 35px 40px; box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5); }

        .forgot-icon { width: 60px; height: 60px; margin: 0 auto 20px auto; background: rgba(255, 195, 185, 0.15); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: #FFC3B9; font-size: 28px; }

        .forgot-title { color: #ffffff; font-size: 22px; font-weight: 600; text-align: center; margin: 0 0 8px 0; }

        .forgot-subtitle { color: #888888; font-size: 12px; text-align: center; line-height: 18px; margin-bottom: 28px; }

        .forgot-field { margin-bottom: 18px; }

        .forgot-label { display: block; color: #a5a5a5; font-size: 11px; margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.5px; }

        .forgot-input { width: 100%; height: 42px; background: #0f0f0f; border: 1px solid #353535; border-radius: 5px; color: #e5e5e5; padding: 0 14px; outline: none; font-size: 13px; font-family: Arial, Helvetica, sans-serif; box-sizing: border-box; transition: 0.2s; }
        .forgot-input:focus { border-color: #FFC3B9; background: #131313; }
        .forgot-input::placeholder { color: #666666; }

        .forgot-submit { width: 100%; height: 44px; background: #ff5f5f; color: #ffffff; border: none; border-radius: 5px; font-size: 13px; font-weight: 600; cursor: pointer; letter-spacing: 0.5px; transition: 0.2s; margin-top: 8px; }
        .forgot-submit:hover { background: #ff4646; transform: translateY(-1px); }
        .forgot-submit:active { transform: translateY(0); }

        .forgot-back { display: flex; justify-content: center; margin-top: 20px; }
        .forgot-back a { color: #FFC3B9; text-decoration: none; font-size: 12px; transition: 0.2s; }
        .forgot-back a:hover { color: #ffb0a3; text-decoration: underline; }

        .forgot-error { display: none; padding: 12px 16px; background: rgba(255, 102, 102, 0.12); border: 1px solid rgba(255, 102, 102, 0.35); border-radius: 5px; color: #ff6666; font-size: 12px; text-align: center; margin-bottom: 20px; line-height: 18px; }
        .forgot-error.show { display: block; }

        .forgot-message { display: none; padding: 12px 16px; background: rgba(74, 222, 128, 0.12); border: 1px solid rgba(74, 222, 128, 0.35); border-radius: 5px; color: #4ade80; font-size: 12px; text-align: center; margin-bottom: 20px; line-height: 18px; }
        .forgot-message.show { display: block; }

        @media screen and (max-width: 700px) {
            .forgot-page { padding: 20px 15px; }
            .forgot-card { padding: 25px 20px; }
            .forgot-title { font-size: 19px; }
            .forgot-icon { width: 50px; height: 50px; font-size: 22px; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="forgot-page">
        <div class="forgot-card">

            <div class="forgot-icon">🔑</div>

            <h2 class="forgot-title">Forgot Password</h2>

            <p class="forgot-subtitle">
                Enter your email and new password below.
            </p>

            <asp:Label ID="lblError" runat="server" CssClass="forgot-error" Visible="false" />
            <asp:Label ID="lblSuccess" runat="server" CssClass="forgot-message" Visible="false" />

            <!-- EMAIL FIELD -->
            <div class="forgot-field">
                <label class="forgot-label">Email Address</label>
                <asp:TextBox ID="txtResetEmail" runat="server" ClientIDMode="Static"
                    CssClass="forgot-input" TextMode="Email"
                    placeholder="Enter your email" />
            </div>

            <!-- NEW PASSWORD -->
            <div class="forgot-field">
                <label class="forgot-label">New Password</label>
                <asp:TextBox ID="txtNewPassword" runat="server" ClientIDMode="Static"
                    CssClass="forgot-input" TextMode="Password"
                    placeholder="Enter new password" />
            </div>

            <!-- CONFIRM PASSWORD -->
            <div class="forgot-field">
                <label class="forgot-label">Confirm Password</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" ClientIDMode="Static"
                    CssClass="forgot-input" TextMode="Password"
                    placeholder="Re-enter new password" />
            </div>

            <asp:Button ID="btnSendReset" runat="server" ClientIDMode="Static"
                CssClass="forgot-submit" Text="Reset Password"
                OnClick="btnSendReset_Click" />

            <div class="forgot-back">
                <a href="Login.aspx">← Back to Login</a>
            </div>

        </div>
    </div>

</form>
</body>
</html>