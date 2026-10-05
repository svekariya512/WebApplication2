<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyTickets.aspx.cs" Inherits="WebApplication2.MyTickets" %>



<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .tickets-page {
            min-height: 100vh;
            padding: 38px 32px;
            background: #111111;
            color: #ffffff;
        }

        .tickets-header h1 {
            font-size: 24px;
            margin: 0 0 6px;
            color: #eeeeee;
        }

        .tickets-header p {
            font-size: 10px;
            color: #8f8f8f;
            margin: 0 0 22px;
        }

        .section-title {
            font-size: 12px;
            color: #eeeeee;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .section-title::before {
            content: "";
            display: inline-block;
            width: 3px;
            height: 13px;
            background: #ed101c;
            margin-right: 6px;
            vertical-align: -2px;
        }

        .ticket-card {
            width: 390px;
            min-height: 120px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 10px;
            display: flex;
            gap: 12px;
            margin-bottom: 28px;
            box-sizing: border-box;
        }

        .ticket-poster {
            width: 74px;
            height: 94px;
            object-fit: cover;
            border-radius: 3px;
            flex-shrink: 0;
        }

        .ticket-info {
            flex: 1;
            position: relative;
        }

        .ticket-info h2 {
            font-size: 12px;
            color: #eeeeee;
            margin: 2px 0 6px;
            max-width: 145px;
            line-height: 1.3;
        }

        .ticket-status {
            position: absolute;
            top: 0;
            right: 0;
            color: #ff7777;
            background: #301414;
            border: 1px solid #542020;
            border-radius: 10px;
            padding: 3px 7px;
            font-size: 7px;
        }

        .ticket-info p {
            font-size: 8px;
            color: #999999;
            margin: 4px 0;
        }

        .ticket-info .cinema {
            color: #ffaaa0;
        }

        .ticket-actions {
            position: absolute;
            bottom: 0;
            left: 0;
            display: flex;
            gap: 6px;
        }

        .view-ticket {
            background: #ed101c;
            color: #ffffff;
            text-decoration: none;
            border-radius: 3px;
            padding: 6px 10px;
            font-size: 8px;
            font-weight: 600;
        }

        .view-ticket:hover {
            background: #ff1d29;
            color: #ffffff;
        }

        .small-btn {
            width: 28px;
            height: 25px;
            background: #292929;
            border: 1px solid #3b3b3b;
            color: #bbbbbb;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }

        .past-bookings {
            margin-top: 5px;
        }

        .past-card {
            width: 125px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 6px;
        }

        .past-poster {
            width: 100%;
            height: 105px;
            object-fit: cover;
            border-radius: 3px;
        }

        .past-card h3 {
            color: #eeeeee;
            font-size: 9px;
            margin: 6px 0 3px;
        }

        .past-card p {
            color: #888888;
            font-size: 7px;
            margin: 0;
        }

        @media(max-width: 700px) {

            .tickets-page {
                padding: 25px 20px;
            }

            .ticket-card {
                width: 100%;
                max-width: 390px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="tickets-page">

        <!-- HEADER -->

        <div class="tickets-header">

            <h1>My Tickets</h1>

            <p>
                Manage your upcoming cinematic experiences and past bookings.
            </p>

        </div>


        <!-- UPCOMING -->

        <div class="section-title">
            Upcoming Tickets
        </div>


        <!-- DYNAMIC TICKET -->

        <div class="ticket-card">

            <asp:Image ID="imgSpiderman"
                runat="server"
                ImageUrl="~/Images/spiderman.png"
                CssClass="ticket-poster"
                AlternateText="Movie Poster" />


            <div class="ticket-info">

                <span class="ticket-status">
                    Confirmed
                </span>


                <h2>

                    <asp:Label ID="lblMovie"
                        runat="server"
                        Text="No Booking Yet">
                    </asp:Label>

                </h2>


                <p>
                    <i class="fa-regular fa-calendar"></i>
                    Oct 07, 2026
                </p>


                <p>
                    <i class="fa-solid fa-location-dot"></i>

                    <span class="cinema">
                        CINEPULSE, Rajkot
                    </span>
                </p>


                <div class="ticket-actions">

                    <a href="TicketDetails.aspx"
                       class="view-ticket">

                        <i class="fa-solid fa-ticket"></i>
                        View Ticket

                    </a>


                    <a href="TicketDetails.aspx"
                       class="small-btn">

                        <i class="fa-solid fa-chevron-right"></i>

                    </a>

                </div>

            </div>

        </div>


        <!-- PAST BOOKINGS -->

        <div class="section-title past-bookings">
            Past Bookings
        </div>


        <div class="past-card">

            <asp:Image ID="imgCocktail"
                runat="server"
                ImageUrl="~/Images/cocktail2.png"
                CssClass="past-poster"
                AlternateText="Cocktail 2" />

            <h3>
                Cocktail 2
            </h3>

            <p>
                Cosmosplex, Rajkot
            </p>

        </div>

    </div>

</asp:Content>