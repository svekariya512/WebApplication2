<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Home111.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Hero Section --- */
        .hero-section {
            position: relative;
            background: linear-gradient(180deg, rgba(0,0,0,0.4) 0%, rgba(11,11,11,1) 100%), 
                        url('Images/hometheater1.jpg') center/cover no-repeat;
            height: 85vh;
            display: flex;
            align-items: center;
            padding-left: 60px;
            border-bottom: 2px solid #222;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            text-shadow: 2px 2px 20px rgba(0,0,0,0.8);
            line-height: 1.2;
        }

        .hero-desc {
            font-size: 1.1rem;
            color: #ccc;
            max-width: 550px;
            text-shadow: 1px 1px 10px rgba(0,0,0,0.8);
        }

        .badge-custom {
            background-color: #e50914;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: 600;
            letter-spacing: 1px;
            box-shadow: 0 0 15px rgba(229, 9, 20, 0.4);
        }

        /* --- Movie Cards --- */
        .section-title {
            font-size: 2rem;
            font-weight: 700;
            border-left: 5px solid #e50914;
            padding-left: 15px;
        }

        .movie-card {
            background-color: #151515;
            border: 1px solid #222;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.4s ease;
            height: 100%;
        }

        .movie-card:hover {
            transform: translateY(-10px);
            border-color: #e50914;
            box-shadow: 0 15px 30px rgba(229, 9, 20, 0.15);
        }

        .movie-poster {
            height: 320px;
            object-fit: cover;
            width: 100%;
            transition: transform 0.4s ease;
        }

        .movie-card:hover .movie-poster {
            transform: scale(1.05);
        }

        .movie-info {
            padding: 15px;
        }

        .movie-title {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .movie-genre {
            font-size: 0.85rem;
            color: #888;
            margin-bottom: 15px;
        }

        .btn-book {
            background: linear-gradient(135deg, #e50914, #b80710);
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-book:hover {
            background: linear-gradient(135deg, #ff1a1a, #d40812);
            box-shadow: 0 4px 12px rgba(229, 9, 20, 0.4);
            color: white;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Banner -->
    <div class="hero-section text-white mb-5">
        <div class="container-fluid">
            <span class="badge-custom mb-3 d-inline-block"><i class="fa-solid fa-fire me-1"></i> TRENDING NOW</span>
            <h1 class="hero-title">Shadows of Gotham:<br>The Final Chapter</h1>
            <p class="hero-desc mt-3">
                Experience the epic conclusion in breathtaking IMAX. The city's greatest hero faces his ultimate test against an adversary born from darkness itself.
            </p>
            <div class="mt-4 d-flex gap-3">
                <asp:Button ID="btnBookTickets" runat="server" Text="Book Tickets" CssClass="btn btn-red btn-lg px-4" OnClick="btnBookTickets_Click" />
                <a href="#" class="btn btn-outline-light btn-lg px-4"><i class="fa-solid fa-circle-play me-2"></i> Watch Trailer</a>
            </div>
        </div>
    </div>

    <!-- Movie Cards Section -->
    <div class="container mb-5">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h3 class="section-title">Now Showing</h3>
                <small class="text-secondary ms-3">Movies currently playing in theaters near you</small>
            </div>
            <a href="Movies111.aspx" class="text-danger text-decoration-none fw-semibold">View All <i class="fa-solid fa-arrow-right ms-1"></i></a>
        </div>

        <div class="row g-4">
            <!-- Movie 1 -->
            <div class="col-md-3">
                <div class="movie-card">
                    <img src="Images/jungle1.jpg" class="movie-poster" alt="Jungle Heart" />
                    <div class="movie-info">
                        <h5 class="movie-title">Jungle Heart</h5>
                        <small class="movie-genre">Action • Sci-Fi</small>
                        <asp:Button ID="btnMovie1" runat="server" Text="Book Now" CssClass="btn btn-book w-100 btn-sm" OnClick="btnMovie_Click" CommandArgument="Jungle Heart" />
                    </div>
                </div>
            </div>

            <!-- Movie 2 -->
            <div class="col-md-3">
                <div class="movie-card">
                    <img src="Images/void1.jpg" class="movie-poster" alt="Void" />
                    <div class="movie-info">
                        <h5 class="movie-title">Void</h5>
                        <small class="movie-genre">Sci-Fi • Thriller</small>
                        <asp:Button ID="btnMovie2" runat="server" Text="Book Now" CssClass="btn btn-book w-100 btn-sm" OnClick="btnMovie_Click" CommandArgument="Void" />
                    </div>
                </div>
            </div>

            <!-- Movie 3 -->
            <div class="col-md-3">
                <div class="movie-card">
                    <img src="Images/kohinoor.jpg" class="movie-poster" alt="Koh-i-noor" />
                    <div class="movie-info">
                        <h5 class="movie-title">Koh-i-noor</h5>
                        <small class="movie-genre">Documentary • Mystery</small>
                        <asp:Button ID="btnMovie3" runat="server" Text="Book Now" CssClass="btn btn-book w-100 btn-sm" OnClick="btnMovie_Click" CommandArgument="Koh-i-noor" />
                    </div>
                </div>
            </div>

            <!-- Movie 4 -->
            <div class="col-md-3">
                <div class="movie-card">
                    <img src="Images/chhava.jpg" class="movie-poster" alt="CHHAAVA" />
                    <div class="movie-info">
                        <h5 class="movie-title">CHHAAVA</h5>
                        <small class="movie-genre">Historical • Drama</small>
                        <asp:Button ID="btnMovie4" runat="server" Text="Book Now" CssClass="btn btn-book w-100 btn-sm" OnClick="btnMovie_Click" CommandArgument="CHHAAVA" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>