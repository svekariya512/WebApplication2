<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="WebApplication2.Logout" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .logout-page {
            min-height: 100vh;
            background: #111111;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
            color: #ffffff;
        }

        .logout-card {
            width: 285px;
            background: #202020;
            border: 1px solid #303030;
            border-radius: 7px;
            padding: 24px;
            text-align: center;
            box-sizing: border-box;
            box-shadow: 0 10px 30px rgba(0,0,0,0.35);
        }

        .logout-icon {
            width: 40px;
            height: 40px;
            margin: 0 auto 14px;
            border-radius: 50%;
            background: #292929;
            border: 1px solid #3a3a3a;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffaaa0;
            font-size: 17px;
        }

        .logout-card h2 {
            font-size: 13px;
            color: #eeeeee;
            margin: 0 0 8px;
        }

        .logout-card p {
            font-size: 7px;
            line-height: 1.5;
            color: #888888;
            margin: 0 0 18px;
        }

        .logout-buttons {
            display: flex;
            gap: 8px;
        }

        .logout-btn {
            flex: 1;
            height: 28px;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 7px;
            box-sizing: border-box;
        }

        .cancel-btn {
            background: #202020;
            border: 1px solid #3b3b3b;
            color: #dddddd;
        }

        .cancel-btn:hover {
            color: #ffffff;
            background: #292929;
        }

        .confirm-btn {
            background: #ed101c;
            border: 1px solid #ed101c;
            color: #ffffff;
        }

        .confirm-btn:hover {
            background: #ff1d29;
            color: #ffffff;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="logout-page">

        <div class="logout-card">

            <div class="logout-icon">
                <i class="fa-solid fa-right-from-bracket"></i>
            </div>

            <h2>
                LogOut of Cineplus
            </h2>

            <p>
                Are you sure you want to log out?
                You will need to sign back in to access
                your profile and tickets.
            </p>

            <div class="logout-buttons">

                <a href="UserDashboard.aspx"
                   class="logout-btn cancel-btn">
                    Cancel
                </a>

                <a href="Login.aspx"
                   class="logout-btn confirm-btn">
                    Logout
                </a>

            </div>

        </div>

    </div>

</asp:Content>
