<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Login111.aspx.cs" Inherits="WebApplication2.Login111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Page Background --- */
        .login-wrapper {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
            background: linear-gradient(180deg, rgba(11,11,11,0.85) 0%, rgba(11,11,11,0.95) 100%),
                        url('Images/login-bg.jpg') center/cover no-repeat fixed;
        }

        /* --- Login Card --- */
        .login-card {
            background: #151515;
            border: 1px solid #2a2a2a;
            border-radius: 16px;
            padding: 45px 35px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
        }

        /* --- Title --- */
        .login-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            text-align: center;
            margin-bottom: 8px;
        }

        .login-subtitle {
            color: #888;
            font-size: 0.85rem;
            text-align: center;
            margin-bottom: 35px;
            line-height: 1.5;
        }

        /* --- Form --- */
        .login-form-group {
            margin-bottom: 20px;
        }

        .login-form-group label {
            display: block;
            color: #bbb;
            font-size: 0.8rem;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
            font-size: 0.9rem;
        }

        .login-form-control {
            width: 100%;
            background: #0f0f0f;
            border: 1px solid #2a2a2a;
            color: #fff;
            padding: 12px 15px 12px 42px;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: border 0.3s ease;
            font-family: inherit;
        }

        .login-form-control:focus {
            outline: none;
            border-color: #e50914;
            background: #0f0f0f;
            color: #fff;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);
        }

        .login-form-control::placeholder {
            color: #555;
        }

        /* --- Forgot Password Link --- */
        .forgot-link {
            text-align: right;
            margin-top: -15px;
            margin-bottom: 20px;
        }

        .forgot-link a {
            color: #FFC3B9;
            text-decoration: none;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .forgot-link a:hover {
            text-decoration: underline;
        }

        /* --- Remember Me --- */
        .remember-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 25px;
        }

        .remember-row input[type="checkbox"] {
            width: 16px;
            height: 16px;
            accent-color: #e50914;
            cursor: pointer;
        }

        .remember-row label {
            color: #bbb;
            font-size: 0.85rem;
            cursor: pointer;
            margin: 0;
        }

        /* --- Login Button --- */
        .btn-login {
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 13px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-login:hover {
            background: #b80710;
            box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
            color: #fff;
        }

        /* --- Message Label --- */
        .login-msg {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.85rem;
            text-align: center;
        }

        /* --- Signup Link --- */
        .signup-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #222;
        }

        .signup-link span {
            color: #888;
            font-size: 0.85rem;
        }

        .signup-link a {
            color: #e50914;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
        }

        .signup-link a:hover {
            text-decoration: underline;
            color: #ff2a2a;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="login-wrapper">
        <div class="login-card">

            <!-- Title -->
            <h2 class="login-title">Welcome Back</h2>
            <p class="login-subtitle">Sign in to continue your cinematic journey.</p>

            <!-- Email -->
            <div class="login-form-group">
                <label>Email Address</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="login-form-control" placeholder="Enter your email"></asp:TextBox>
                </div>
            </div>

            <!-- Password -->
            <div class="login-form-group">
                <label>Password</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="login-form-control" TextMode="Password" placeholder="Enter your password"></asp:TextBox>
                </div>
            </div>

            <!-- Forgot Password -->
            <div  class="forgot-link">
                <asp:HyperLink ID="lnkForgot" runat="server" NavigateUrl="Forgot111.aspx">Forgot Password?</asp:HyperLink>
            </div>

            <!-- Remember Me -->
            <div class="remember-row">
                <asp:CheckBox ID="chkRemember" runat="server" />
                <label for="chkRemember">Remember me</label>
            </div>

            <!-- Login Button -->
            <asp:Button ID="btnLogin" runat="server" Text="Sign In →" CssClass="btn-login" OnClick="btnLogin_Click" />

            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" CssClass="login-msg"></asp:Label>

            <!-- Signup Link -->
            <div class="signup-link">
                <span>Don't have an account?</span>
                <asp:HyperLink ID="lnkSignup" runat="server" NavigateUrl="Signup111.aspx">Sign up now</asp:HyperLink>
            </div>

        </div>
    </div>

</asp:Content>