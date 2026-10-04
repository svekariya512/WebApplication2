<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="WebApplication2.ForgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* =========================================
           FORGOT PASSWORD PAGE
        ========================================= */
        .forgot-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            color: #ffffff;
            padding: 30px 34px 40px 34px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        .forgot-card {
            width: 100%;
            max-width: 520px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 10px;
            padding: 35px 40px;
            margin-top: 30px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.5);
        }

        /* ICON */
        .forgot-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 20px auto;
            background: rgba(255, 195, 185, 0.15);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFC3B9;
            font-size: 28px;
        }

        /* TITLE */
        .forgot-title {
            color: #ffffff;
            font-size: 22px;
            font-weight: 600;
            text-align: center;
            margin: 0 0 8px 0;
        }

        /* SUBTITLE */
        .forgot-subtitle {
            color: #888888;
            font-size: 12px;
            text-align: center;
            line-height: 18px;
            margin-bottom: 28px;
        }

        /* FORM */
        .forgot-field {
            margin-bottom: 18px;
        }

        .forgot-label {
            display: block;
            color: #a5a5a5;
            font-size: 11px;
            margin-bottom: 8px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .forgot-input {
            width: 100%;
            height: 42px;
            background: #0f0f0f;
            border: 1px solid #353535;
            border-radius: 5px;
            color: #e5e5e5;
            padding: 0 14px;
            outline: none;
            font-size: 13px;
            font-family: Arial, Helvetica, sans-serif;
            box-sizing: border-box;
            transition: 0.2s;
        }
        .forgot-input:focus {
            border-color: #FFC3B9;
            background: #131313;
        }
        .forgot-input::placeholder {
            color: #666666;
        }

        /* SUBMIT BUTTON */
        .forgot-submit {
            width: 100%;
            height: 44px;
            background: #ff5f5f;
            color: #ffffff;
            border: none;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            letter-spacing: 0.5px;
            transition: 0.2s;
            margin-top: 8px;
        }
        .forgot-submit:hover {
            background: #ff4646;
            transform: translateY(-1px);
        }
        .forgot-submit:active {
            transform: translateY(0);
        }

        /* BACK LINK */
        .forgot-back {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .forgot-back a {
            color: #FFC3B9;
            text-decoration: none;
            font-size: 12px;
            transition: 0.2s;
        }
        .forgot-back a:hover {
            color: #ffb0a3;
            text-decoration: underline;
        }

        /* SUCCESS MESSAGE */
        .forgot-message {
            display: none;
            padding: 12px 16px;
            background: rgba(74, 222, 128, 0.12);
            border: 1px solid rgba(74, 222, 128, 0.35);
            border-radius: 5px;
            color: #4ade80;
            font-size: 12px;
            text-align: center;
            margin-bottom: 20px;
            line-height: 18px;
        }
        .forgot-message.show { display: block; }

        /* DYNAMIC HAMBURGER */
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

        /* RESPONSIVE */
        @media screen and (max-width: 700px) {
            .forgot-page { padding: 20px 15px; }
            .forgot-card { padding: 25px 20px; margin-top: 15px; }
            .forgot-title { font-size: 19px; }
            .forgot-icon { width: 50px; height: 50px; font-size: 22px; }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Inject "Forgot Password" title in header -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            // 1. Show hamburger menu
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) {
                hamburger.style.display = "flex";
            }

            // 2. Inject "Forgot Password" title into header
            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var titleEl = document.createElement("div");
                titleEl.innerText = "Forgot Password";
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

    <div class="forgot-page">

        <div class="forgot-card">

            <!-- ICON -->
            <div class="forgot-icon">🔑</div>

            <!-- TITLE -->
            <h2 class="forgot-title">Forgot Password?</h2>

            <!-- SUBTITLE -->
            <p class="forgot-subtitle">
                No worries! Enter your registered email address below,<br />
                and we'll send you a link to reset your password.
            </p>

            <!-- SUCCESS MESSAGE -->
            <div id="forgotMessage" class="forgot-message">
                ✓ Password reset link has been sent to your email!
            </div>

            <!-- FORM -->
            <div class="forgot-field">
                <label class="forgot-label" for="resetEmail">Email Address</label>
                <input type="email" id="resetEmail" class="forgot-input" placeholder="Enter your registered email" />
            </div>

            <button type="button" class="forgot-submit" onclick="sendResetLink();">
                Send Reset Link
            </button>

            <!-- BACK LINK -->
            <div class="forgot-back">
                <a href="Profile.aspx">← Back to Profile</a>
            </div>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->
    <script type="text/javascript">

        function sendResetLink() {

            var email = document.getElementById("resetEmail").value.trim();
            var message = document.getElementById("forgotMessage");

            if (email === "") {
                alert("Please enter your email address.");
                return;
            }

            // Simple email validation
            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailPattern.test(email)) {
                alert("Please enter a valid email address.");
                return;
            }

            // Show success message (in real app, this would call backend)
            message.classList.add("show");

            // Reset email field
            document.getElementById("resetEmail").value = "";

            // Hide message after 5 seconds
            setTimeout(function () {
                message.classList.remove("show");
            }, 5000);
        }

    </script>

</asp:Content>