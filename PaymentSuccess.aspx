<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="WebApplication2.PaymentSuccess" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .success-page {
            min-height: 100vh;
            background: #111111;
            padding: 30px;
            color: white;
        }

        .success-header {
            border-bottom: 1px solid #222;
            padding-bottom: 10px;
            margin-bottom: 30px;
        }

        .success-header h1 {
            font-size: 16px;
            margin: 0 0 4px;
        }

        .success-header p {
            font-size: 7px;
            color: #777;
            margin: 0;
        }

        .success-content {
            text-align: center;
        }

        .success-icon {
            width: 42px;
            height: 42px;
            background: #123d29;
            color: #19d56b;
            border-radius: 50%;
            margin: 0 auto 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .success-content h2 {
            font-size: 17px;
            margin: 0 0 6px;
        }

        .success-content > p {
            color: #777;
            font-size: 7px;
            margin-bottom: 25px;
        }

        .ticket-box {
            width: 330px;
            margin: auto;
            background: #302b2d;
            border-radius: 7px;
            padding: 12px;
            display: flex;
            gap: 12px;
            text-align: left;
            box-sizing: border-box;
        }

        .ticket-poster {
            width: 62px;
            height: 82px;
            object-fit: cover;
            border-radius: 3px;
        }

        .ticket-info {
            flex: 1;
        }

        .ticket-info h3 {
            font-size: 11px;
            margin: 4px 0 3px;
        }

        .ticket-info p {
            color: #888;
            font-size: 7px;
            margin: 3px 0;
        }

        .ticket-details {
            display: flex;
            gap: 35px;
            margin-top: 12px;
        }

        .ticket-details span {
            display: block;
            color: #777;
            font-size: 6px;
            margin-bottom: 3px;
        }

        .ticket-details strong {
            color: #ddd;
            font-size: 7px;
        }

        .transaction {
            margin-top: 12px;
            display: inline-block;
            background: #222;
            padding: 5px 7px;
            border-radius: 3px;
            color: #777;
            font-size: 6px;
        }

        .success-buttons {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 16px;
        }

        .success-btn {
            width: 105px;
            padding: 7px;
            border-radius: 4px;
            text-decoration: none;
            text-align: center;
            font-size: 7px;
            background: #1b1b1b;
            border: 1px solid #292929;
            color: #ccc;
        }

        .success-btn.primary {
            background: #ed101c;
            border-color: #ed101c;
            color: white;
        }

        .success-btn:hover {
            color: white;
        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="success-page">

        <div class="success-header">

            <h1>
                <asp:Label ID="lblMovieHeader"
                    runat="server"></asp:Label>
            </h1>

            <p>
                Cinepolis: Alpha One, Ahmedabad • Today • 06:00 PM
            </p>

        </div>


        <div class="success-content">

            <div class="success-icon">
                ✓
            </div>

            <h2>
                Payment Successful!
            </h2>

            <p>
                Your booking has been confirmed.
                A confirmation email has been sent
                to your registered email ID.
            </p>


            <div class="ticket-box">

                <asp:Image ID="imgMovie"
                    runat="server"
                    CssClass="ticket-poster"
                    AlternateText="Movie Poster" />

                <div class="ticket-info">

                    <h3>
                        <asp:Label ID="lblMovie"
                            runat="server"></asp:Label>
                    </h3>

                    <p>
                        Cinepolis: Alpha One, Ahmedabad
                    </p>


                    <div class="ticket-details">

                        <div>
                            <span>DATE & TIME</span>

                            <strong>
                                Today, 14 Aug • 06:00 PM
                            </strong>
                        </div>

                        <div>
                            <span>SEATS</span>

                            <strong>
                                E7, E8
                            </strong>
                        </div>

                    </div>


                    <div class="transaction">
                        Transaction ID: CP94821839
                    </div>

                </div>

            </div>


            <div class="success-buttons">

                <a href="TicketDetails.aspx"
                   class="success-btn primary">
                    Show Ticket
                </a>

                <a href="UserDashboard.aspx"
                   class="success-btn">
                    Go to Overview
                </a>

                <a href="Feedback.aspx"
                   class="success-btn">
                    Give Feedback
                </a>

            </div>

        </div>

    </div>

</asp:Content>
