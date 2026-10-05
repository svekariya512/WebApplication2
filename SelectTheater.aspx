<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="SelectTheater.aspx.cs" Inherits="WebApplication2.SelectTheater" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .theater-page {
            min-height: 100vh;
            padding: 28px 30px;
            background: #111111;
            color: #fff;
            box-sizing: border-box;
        }

        .top-search {
            width: 100%;
            height: 32px;
            background: #181818;
            border: 1px solid #292929;
            border-radius: 3px;
            color: #aaa;
            padding: 0 12px;
            box-sizing: border-box;
            font-size: 8px;
            margin-bottom: 25px;
        }

        .theater-header h1 {
            font-size: 16px;
            margin: 0 0 4px;
            color: #eeeeee;
        }

        .theater-header p {
            font-size: 8px;
            color: #777;
            margin: 0 0 14px;
        }

        /* Dates */

        .date-row {
            display: flex;
            gap: 6px;
            margin-bottom: 18px;
        }

        .date-box {
            width: 38px;
            height: 45px;
            background: #252525;
            border: 1px solid #303030;
            border-radius: 4px;
            color: #aaa;
            text-align: center;
            padding-top: 6px;
            box-sizing: border-box;
        }

        .date-box span {
            display: block;
            font-size: 6px;
            margin-bottom: 3px;
        }

        .date-box strong {
            font-size: 9px;
        }

        .date-box.active {
            background: #ed101c;
            border-color: #ed101c;
            color: white;
        }

        /* Theater Grid */

        .theater-grid {
            display: grid;
            grid-template-columns: repeat(2, 235px);
            gap: 10px;
        }

        .theater-card {
            background: #1b1b1b;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 10px;
            box-sizing: border-box;
        }

        .theater-card h2 {
            font-size: 9px;
            color: #eeeeee;
            margin: 0 0 3px;
        }

        .theater-location {
            color: #777;
            font-size: 7px;
            margin-bottom: 8px;
        }

        .show-title {
            color: #888;
            font-size: 6px;
            margin-bottom: 5px;
            text-transform: uppercase;
        }

        .show-times {
            display: flex;
            gap: 5px;
            flex-wrap: wrap;
            margin-bottom: 9px;
        }

        .time-btn {
            background: #292929;
            border: 1px solid #3a3a3a;
            color: #aaa;
            border-radius: 3px;
            padding: 5px 7px;
            font-size: 6px;
            cursor: pointer;
        }

        .time-btn:hover,
        .time-btn.selected {
            background: #ed101c;
            border-color: #ed101c;
            color: white;
        }

        .select-seat-btn {
            display: block;
            width: 100%;
            background: #ed101c;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 3px;
            text-align: center;
            padding: 7px;
            font-size: 7px;
            box-sizing: border-box;
        }

        .select-seat-btn:hover {
            background: #ff1d29;
            color: white;
        }

        @media(max-width: 750px) {

            .theater-grid {
                grid-template-columns: 1fr;
                max-width: 235px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="theater-page">

        <input type="text"
               class="top-search"
               placeholder="Search theaters, movies..." />


        <div class="theater-header">

            <h1>Select Theater</h1>

            <p>
    Choose your preferred cinema for
    <asp:Label ID="lblMovie" runat="server"></asp:Label>.
</p>

        </div>


        <!-- DATES -->

        <div class="date-row">

            <div class="date-box active">
                <span>TODAY</span>
                <strong>14</strong>
            </div>

            <div class="date-box">
                <span>THU</span>
                <strong>15</strong>
            </div>

            <div class="date-box">
                <span>FRI</span>
                <strong>16</strong>
            </div>

            <div class="date-box">
                <span>SAT</span>
                <strong>17</strong>
            </div>

            <div class="date-box">
                <span>SUN</span>
                <strong>18</strong>
            </div>

        </div>


        <!-- THEATERS -->

        <div class="theater-grid">


            <!-- CINEPOLIS -->

            <div class="theater-card">

                <h2>
                    Cinepolis: Alpha One, Ahmedabad
                </h2>

                <div class="theater-location">
                    4.2 km away
                </div>

                <div class="show-title">
                    STANDARD 2D
                </div>

                <div class="show-times">

                    <button class="time-btn">
                        12:00 AM
                    </button>

                    <button class="time-btn">
                        01:30 PM
                    </button>

                    <button class="time-btn selected">
                        06:00 PM
                    </button>

                    <button class="time-btn">
                        09:15 PM
                    </button>

                </div>

                <a href="SeatSelection.aspx"
                   class="select-seat-btn">
                    Select Seats
                </a>

            </div>


            <!-- PVR -->

            <div class="theater-card">

                <h2>
                    PVR: Acropolis Mall
                </h2>

                <div class="theater-location">
                    4.0 km away
                </div>

                <div class="show-title">
                    STANDARD 2D
                </div>

                <div class="show-times">

                    <button class="time-btn">
                        11:15 AM
                    </button>

                    <button class="time-btn">
                        02:45 PM
                    </button>

                    <button class="time-btn">
                        08:30 PM
                    </button>

                </div>

                <a href="SeatSelection.aspx"
                   class="select-seat-btn">
                    Select Seats
                </a>

            </div>


            <!-- WIDE ANGLE -->

            <div class="theater-card">

                <h2>
                    Wide Angle
                </h2>

                <div class="theater-location">
                    6.1 km away
                </div>

                <div class="show-title">
                    STANDARD 2D
                </div>

                <div class="show-times">

                    <button class="time-btn">
                        12:00 PM
                    </button>

                    <button class="time-btn">
                        04:00 PM
                    </button>

                </div>

                <a href="SeatSelection.aspx"
                   class="select-seat-btn">
                    Select Seats
                </a>

            </div>


        </div>

    </div>

</asp:Content>
