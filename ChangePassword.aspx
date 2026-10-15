<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="WebApplication2.ChangePassword" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /*settings page*/

        .password-page {
            min-height: 100vh;
            background: #111111;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
            color: #ffffff;
        }




        .password-card {
            width: 326px;
            background: #202020;
            border: 1px solid #292929;
            border-radius: 7px;
            padding: 26px;
            box-sizing: border-box;
            box-shadow: 0 10px 30px rgba(0,0,0,0.3);
        }

        .password-card h1 {
            font-size: 17px;
            color: #eeeeee;
            margin: 0 0 5px;
        }

        .password-card .subtitle {
            font-size: 7px;
            color: #888888;
            margin: 0 0 20px;
        }

        .form-group {
            margin-bottom: 13px;
        }

        .form-group label {
            display: block;
            font-size: 7px;
            color: #bdbdbd;
            margin-bottom: 5px;
        }

        .password-input {
            width: 100%;
            height: 27px;
            background: #2b2b2b;
            border: 1px solid #333333;
            border-radius: 4px;
            color: #eeeeee;
            padding: 0 10px 0 28px;
            box-sizing: border-box;
            font-size: 7px;
            outline: none;
        }

        .password-input:focus {
            border-color: #555555;
        }

        .input-wrapper {
            position: relative;
        }

        .input-wrapper i {
            position: absolute;
            left: 9px;
            top: 50%;
            transform: translateY(-50%);
            color: #888888;
            font-size: 9px;
            z-index: 2;
        }

        .password-hint {
            font-size: 6px;
            color: #777777;
            margin-top: 4px;
        }

        .update-btn {
            margin-top: 6px;
            height: 27px;
            padding: 0 16px;
            background: #ed101c;
            border: 1px solid #ed101c;
            border-radius: 4px;
            color: #ffffff;
            font-size: 7px;
            font-weight: 600;
            cursor: pointer;
        }

        .update-btn:hover {
            background: #ff1d29;
            border-color: #ff1d29;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="password-page">

        <div class="password-card">

            <h1>
                Change Password
            </h1>

            <p class="subtitle">
                Ensure your account is using a long, random password to stay secure.
            </p>


            <!-- Current Password -->

            <div class="form-group">

                <label>
                    Current Password
                </label>

                <div class="input-wrapper">

                    <i class="fa-solid fa-lock"></i>

                    <asp:TextBox ID="txtCurrentPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="password-input"
                        placeholder="Enter current password">
                    </asp:TextBox>

                </div>

            </div>


            <!-- New Password -->

            <div class="form-group">

                <label>
                    New Password
                </label>

                <div class="input-wrapper">

                    <i class="fa-solid fa-key"></i>

                    <asp:TextBox ID="txtNewPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="password-input"
                        placeholder="Enter new password">
                    </asp:TextBox>

                </div>

                <div class="password-hint">
                    Must be at least 8 characters long.
                </div>

            </div>


            <!-- Confirm Password -->

            <div class="form-group">

                <label>
                    Confirm New Password
                </label>

                <div class="input-wrapper">

                    <i class="fa-solid fa-ellipsis"></i>

                    <asp:TextBox ID="txtConfirmPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="password-input"
                        placeholder="Confirm new password">
                    </asp:TextBox>

                </div>

            </div>


            <asp:Button ID="btnUpdatePassword"
                runat="server"
                Text="Update Password"
                CssClass="update-btn"
                OnClick="btnUpdatePassword_Click" />

        </div>

    </div>

</asp:Content>
