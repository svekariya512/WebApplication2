<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="FeedbackSuccess.aspx.cs" Inherits="WebApplication2.FeedbackSuccess" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /* feedback are given success message*/
        .feedback-success-page {
            min-height: 100vh;
            background: #111111;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px;
            color: #ffffff;
        }

        .thank-card {
            width: 270px;
            background: #242424;
            border: 1px solid #303030;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
            box-sizing: border-box;
            box-shadow: 0 8px 25px rgba(0,0,0,0.35);
        }

        .heart-icon {
            width: 32px;
            height: 32px;
            background: #42171b;
            color: #ff303b;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 10px;
            font-size: 15px;
        }

        .thank-card h1 {
            font-size: 15px;
            margin: 0 0 6px;
            color: #eeeeee;
        }

        .thank-card p {
            font-size: 7px;
            line-height: 1.5;
            color: #777777;
            margin: 0 auto 17px;
            max-width: 210px;
        }

        .thank-buttons {
            display: flex;
            justify-content: center;
            gap: 7px;
        }

        .thank-btn {
            width: 90px;
            height: 25px;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 7px;
            box-sizing: border-box;
        }

        .tickets-btn {
            background: #292929;
            border: 1px solid #393939;
            color: #dddddd;
        }

        .overview-btn {
            background: #ed101c;
            border: 1px solid #ed101c;
            color: #ffffff;
        }

        .thank-btn:hover {
            color: #ffffff;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="feedback-success-page">

        <div class="thank-card">

            <div class="heart-icon">
                <i class="fa-solid fa-heart"></i>
            </div>


            <h1>
                Thank You for Your Feedback!
            </h1>


            <p>
                Your feedback helps us improve your
                CinePulse experience.
            </p>


            <div class="thank-buttons">

                <a href="MyTickets.aspx"
                   class="thank-btn tickets-btn">
                    My Tickets
                </a>


                <a href="UserDashboard.aspx"
                   class="thank-btn overview-btn">
                    Back to Overview
                </a>

            </div>

        </div>

    </div>

</asp:Content>
