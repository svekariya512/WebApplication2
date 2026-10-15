<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="WebApplication2.UserDashboard" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .dashboard-page {
            min-height: 100vh;
            background: #111111;
            color: #ffffff;
            padding: 38px 40px;
            box-sizing: border-box;
        }

        

        .welcome-title {
            font-size: 17px;
            font-weight: 700;
            color: #eeeeee;
            margin: 0 0 5px;
        }

        .welcome-subtitle {
            font-size: 8px;
            color: #999999;
            margin: 0 0 22px;
        }

        /* Upcoming Movie */

        .upcoming-card {
            width: 100%;
            max-width: 575px;
            height: 158px;
            border: 1px solid #292929;
            border-radius: 5px;
            position: relative;
            overflow: hidden;
            background: #171717;
            box-sizing: border-box;
            margin-bottom: 30px;
        }

        .upcoming-bg {
            position: absolute;
            right: 0;
            top: 0;
            width: 58%;
            height: 100%;
            object-fit: cover;
            opacity: 0.35;
        }

        .upcoming-overlay {
            position: absolute;
            inset: 0;
            background: linear-gradient(
                90deg,
                #111111 0%,
                rgba(17,17,17,0.94) 38%,
                rgba(17,17,17,0.35) 100%
            );
        }

        .upcoming-content {
            position: relative;
            z-index: 2;
            padding: 20px;
        }

        .upcoming-label {
            display: inline-block;
            color: #ffaaa0;
            border: 1px solid #ffaaa0;
            padding: 3px 7px;
            font-size: 6px;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .upcoming-content h1 {
            font-size: 19px;
            margin: 0 0 10px;
            color: #eeeeee;
        }

        .movie-meta {
            display: flex;
            align-items: center;
            gap: 9px;
            color: #aaaaaa;
            font-size: 7px;
            margin-bottom: 13px;
        }

        .movie-meta i {
            color: #bbbbbb;
        }

        .cinema-tag {
            color: #e6c85c;
            border: 1px solid #806f20;
            padding: 3px 6px;
            font-size: 6px;
        }

        .view-ticket {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background: #ed101c;
            color: #ffffff;
            text-decoration: none;
            border-radius: 3px;
            padding: 8px 18px;
            font-size: 7px;
            font-weight: 600;
        }

        .view-ticket:hover {
            background: #ff1d29;
            color: #ffffff;
        }

        /* Recent Activity */

        .recent-card {
            width: 100%;
            max-width: 575px;
            background: #181818;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 17px;
            box-sizing: border-box;
        }

        .recent-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 14px;
        }

        .recent-header h2 {
            margin: 0;
            color: #eeeeee;
            font-size: 13px;
        }

        .view-all {
            color: #bbbbbb;
            text-decoration: none;
            font-size: 7px;
        }

        .view-all:hover {
            color: #ffaaa0;
        }

        /* Activity Item */

        .activity-item {
            height: 68px;
            border: 1px solid #292929;
            background: #191919;
            border-radius: 3px;
            display: flex;
            align-items: center;
            padding: 9px;
            box-sizing: border-box;
            margin-bottom: 9px;
        }

        .activity-item:last-child {
            margin-bottom: 0;
        }

        .activity-poster {
            width: 43px;
            height: 50px;
            object-fit: cover;
            border-radius: 2px;
            margin-right: 10px;
        }

        .activity-info {
            flex: 1;
        }

        .activity-info h3 {
            color: #dddddd;
            font-size: 9px;
            margin: 0 0 4px;
        }

        .activity-info p {
            color: #888888;
            font-size: 6px;
            margin: 0;
        }

        .activity-status {
            color: #cccccc;
            font-size: 7px;
            margin-right: 4px;
        }

        @media(max-width: 700px) {

            .dashboard-page {
                padding: 25px 20px;
            }

            .upcoming-card,
            .recent-card {
                max-width: 100%;
            }

            .upcoming-content h1 {
                font-size: 15px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="dashboard-page">

        <!-- Welcome -->

        <h2 class="welcome-title">
            Welcome back, Mital!
        </h2>

        <p class="welcome-subtitle">
            Your cinema experience awaits.
        </p>


        <!-- Upcoming Movie -->

        <div class="upcoming-card">

            <asp:Image ID="imgUpcomingMovie"
                runat="server"
                ImageUrl="~/Images/spiderman.png"
                CssClass="upcoming-bg"
                AlternateText="Spider-Man" />

            <div class="upcoming-overlay"></div>

            <div class="upcoming-content">

                <div class="upcoming-label">
                    UPCOMING SCREENING
                </div>

                <h1>
                    Spider-Man: Brand New Day
                </h1>

                <div class="movie-meta">

                    <span>
                        <i class="fa-regular fa-calendar"></i>
                        Fri, Oct 27 @ 6:30 PM
                    </span>

                    <span>
                        <i class="fa-solid fa-chair"></i>
                        Row A, Seat 5
                    </span>

                    <span class="cinema-tag">
                        CINEPULSE • Rajkot
                    </span>

                </div>

                <a href="TicketDetails.aspx"
                   class="view-ticket">
                    View Ticket
                </a>

            </div>

        </div>


        <!-- Recent Activity -->

        <div class="recent-card">

            <div class="recent-header">

                <h2>
                    Recent Activity
                </h2>

                <a href="MyTickets.aspx"
                   class="view-all">
                    View All
                </a>

            </div>


            <!-- Cocktail 2 -->

            <div class="activity-item">

                <asp:Image ID="imgCocktail"
                    runat="server"
                    ImageUrl="~/Images/cocktail2.png"
                    CssClass="activity-poster"
                    AlternateText="Cocktail 2" />

                <div class="activity-info">

                    <h3>
                        Cocktail 2
                    </h3>

                    <p>
                        May 12 • Cosmosplex, Rajkot
                    </p>

                </div>

                <div class="activity-status">
                    Completed
                </div>

            </div>


            <!-- Alpha -->

            <div class="activity-item">

                <asp:Image ID="imgAlpha"
                    runat="server"
                    ImageUrl="~/Images/alpha.png"
                    CssClass="activity-poster"
                    AlternateText="Alpha" />

                <div class="activity-info">

                    <h3>
                        Alpha
                    </h3>

                    <p>
                        June 26 • Rajshri Cinema, Rajkot
                    </p>

                </div>

                <div class="activity-status">
                    Completed
                </div>

            </div>

        </div>

    </div>

</asp:Content>