<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SeatSelection.aspx.cs" Inherits="WebApplication2.SeatSelection" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .seat-page {
            min-height: 100vh;
            padding: 28px 30px;
            background: #111111;
            color: white;
            box-sizing: border-box;
        }

        .seat-header h1 {
            font-size: 16px;
            color: #eeeeee;
            margin: 0 0 3px;
        }

        .seat-header p {
            font-size: 7px;
            color: #777;
            margin: 0 0 18px;
        }

        .seat-layout {
            display: flex;
            gap: 10px;
            align-items: flex-start;
        }

       

        .screen-card {
            width: 300px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 12px;
            box-sizing: border-box;
        }

        .screen-title {
            text-align: center;
            color: #777;
            font-size: 6px;
            letter-spacing: 1px;
            margin-bottom: 14px;
        }

        .screen {
            width: 150px;
            height: 5px;
            background: #555;
            border-radius: 50%;
            margin: 0 auto 25px;
            box-shadow: 0 4px 8px rgba(255,255,255,0.08);
        }

        /* SEATS */

        .seat-area {
            width: 190px;
            margin: auto;
        }

        .seat-row {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 4px;
            margin-bottom: 5px;
        }

        .row-label {
            width: 12px;
            font-size: 6px;
            color: #777;
        }

        .seat {
            width: 15px;
            height: 15px;
            background: #222222;
            border: 1px solid #454545;
            border-radius: 3px;
            color: #777;
            font-size: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-sizing: border-box;
        }

        .seat:hover {
            border-color: #ed101c;
        }

        .seat.selected {
            background: #ed101c;
            border-color: #ed101c;
            color: white;
        }

        .seat.occupied {
            background: #111111;
            border-color: #111111;
            color: #444;
            cursor: not-allowed;
        }

        .seat-gap {
            width: 8px;
        }

        /* LEGEND */

        .seat-legend {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-top: 18px;
        }

        .legend-item {
            display: flex;
            align-items: center;
            gap: 4px;
            color: #777;
            font-size: 6px;
        }

        .legend-box {
            width: 8px;
            height: 8px;
            border-radius: 2px;
            background: #222;
            border: 1px solid #454545;
        }

        .legend-box.selected {
            background: #ed101c;
            border-color: #ed101c;
        }

        .legend-box.occupied {
            background: #111;
            border-color: #111;
        }

        /* SUMMARY */

        .summary-card {
            width: 170px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 12px;
            box-sizing: border-box;
        }

        .summary-card h2 {
            font-size: 9px;
            color: #eeeeee;
            margin: 0 0 15px;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
            font-size: 7px;
        }

        .summary-row span:first-child {
            color: #777;
        }

        .summary-row span:last-child {
            color: #ccc;
        }

        .total-row {
            border-top: 1px solid #303030;
            padding-top: 10px;
            margin-top: 8px;
        }

        .total-row span:first-child {
            color: #eeeeee;
        }

        .total-row span:last-child {
            color: #ed101c;
            font-weight: bold;
        }

        .proceed-btn {
            display: block;
            width: 100%;
            background: #ed101c;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            text-align: center;
            padding: 7px;
            margin-top: 14px;
            font-size: 7px;
            box-sizing: border-box;
        }

        .proceed-btn:hover {
            background: #ff1d29;
            color: white;
        }

        @media(max-width: 700px) {

            .seat-layout {
                flex-direction: column;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="seat-page">


        <!-- HEADER -->

        <div class="seat-header">

           <h1>
    <asp:Label ID="lblMovie" runat="server"></asp:Label>
</h1>

<p>
    Cinepolis: Alpha One, Ahmedabad • Today • 06:00 PM
</p>

        </div>


        <div class="seat-layout">


            <!-- SCREEN + SEATS -->

            <div class="screen-card">

                <div class="screen-title">
                    SCREEN THIS WAY
                </div>

                <div class="screen"></div>


                <div class="seat-area">


                    <!-- ROW A -->

                    <div class="seat-row">

                        <span class="row-label">A</span>

                        <span class="seat">1</span>
                        <span class="seat">2</span>
                        <span class="seat">3</span>
                        <span class="seat">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat">5</span>
                        <span class="seat">6</span>
                        <span class="seat">7</span>

                    </div>


                    <!-- ROW B -->

                    <div class="seat-row">

                        <span class="row-label">B</span>

                        <span class="seat">1</span>
                        <span class="seat">2</span>
                        <span class="seat">3</span>
                        <span class="seat occupied">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat">5</span>
                        <span class="seat">6</span>
                        <span class="seat">7</span>

                    </div>


                    <!-- ROW C -->

                    <div class="seat-row">

                        <span class="row-label">C</span>

                        <span class="seat">1</span>
                        <span class="seat">2</span>
                        <span class="seat">3</span>
                        <span class="seat">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat selected">5</span>
                        <span class="seat selected">6</span>
                        <span class="seat">7</span>

                    </div>


                    <!-- ROW D -->

                    <div class="seat-row">

                        <span class="row-label">D</span>

                        <span class="seat">1</span>
                        <span class="seat occupied">2</span>
                        <span class="seat">3</span>
                        <span class="seat">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat">5</span>
                        <span class="seat">6</span>
                        <span class="seat">7</span>

                    </div>


                    <!-- ROW E -->

                    <div class="seat-row">

                        <span class="row-label">E</span>

                        <span class="seat">1</span>
                        <span class="seat">2</span>
                        <span class="seat">3</span>
                        <span class="seat">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat">5</span>
                        <span class="seat">6</span>
                        <span class="seat">7</span>

                    </div>


                    <!-- ROW F -->

                    <div class="seat-row">

                        <span class="row-label">F</span>

                        <span class="seat">1</span>
                        <span class="seat">2</span>
                        <span class="seat">3</span>
                        <span class="seat">4</span>

                        <span class="seat-gap"></span>

                        <span class="seat">5</span>
                        <span class="seat">6</span>
                        <span class="seat">7</span>

                    </div>


                </div>


                <!-- LEGEND -->

                <div class="seat-legend">

                    <div class="legend-item">
                        <span class="legend-box"></span>
                        Available
                    </div>

                    <div class="legend-item">
                        <span class="legend-box selected"></span>
                        Selected
                    </div>

                    <div class="legend-item">
                        <span class="legend-box occupied"></span>
                        Occupied
                    </div>

                </div>

            </div>


            <!-- BOOKING SUMMARY -->

            <div class="summary-card">

                <h2>Booking Summary</h2>

                <div class="summary-row">

                    <span>Selected Seats</span>

                   <asp:Label ID="lblSeats" runat="server" Text="C5, C6"></asp:Label>

                </div>

                <div class="summary-row">

                    <span>Ticket Price</span>

                    <span>₹ 360</span>

                </div>

                <div class="summary-row total-row">

                    <span>Total Amount</span>

                    <span>₹ 380</span>

                </div>
<a href='<%= "PaymentSuccess.aspx?movie=" +
    Server.UrlEncode(Request.QueryString["movie"]) +
    "&poster=" +
    Server.UrlEncode(Request.QueryString["poster"]) +
    "&seats=C5%2C%20C6" %>'
   class="proceed-btn">
    Proceed to Pay →
</a>

            </div>


        </div>

    </div>

</asp:Content>
