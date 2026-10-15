<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="BookMovie.aspx.cs" Inherits="WebApplication2.BookMovie" %>



<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>
        /*user can book a movie*/
        .booking-page {
            min-height: 100vh;
            padding: 38px 32px;
            background: #111111;
            color: white;
            box-sizing: border-box;
        }

        .booking-header h1 {
            font-size: 24px;
            margin: 0 0 5px;
            color: #eeeeee;
        }

        .booking-header p {
            font-size: 9px;
            color: #777777;
            margin: 0 0 20px;
        }

        .movie-grid {
            display: grid;
            grid-template-columns: repeat(4, 108px);
            gap: 10px;
            align-items: start;
        }

        .movie-card {
            width: 108px;
            background: #242424;
            border: 1px solid #303030;
            border-radius: 6px;
            overflow: hidden;
            position: relative;
            box-sizing: border-box;
        }

        .poster-area {
            width: 100%;
            height: 132px;
            position: relative;
            background: #1c1c1c;
        }

        .poster {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .heart {
            position: absolute;
            right: 5px;
            top: 5px;
            width: 15px;
            height: 15px;
            border: 1px solid #777777;
            border-radius: 50%;
            background: #1d1d1d;
            color: #bbbbbb;
            display: flex;
            justify-content: center;
            align-items: center;
            font-size: 7px;
        }

        .movie-info {
            padding: 7px;
        }

        .movie-info h2 {
            font-size: 9px;
            color: #eeeeee;
            margin: 0 0 5px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .movie-info p {
            font-size: 7px;
            color: #999999;
            margin: 0 0 8px;
        }

        .movie-buttons {
            display: flex;
            gap: 5px;
        }

        .book-btn {
            flex: 1;
            background: #ed101c;
            color: white;
            text-decoration: none;
            text-align: center;
            padding: 6px 3px;
            border-radius: 3px;
            font-size: 7px;
            font-weight: 600;
        }

        .book-btn:hover {
            background: #ff1d29;
            color: white;
        }

        .wish-btn {
            width: 20px;
            height: 20px;
            background: #292929;
            border: 1px solid #444444;
            color: #aaaaaa;
            border-radius: 3px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 7px;
            box-sizing: border-box;
        }

        .wish-btn:hover {
            color: #ff7777;
            border-color: #ff7777;
        }

        @media(max-width: 850px) {

            .movie-grid {
                grid-template-columns: repeat(3, 108px);
            }

        }

        @media(max-width: 600px) {

            .booking-page {
                padding: 25px 20px;
            }

            .movie-grid {
                grid-template-columns: repeat(2, 108px);
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="booking-page">

        <div class="booking-header">

            <h1>Book New Movie</h1>

            <p>
                Movies you're interested in watching.
            </p>

        </div>


        <div class="movie-grid">


            <!-- JHAMKUDI -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgJhamkudi"
                        runat="server"
                        ImageUrl="~/Images/jhamkudi.png"
                        CssClass="poster"
                        AlternateText="Jhamkudi" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Jhamkudi</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        8.2/10
                    </p>

                    <div class="movie-buttons">

                     <a href="SelectTheater.aspx?movie=Jhamkudi&poster=jhamkudi.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


            <!-- STREE 2 -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgStree"
                        runat="server"
                        ImageUrl="~/Images/stree2.png"
                        CssClass="poster"
                        AlternateText="Stree 2" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Stree 2</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        8.2/10
                    </p>

                    <div class="movie-buttons">
<a href="SelectTheater.aspx?movie=Stree%202&poster=stree2.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


            <!-- FAKT PURUSHON MAATE -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgFakt"
                        runat="server"
                        ImageUrl="~/Images/faktpurushonmaate.png"
                        CssClass="poster"
                        AlternateText="Fakt Purushon Maate" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Fakt Purushon Maate</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        8.9/10
                    </p>

                    <div class="movie-buttons">

                        <a href="SelectTheater.aspx?movie=Fakt%20Purushon%20Maate&poster=faktpurushonmaate.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


            <!-- KHEL KHEL MEIN -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgKhel"
                        runat="server"
                        ImageUrl="~/Images/khelkhelmein.png"
                        CssClass="poster"
                        AlternateText="Khel Khel Mein" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Khel Khel Mein</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        9.1/10
                    </p>

                    <div class="movie-buttons">

                        <a href="SelectTheater.aspx?movie=Khel%20Khel%20Mein&poster=khelkhelmein.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


            <!-- SHAITAN -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgShaitan"
                        runat="server"
                        ImageUrl="~/Images/shaitaan.png"
                        CssClass="poster"
                        AlternateText="Shaitaan" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Shaitaan</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        8.5/10
                    </p>

                    <div class="movie-buttons">

                       <a href="SelectTheater.aspx?movie=Shaitaan&poster=shaitaan.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


            <!-- BHOOL BHULAIYAA 3 -->

            <div class="movie-card">

                <div class="poster-area">

                    <asp:Image ID="imgBhool"
                        runat="server"
                        ImageUrl="~/Images/bhoolbhulaiyaa3.png"
                        CssClass="poster"
                        AlternateText="Bhool Bhulaiyaa 3" />

                    <span class="heart">
                        <i class="fa-regular fa-heart"></i>
                    </span>

                </div>

                <div class="movie-info">

                    <h2>Bhool Bhulaiyaa 3</h2>

                    <p>
                        <i class="fa-regular fa-star"></i>
                        8.4/10
                    </p>

                    <div class="movie-buttons">

                        <a href="SelectTheater.aspx?movie=Bhool%20Bhulaiyaa%203&poster=bhoolbhulaiyaa3.png"
   class="book-btn">
    Book Now
</a>

                        <a href="Wishlist.aspx"
                           class="wish-btn">
                            <i class="fa-regular fa-heart"></i>
                        </a>

                    </div>

                </div>

            </div>


        </div>

    </div>

</asp:Content>
