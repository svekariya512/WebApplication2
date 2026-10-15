<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="WebApplication2.Wishlist" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .wishlist-page {
            min-height: 100vh;
            padding: 38px 32px;
            background: #111111;
            color: #ffffff;
            box-sizing: border-box;
        }

        
        .wishlist-header h1 {
            font-size: 24px;
            margin: 0 0 4px;
            color: #eeeeee;
            font-weight: 600;
        }

        .wishlist-header p {
            font-size: 9px;
            color: #777777;
            margin: 0 0 20px;
        }

        /* Movie Grid */

        .wishlist-grid {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        /* Movie Card */

        .movie-card {
            width: 98px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 5px;
            box-sizing: border-box;
            position: relative;
            transition: 0.2s ease;
        }

        .movie-card:hover {
            border-color: #444444;
            transform: translateY(-2px);
        }

        /* Poster */

        .movie-poster-box {
            width: 88px;
            height: 122px;
            position: relative;
            overflow: hidden;
            border-radius: 3px;
            background: #252525;
        }

        .movie-poster {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* Heart */

        .wishlist-heart {
            position: absolute;
            top: 5px;
            right: 5px;
            width: 15px;
            height: 15px;
            border-radius: 50%;
            background: #ed101c;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 7px;
            z-index: 2;
        }

        /* Movie Details */

        .movie-info {
            padding: 4px 2px 2px;
        }

        .movie-info h3 {
            color: #eeeeee;
            font-size: 9px;
            font-weight: 500;
            margin: 2px 0 2px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .movie-info p {
            color: #777777;
            font-size: 7px;
            margin: 0 0 5px;
        }

        /* Book Button */

        .book-btn {
            display: block;
            width: 100%;
            background: #ed101c;
            color: #ffffff;
            text-decoration: none;
            text-align: center;
            border-radius: 3px;
            padding: 5px 0;
            font-size: 7px;
            font-weight: 600;
            box-sizing: border-box;
        }

        .book-btn:hover {
            background: #ff1d29;
            color: #ffffff;
        }

        /* Delete Button */

        .remove-btn {
            position: absolute;
            bottom: 6px;
            right: 6px;
            width: 16px;
            height: 16px;
            background: #292929;
            border: 1px solid #3b3b3b;
            color: #999999;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 7px;
            text-decoration: none;
        }

        .remove-btn:hover {
            color: #ff7777;
            border-color: #542020;
        }

        @media(max-width: 700px) {

            .wishlist-page {
                padding: 25px 20px;
            }

            .wishlist-grid {
                gap: 10px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="wishlist-page">

        <!-- HEADER -->

        <div class="wishlist-header">

            <h1>My Wishlist</h1>

            <p>
                Movies you're interested in watching.
            </p>

        </div>


        <!-- MOVIE GRID -->

        <div class="wishlist-grid">


            <!-- ALPHA -->

            <div class="movie-card">

                <div class="movie-poster-box">

                    <asp:Image ID="imgAlpha"
                        runat="server"
                        ImageUrl="~/Images/alpha.png"
                        CssClass="movie-poster"
                        AlternateText="Alpha" />

                    <span class="wishlist-heart">
                        <i class="fa-solid fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h3>Alpha</h3>

                    <p>₹ 150 • 2D</p>

                    <a href="BookMovie.aspx"
                       class="book-btn">
                        Book Now
                    </a>

                </div>

                <a href="#"
                   class="remove-btn">
                    <i class="fa-regular fa-trash-can"></i>
                </a>

            </div>


            <!-- COCKTAIL 2 -->

            <div class="movie-card">

                <div class="movie-poster-box">

                    <asp:Image ID="imgCocktail"
                        runat="server"
                        ImageUrl="~/Images/cocktail2.png"
                        CssClass="movie-poster"
                        AlternateText="Cocktail 2" />

                    <span class="wishlist-heart">
                        <i class="fa-solid fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h3>Cocktail 2</h3>

                    <p>₹ 180 • 2D</p>

                    <a href="BookMovie.aspx"
                       class="book-btn">
                        Book Now
                    </a>

                </div>

                <a href="#"
                   class="remove-btn">
                    <i class="fa-regular fa-trash-can"></i>
                </a>

            </div>


            <!-- KUTCH EXPRESS -->

            <div class="movie-card">

                <div class="movie-poster-box">

                    <asp:Image ID="imgKutch"
                        runat="server"
                        ImageUrl="~/Images/kutchexpress.png"
                        CssClass="movie-poster"
                        AlternateText="Kutch Express" />

                    <span class="wishlist-heart">
                        <i class="fa-solid fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h3>Kutch Express</h3>

                    <p>₹ 160 • 2D</p>

                    <a href="BookMovie.aspx"
                       class="book-btn">
                        Book Now
                    </a>

                </div>

                <a href="#"
                   class="remove-btn">
                    <i class="fa-regular fa-trash-can"></i>
                </a>

            </div>


            <!-- CRAZY JEEV -->

            <div class="movie-card">

                <div class="movie-poster-box">

                    <asp:Image ID="imgCrazy"
                        runat="server"
                        ImageUrl="~/Images/chaljivilayae.png"
                        CssClass="movie-poster"
                        AlternateText="Chal Jeevi Lay ae" />

                    <span class="wishlist-heart">
                        <i class="fa-solid fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h3>Crazy Jeev</h3>

                    <p>₹ 170 • 2D</p>

                    <a href="BookMovie.aspx"
                       class="book-btn">
                        Book Now
                    </a>

                </div>

                <a href="#"
                   class="remove-btn">
                    <i class="fa-regular fa-trash-can"></i>
                </a>

            </div>


        </div>

    </div>

</asp:Content>
