<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs"
    Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>CinePulse - Secure Admin Access</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body { width: 100%; min-height: 100%; }

        body {
            font-family: Georgia, "Times New Roman", serif;
            background: #0d0f10;
            color: white;
        }

        .login-page {
            width: 100%;
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 2px solid #009cff;
            background: linear-gradient(90deg, rgba(5,8,10,.82), rgba(8,11,13,.68), rgba(8,10,11,.92));
        }

        .server-background {
            position: absolute;
            inset: 0;
            overflow: hidden;
            background:
                radial-gradient(ellipse at 18% 45%, rgba(80,25,25,.45), transparent 34%),
                radial-gradient(ellipse at 72% 20%, rgba(30,40,45,.45), transparent 38%),
                linear-gradient(90deg, #0b0f11, #111619, #0b0f11);
        }

        .server-rack {
            position: absolute;
            top: -20px;
            bottom: -20px;
            width: 145px;
            background: repeating-linear-gradient(180deg, #202628 0px, #202628 8px, #070909 9px, #070909 14px);
            border-left: 3px solid #20292d;
            border-right: 3px solid #050606;
            box-shadow: inset 0 0 35px rgba(0,0,0,.9), 10px 0 25px rgba(0,0,0,.45);
        }

        .rack-1 { left: 25px; transform: perspective(500px) rotateY(18deg); }
        .rack-2 { left: 170px; transform: perspective(500px) rotateY(13deg); }
        .rack-3 { left: 315px; transform: perspective(500px) rotateY(10deg); }
        .rack-4 { left: 460px; transform: perspective(500px) rotateY(7deg); }

        .server-rack:before {
            content: "";
            position: absolute;
            left: 16px;
            top: 50px;
            width: 5px;
            height: 75%;
            opacity: .7;
            background: repeating-linear-gradient(180deg, #681515 0px, #681515 3px, transparent 3px, transparent 18px);
            box-shadow: 32px 0 0 rgba(90,25,20,.45), 65px 0 0 rgba(60,25,21,.35), 95px 0 0 rgba(55,30,24,.30);
        }

        .background-blur {
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at center, transparent 10%, rgba(0,0,0,.25) 50%, rgba(0,0,0,.75) 100%);
        }

        .login-card {
            position: relative;
            z-index: 10;
            width: 350px;
            max-width: calc(100% - 30px);
            padding: 28px 24px;
            background: rgba(17,17,17,.96);
            border: 1px solid #303030;
            border-radius: 5px;
            box-shadow: 0 20px 50px rgba(0,0,0,.75);
        }

        .brand {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-bottom: 20px;
        }

        .brand-icon { color: #ff171f; font-size: 22px; }
        .brand-name { color: #e5e5e5; font-size: 24px; font-weight: bold; }

        .login-title {
            text-align: center;
            color: #eeeeee;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .login-subtitle {
            text-align: center;
            color: #8d7e7e;
            font-size: 11px;
            line-height: 17px;
            margin-bottom: 25px;
        }

        .form-group { margin-bottom: 18px; }

        .form-label {
            display: block;
            color: #aaa0a0;
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 8px;
        }

        .login-input {
            width: 100%;
            height: 42px;
            padding: 0 12px;
            background: #191919;
            border: 1px solid #303030;
            border-radius: 3px;
            outline: none;
            color: #dddddd;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 12px;
        }

        .login-input:focus { border-color: #777777; }

        .validator {
            display: block;
            color: #ff7777;
            font-size: 11px;
            margin-top: 5px;
        }

        .login-button {
            width: 100%;
            min-height: 42px;
            margin-top: 8px;
            background: #ff1018;
            border: 1px solid #ff1018;
            border-radius: 3px;
            color: white;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 13px;
            font-weight: bold;
            cursor: pointer;
        }

        .login-button:hover {
            background: #df0d14;
            border-color: #df0d14;
        }

        /* ⭐ FORGOT PASSWORD */
        .forgot-row {
            display: flex;
            justify-content: center;
            margin-top: 15px;
            margin-bottom: 10px;
        }

        .forgot-link {
            color: #c4a0a0;
            font-size: 11px;
            text-decoration: none;
            padding: 6px 12px;
            border-radius: 3px;
            transition: 0.2s;
            letter-spacing: 0.3px;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .forgot-link:hover {
            color: #ffc3b9;
            background: rgba(255, 195, 185, 0.08);
            text-decoration: none;
        }

        .forgot-link-icon {
            font-size: 12px;
            color: #ff7777;
        }

        .login-message {
            display: block;
            text-align: center;
            color: #ff7777;
            font-size: 12px;
            margin-top: 14px;
        }

        .login-footer {
            position: absolute;
            z-index: 10;
            left: 0;
            right: 0;
            bottom: 20px;
            text-align: center;
        }

        .footer-title {
            color: #756565;
            font-size: 10px;
            letter-spacing: 1px;
            margin-bottom: 8px;
        }

        .footer-links { color: #6b5f5f; font-size: 10px; }

        @media screen and (max-width: 600px) {
            .server-rack { opacity: .5; }
            .login-card { padding: 24px 20px; }
            .login-footer { bottom: 8px; }
        }

        @media screen and (max-height: 650px) {
            .login-page { min-height: 650px; }
            .login-footer { display: none; }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="login-page">

        <div class="server-background">
            <div class="server-rack rack-1"></div>
            <div class="server-rack rack-2"></div>
            <div class="server-rack rack-3"></div>
            <div class="server-rack rack-4"></div>
            <div class="background-blur"></div>
        </div>

        <div class="login-card">

            <div class="brand">
                <span class="brand-icon">▮▮▮</span>
                <span class="brand-name">CinePulse</span>
            </div>

            <div class="login-title">Secure Admin Access</div>

            <div class="login-subtitle">
                Authenticate to access the global operations console.
            </div>

            <!-- ADMIN EMAIL -->
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="form-label"
                    AssociatedControlID="txtAdminEmail" Text="Admin Mail"></asp:Label>

                <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="login-input"
                    TextMode="Email" MaxLength="100" placeholder="admin@cinepulse.com"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtAdminEmail"
                    ErrorMessage="Please enter your admin email."
                    CssClass="validator" Display="Dynamic"
                    EnableClientScript="false" ValidationGroup="AdminLogin"></asp:RequiredFieldValidator>

                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtAdminEmail"
                    ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                    ErrorMessage="Please enter a valid email address."
                    CssClass="validator" Display="Dynamic"
                    EnableClientScript="false" ValidationGroup="AdminLogin"></asp:RegularExpressionValidator>
            </div>

            <!-- ADMIN PASSWORD -->
            <div class="form-group">
                <asp:Label ID="lblPassword" runat="server" CssClass="form-label"
                    AssociatedControlID="txtAdminPassword"
                    Text="Security Clearance (Password)"></asp:Label>

                <asp:TextBox ID="txtAdminPassword" runat="server" CssClass="login-input"
                    TextMode="Password" MaxLength="100" placeholder="Enter your password"></asp:TextBox>

                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtAdminPassword"
                    ErrorMessage="Please enter your password."
                    CssClass="validator" Display="Dynamic"
                    EnableClientScript="false" ValidationGroup="AdminLogin"></asp:RequiredFieldValidator>
            </div>

            <!-- LOGIN BUTTON -->
            <asp:Button ID="btnAdminLogin" runat="server"
                Text="Sign In to Console  →"
                CssClass="login-button"
                ValidationGroup="AdminLogin"
                CausesValidation="true"
                OnClick="btnAdminLogin_Click" />

            <!-- ⭐ FORGOT PASSWORD LINK -->
            <div class="forgot-row">
                <a href="ForgotPassword.aspx" class="forgot-link">
                    <span class="forgot-link-icon">🔑</span>
                    Forgot your password?
                </a>
            </div>

            <!-- SERVER-SIDE MESSAGE -->
            <asp:Label ID="lblMessage" runat="server"
                CssClass="login-message"
                EnableViewState="false"></asp:Label>

        </div>

        <div class="login-footer">
            <div class="footer-title">SECURE ADMIN GATEWAY</div>
            <div class="footer-links">
                Security Policy &nbsp; • &nbsp;
                System Status &nbsp; • &nbsp;
                Support
            </div>
        </div>

    </div>

</form>
</body>
</html>