<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>CinePulse - Secure Admin Access</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body { width: 100%; height: 100%; }
        body {
            font-family: Georgia, "Times New Roman", serif;
            background: #0d0f10;
            color: #ffffff;
            overflow: hidden;
        }

        .login-page {
            width: 100%;
            height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            border: 2px solid #009cff;
            background: linear-gradient(90deg, rgba(5,8,10,.82), rgba(8,11,13,.68), rgba(8,10,11,.92));
        }

        /* SERVER ROOM BACKGROUND */
        .server-background {
            position: absolute;
            inset: 0;
            overflow: hidden;
            z-index: 0;
            background:
                radial-gradient(ellipse at 18% 45%, rgba(80,25,25,.45), transparent 34%),
                radial-gradient(ellipse at 72% 20%, rgba(30,40,45,.45), transparent 38%),
                linear-gradient(90deg, #0b0f11, #111619, #0b0f11);
        }
        .server-rack {
            position: absolute;
            top: -20px; bottom: -20px;
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
            left: 16px; top: 50px;
            width: 5px; height: 75%;
            opacity: .7;
            background: repeating-linear-gradient(180deg, #681515 0px, #681515 3px, transparent 3px, transparent 18px);
            box-shadow: 32px 0 0 rgba(90,25,20,.45), 65px 0 0 rgba(60,25,21,.35), 95px 0 0 rgba(55,30,24,.30);
        }

        .background-blur {
            position: absolute;
            inset: 0;
            background: radial-gradient(ellipse at center, transparent 10%, rgba(0,0,0,.25) 50%, rgba(0,0,0,.75) 100%);
            backdrop-filter: blur(2px);
        }

        /* LOGIN CARD */
        .login-card {
            position: relative;
            z-index: 10;
            width: 310px;
            padding: 22px 19px 20px;
            background: rgba(17,17,17,.95);
            border: 1px solid #303030;
            border-radius: 5px;
            box-shadow: 0 20px 50px rgba(0,0,0,.75), 0 0 35px rgba(0,0,0,.5);
        }

        /* LOGO */
        .brand {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 5px;
            margin-bottom: 13px;
        }
        .brand-icon { color: #ff171f; font-size: 17px; line-height: 1; }
        .brand-name { color: #e5e5e5; font-size: 17px; font-weight: bold; }

        /* TITLE */
        .login-title {
            text-align: center;
            color: #eeeeee;
            font-size: 13px;
            font-weight: bold;
            margin-bottom: 7px;
        }
        .login-subtitle {
            text-align: center;
            color: #8d7e7e;
            font-size: 7px;
            line-height: 11px;
            margin-bottom: 18px;
        }

        /* FORM */
        .form-group { margin-bottom: 10px; }
        .form-label-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 5px;
        }
        .form-label { color: #aaa0a0; font-size: 7px; font-weight: bold; }

        .forgot-link {
            color: #f0c300;
            font-size: 6px;
            text-decoration: none;
            cursor: pointer;
        }
        .forgot-link:hover { color: #ffe46b; text-decoration: underline; }

        /* INPUT */
        .input-wrapper { position: relative; width: 100%; }
        .input-icon {
            position: absolute;
            left: 8px; top: 50%;
            transform: translateY(-50%);
            color: #686868;
            font-size: 10px;
            pointer-events: none;
        }
        .login-input {
            width: 100%;
            height: 28px;
            padding: 0 9px 0 26px;
            background: #191919;
            border: 1px solid #303030;
            border-radius: 2px;
            outline: none;
            color: #dddddd;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 8px;
        }
        .login-input::placeholder { color: #5f5f5f; }
        .login-input:focus {
            border-color: #555555;
            box-shadow: 0 0 0 1px rgba(255,23,31,.08);
        }

        /* PASSWORD */
        .password-wrapper { position: relative; }
        .password-toggle {
            position: absolute;
            right: 8px; top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #777777;
            font-size: 9px;
            cursor: pointer;
            padding: 2px;
        }
        .password-toggle:hover { color: #cccccc; }

        /* LOGIN BUTTON */
        .login-button {
            width: 100%;
            height: 26px;
            margin-top: 7px;
            background: #ff1018;
            border: 1px solid #ff1018;
            border-radius: 3px;
            color: #ffffff;
            font-family: Georgia, "Times New Roman", serif;
            font-size: 8px;
            font-weight: bold;
            cursor: pointer;
            transition: .2s;
        }
        .login-button:hover {
            background: #df0d14;
            border-color: #df0d14;
            box-shadow: 0 5px 15px rgba(255,16,24,.25);
        }
        .login-button:active { transform: translateY(1px); }

        /* MESSAGE */
        .login-message {
            display: none;
            text-align: center;
            color: #78d99a;
            font-size: 7px;
            margin-top: 8px;
        }

        /* FOOTER */
        .login-footer {
            position: absolute;
            z-index: 10;
            left: 0; right: 0;
            bottom: 11px;
            text-align: center;
        }
        .footer-title {
            color: #514848;
            font-size: 6px;
            letter-spacing: 1px;
            margin-bottom: 7px;
        }
        .footer-links {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .footer-links a { color: #6b5f5f; font-size: 6px; text-decoration: none; }
        .footer-links a:hover { color: #aaa0a0; }
        .footer-separator { color: #4c4444; font-size: 6px; }

        /* RESPONSIVE */
        @media screen and (max-width:600px) {
            .login-card { width: 300px; }
            .server-rack { opacity: .5; }
        }
        @media screen and (max-height:600px) {
            .login-card { transform: scale(.88); }
            .login-footer { bottom: 5px; }
        }
    </style>
</head>

<body>
<form id="loginForm" runat="server">
    <div class="login-page">

        <!-- BACKGROUND -->
        <div class="server-background">
            <div class="server-rack rack-1"></div>
            <div class="server-rack rack-2"></div>
            <div class="server-rack rack-3"></div>
            <div class="server-rack rack-4"></div>
            <div class="background-blur"></div>
        </div>

        <!-- LOGIN CARD -->
        <div class="login-card">

            <!-- LOGO -->
            <div class="brand">
                <span class="brand-icon">▮▮▮</span>
                <span class="brand-name">CinePulse</span>
            </div>

            <!-- TITLE -->
            <div class="login-title">Secure Admin Access</div>
            <div class="login-subtitle">Authenticate to access the global operations console.</div>

            <!-- EMAIL -->
            <div class="form-group">
                <div class="form-label-row">
                    <label class="form-label">Admin Mail</label>
                </div>
                <div class="input-wrapper">
                    <span class="input-icon">✉</span>
                    <input type="email" id="adminEmail" class="login-input" placeholder="sysadmin@cinepulse.global" autocomplete="username" />
                </div>
            </div>

            <!-- PASSWORD -->
            <div class="form-group">
                <div class="form-label-row">
                    <label class="form-label">Security Clearance (Password)</label>
                    <a href="ForgotPassword.aspx" class="forgot-link">Forgot Password?</a>
                </div>
                <div class="input-wrapper password-wrapper">
                    <span class="input-icon">▣</span>
                    <input type="password" id="adminPassword" class="login-input" placeholder="••••••••••••" autocomplete="current-password" />
                    <button type="button" class="password-toggle" onclick="togglePassword();" id="passwordToggle">◉</button>
                </div>
            </div>

            <!-- LOGIN -->
            <button type="button" class="login-button" onclick="loginAdmin();">
                Sign In to Console&nbsp; ↪
            </button>

            <div id="loginMessage" class="login-message"></div>

        </div>

        <!-- FOOTER -->
        <div class="login-footer">
            <div class="footer-title">SECURE ADMIN GATEWAY V2.4</div>
            <div class="footer-links">
                <a href="javascript:void(0);">Security Policy</a>
                <span class="footer-separator">•</span>
                <a href="javascript:void(0);">System Status</a>
                <span class="footer-separator">•</span>
                <a href="javascript:void(0);">Support</a>
            </div>
        </div>

    </div>

    <!-- JAVASCRIPT -->
    <script type="text/javascript">

        function loginAdmin() {
            var email = document.getElementById("adminEmail").value.trim();
            var password = document.getElementById("adminPassword").value;
            var message = document.getElementById("loginMessage");

            if (email === "" || password === "") {
                message.innerHTML = "Please enter your admin email and password.";
                message.style.color = "#ff7777";
                message.style.display = "block";
                return;
            }

            message.innerHTML = "Sign in successful. Redirecting...";
            message.style.color = "#78d99a";
            message.style.display = "block";

            setTimeout(function () {
                window.location.href = "home.aspx";
            }, 400);
        }

        function togglePassword() {
            var password = document.getElementById("adminPassword");
            var button = document.getElementById("passwordToggle");

            if (password.type === "password") {
                password.type = "text";
                button.innerHTML = "◉";
            } else {
                password.type = "password";
                button.innerHTML = "◉";
            }
        }

        document.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                loginAdmin();
            }
        });

    </script>
</form>
</body>
</html>