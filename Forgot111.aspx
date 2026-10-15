<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Forgot111.aspx.cs" Inherits="WebApplication2.Forgot111" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .forgot-wrapper {
            min-height: 85vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            background: linear-gradient(180deg, rgba(11,11,11,0.85) 0%, rgba(11,11,11,0.95) 100%),
                        url('Images/login-bg.jpg') center/cover no-repeat fixed;
        }

        .top-logo-box {
            display: flex;
            align-items: center;
            gap: 12px;
            background: rgba(255, 195, 185, 0.08);
            border: 1px solid rgba(255, 195, 185, 0.2);
            padding: 12px 24px;
            border-radius: 10px;
            margin-bottom: 25px;
        }

        .top-logo-box img {
            height: 35px;
            width: auto;
        }

        .forgot-card {
            background: #181818;
            border: 1px solid #2a2a2a;
            border-radius: 16px;
            padding: 40px 35px;
            width: 100%;
            max-width: 440px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.8);
            text-align: left;
        }

        .forgot-title {
            font-size: 1.8rem;
            font-weight: 700;
            color: #fff;
            margin-bottom: 8px;
        }

        .forgot-subtitle {
            color: #888;
            font-size: 0.88rem;
            margin-bottom: 30px;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            color: #bbb;
            font-size: 0.82rem;
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

        .form-control {
            width: 100%;
            background: #0f0f0f;
            border: 1px solid #2a2a2a;
            color: #fff;
            padding: 13px 15px 13px 42px;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: border 0.3s ease;
            font-family: inherit;
        }

        .form-control:focus {
            outline: none;
            border-color: #e50914;
            background: #0f0f0f;
            color: #fff;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);
        }

        .btn-send-otp {
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
            margin-bottom: 20px;
        }

        .btn-send-otp:hover {
            background: #b80710;
            box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
        }

        .back-link {
            text-align: center;
        }

        .back-link a {
            color: #FFC3B9;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 500;
        }

        .msg-label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.85rem;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="forgot-wrapper">
        <div class="top-logo-box">
            <img src="Images/logo1.png" alt="CinePulse" />
        </div>

        <div class="forgot-card">
            <h2 class="forgot-title">Forgot Password?</h2>
            <p class="forgot-subtitle">Enter your email address to receive an OTP.</p>

            <div class="form-group">
                <label>Email Address</label>
                <div class="input-wrapper">
                    <i class="fa-regular fa-envelope"></i>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="you@example.com"></asp:TextBox>
                </div>
            </div>

            <asp:Button ID="btnSendOTP" runat="server" Text="Send OTP" CssClass="btn-send-otp" OnClick="btnSendOTP_Click" />

            <div class="back-link">
                <asp:HyperLink ID="lnkBackLogin" runat="server" NavigateUrl="Login111.aspx">← Back to Login</asp:HyperLink>
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="msg-label"></asp:Label>
        </div>
    </div>
</asp:Content>