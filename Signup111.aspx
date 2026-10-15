<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Signup111.aspx.cs" Inherits="WebApplication2.Signup111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Page Background --- */
        .signup-wrapper {
            min-height: 90vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 20px;
            background: linear-gradient(180deg, rgba(11,11,11,0.85) 0%, rgba(11,11,11,0.95) 100%),
                        url('Images/signup-bg.jpg') center/cover no-repeat fixed;
        }

        /* --- Signup Card --- */
        .signup-card {
            background: #151515;
            border: 1px solid #2a2a2a;
            border-radius: 16px;
            padding: 40px 35px;
            width: 100%;
            max-width: 450px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
        }

        /* --- Logo Section --- */
        .signup-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 30px;
            padding: 15px 20px;
            background: rgba(255, 195, 185, 0.08);
            border: 1px solid rgba(255, 195, 185, 0.2);
            border-radius: 10px;
            width: fit-content;
            margin-left: auto;
            margin-right: auto;
        }

        .signup-logo img {
            height: 40px;
            width: auto;
        }

        .signup-logo-text {
            display: flex;
            flex-direction: column;
            text-align: left;
        }

        .signup-logo-text span {
            color: #FFC3B9;
            font-weight: 700;
            font-size: 1.15rem;
            line-height: 1;
        }

        .signup-logo-text small {
            color: #888;
            font-size: 0.6rem;
            letter-spacing: 1.5px;
            margin-top: 4px;
        }

        /* --- Title --- */
        .signup-title {
            font-size: 1.7rem;
            font-weight: 700;
            color: #fff;
            text-align: center;
            margin-bottom: 10px;
        }

        .signup-subtitle {
            color: #888;
            font-size: 0.85rem;
            text-align: center;
            margin-bottom: 35px;
            line-height: 1.5;
        }

        /* --- Form --- */
        .signup-form-group {
            margin-bottom: 18px;
        }

        .signup-form-group label {
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

        .signup-form-control {
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

        .signup-form-control:focus {
            outline: none;
            border-color: #e50914;
            background: #0f0f0f;
            color: #fff;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);
        }

        .signup-form-control::placeholder {
            color: #555;
        }

        /* --- Sign Up Button --- */
        .btn-signup {
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
            margin-top: 10px;
        }

        .btn-signup:hover {
            background: #b80710;
            box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
            color: #fff;
        }

        /* --- Message Label --- */
        .signup-msg {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.85rem;
            text-align: center;
        }

        /* --- Login Link --- */
        .login-link {
            text-align: center;
            margin-top: 25px;
            padding-top: 20px;
            border-top: 1px solid #222;
        }

        .login-link span {
            color: #888;
            font-size: 0.85rem;
        }

        .login-link a {
            color: #e50914;
            text-decoration: none;
            font-weight: 600;
            margin-left: 5px;
        }

        .login-link a:hover {
            text-decoration: underline;
            color: #ff2a2a;
        }

        /* --- Custom Modal Styles (Pure CSS + Server Control) --- */
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
            border: 1px solid #e50914;
            border-radius: 16px;
            padding: 40px 30px;
            width: 90%;
            max-width: 400px;
            text-align: center;
            box-shadow: 0 0 25px rgba(229, 9, 20, 0.25);
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
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .modal-desc {
            color: #aaa;
            font-size: 0.88rem;
            line-height: 1.5;
            margin-bottom: 25px;
        }

        .btn-modal-primary {
            display: block;
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 12px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-modal-primary:hover {
            background: #b80710;
        }

        .btn-modal-secondary {
            display: block;
            width: 100%;
            background: #222;
            color: #ccc;
            border: 1px solid #333;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-modal-secondary:hover {
            background: #2f2f2f;
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="signup-wrapper">
        <div class="signup-card">

            <!-- Logo Section -->
            <div class="signup-logo">
                <img src="Images/logo1.png" alt="CinePulse" />
            </div>

            <!-- Title -->
            <h2 class="signup-title">Join the Premiere</h2>
            <p class="signup-subtitle">Create your account for the ultimate cinematic experience.</p>

            <!-- Full Name -->
            <div class="signup-form-group">
                <label>Full Name</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-user"></i>
                    <asp:TextBox ID="txtFullName" runat="server" CssClass="signup-form-control" placeholder="Jaldhara Jadav"></asp:TextBox>
                </div>
            </div>

            <!-- Email -->
            <div class="signup-form-group">
                <label>Email Address</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="signup-form-control" placeholder="jaldhara@example.com"></asp:TextBox>
                </div>
            </div>

            <!-- Password -->
            <div class="signup-form-group">
                <label>Password</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-lock"></i>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="signup-form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>
            </div>

            <!-- Confirm Password -->
            <div class="signup-form-group">
                <label>Confirm Password</label>
                <div class="input-wrapper">
                    <i class="fa-solid fa-lock"></i>
                    <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="signup-form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                </div>
            </div>

            <!-- Sign Up Button -->
            <asp:Button ID="btnSignup" runat="server" Text="Sign Up →" CssClass="btn-signup" OnClick="btnSignup_Click" />

            <!-- Message Label -->
            <asp:Label ID="lblMessage" runat="server" CssClass="signup-msg"></asp:Label>

            <!-- Login Link -->
            <div class="login-link">
                <span>Already have an account?</span>
                <asp:HyperLink ID="lnkLogin" runat="server" NavigateUrl="Login111.aspx">Login</asp:HyperLink>
            </div>

        </div>
    </div>

    <!-- SUCCESS POPUP MODAL (Server Control with Visible="false" initially) -->
    <asp:Panel ID="pnlSuccessModal" runat="server" CssClass="modal-overlay" Visible="false">
        <div class="modal-box">
            <div class="modal-icon">✓</div>
            <div class="modal-title">Account Created Successfully!</div>
            <div class="modal-desc">
                Welcome to Cineplus! Your cinematic journey begins now.
            </div>
            <asp:Button ID="btnLoginNow" runat="server" Text="Login Now" CssClass="btn-modal-primary" OnClick="btnLoginNow_Click" />
            <asp:Button ID="btnGoToHome" runat="server" Text="Go To Home" CssClass="btn-modal-secondary" OnClick="btnGoToHome_Click" />
        </div>
    </asp:Panel>

</asp:Content>