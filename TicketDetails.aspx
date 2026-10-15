<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="WebApplication2.TicketDetails" %>



<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .details-page {
            min-height: 100vh;
            background: #111111;
            padding: 38px 35px;
            color: #ffffff;
        }


        .details-header {
            margin-bottom: 22px;
        }

        .details-header h1 {
            font-size: 18px;
            color: #eeeeee;
            margin: 0;
        }

        /* Center */

        .details-wrapper {
            display: flex;
            justify-content: center;
            align-items: flex-start;
        }

        /* Ticket */

        .ticket-detail-card {
            width: 270px;
            background: #191919;
            border: 1px solid #2d2d2d;
            border-radius: 7px;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(0,0,0,.35);
        }

        .movie-area {
            padding: 18px;
            display: flex;
            gap: 12px;
        }

        .movie-poster {
            width: 55px;
            height: 75px;
            object-fit: cover;
            border-radius: 3px;
        }

        .movie-info {
            flex: 1;
        }

        .movie-info h2 {
            font-size: 12px;
            color: #eeeeee;
            margin: 2px 0 5px;
        }

        .movie-info p {
            font-size: 7px;
            color: #999999;
            margin: 3px 0;
        }

        .confirmed {
            display: inline-block;
            margin-top: 4px;
            background: #281313;
            border: 1px solid #572020;
            color: #ff7777;
            font-size: 6px;
            padding: 3px 6px;
            border-radius: 8px;
        }

        /* Info */

        .show-info {
            border-top: 1px dashed #393939;
            padding: 15px 18px;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .info-item span {
            display: block;
            color: #777777;
            font-size: 7px;
            margin-bottom: 4px;
        }

        .info-item strong {
            color: #dddddd;
            font-size: 8px;
        }

        /* QR */

        .qr-section {
            border-top: 1px dashed #393939;
            padding: 15px;
            text-align: center;
        }

        .qr-box {
            width: 72px;
            height: 72px;
            background: #ffffff;
            border-radius: 4px;
            margin: 0 auto 8px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .qr-box img {
            width: 62px;
            height: 62px;
            object-fit: contain;
        }

        .scan-text {
            color: #999999;
            font-size: 7px;
            margin-bottom: 7px;
        }

        .ticket-id {
            display: inline-block;
            background: #292020;
            color: #999999;
            padding: 4px 9px;
            border-radius: 10px;
            font-size: 7px;
        }

        /* Back */

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #aaaaaa;
            font-size: 8px;
            text-decoration: none;
        }

        .back-link:hover {
            color: #ffaaa0;
        }


        .movie-poster {
    width: 55px;
    height: 75px;
    object-fit: cover;
    border-radius: 3px;
}

.qr-image {
    width: 62px;
    height: 62px;
    object-fit: contain;
}
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="details-page">

        <!-- HEADER -->

        <div class="details-header">

            <h1>
                Ticket Details
            </h1>

        </div>


        <div class="details-wrapper">


            <!-- TICKET -->

            <div class="ticket-detail-card">


                <!-- MOVIE -->

                <div class="movie-area">
<asp:Image ID="imgJhamkudi"
    runat="server"
    ImageUrl="~/Images/jhamkudi.png"
    CssClass="movie-poster"
    AlternateText="Jhamkudi" />

                    <div class="movie-info">

                      <h1>
    <asp:Label ID="lblMovie"
        runat="server"
        Text="Movie">
    </asp:Label>
</h1>

                        <p>
                            Cinematic: Apsara One
                        </p>

                        <p>
                            Rajkot
                        </p>

                        <span class="confirmed">
                            CONFIRMED
                        </span>

                    </div>

                </div>


                <!-- SHOW INFORMATION -->

                <div class="show-info">

                    <div class="info-item">

                        <span>
                            Date & Time
                        </span>

                        <strong>
                            Tue, 14 Aug • 07:30 PM
                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Seats
                        </span>

                        <strong>
                            E7, E8
                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Theatre
                        </span>

                        <strong>
                            Apsara One
                        </strong>

                    </div>


                    <div class="info-item">

                        <span>
                            Screen
                        </span>

                        <strong>
                            Screen 2
                        </strong>

                    </div>

                </div>


                <!-- QR -->

                <div class="qr-section">

                    <div class="qr-box">

                        <img src="Images/qr.png"
                             alt="QR Code" />

                    </div>

                    <div class="scan-text">
                        Scan for entry
                    </div>

                    <span class="ticket-id">
                        Ticket ID: CP2402013
                    </span>

                </div>


            </div>

        </div>


        <!-- BACK -->

        <a href="MyTickets.aspx"
           class="back-link">

            ← Back to Tickets

        </a>

    </div>

</asp:Content>
