<%@ Page Title="Theater" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Theater111.aspx.cs" Inherits="WebApplication2.Theater111" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Hero Section --- */
        .hero-section {
            position: relative;
            background: linear-gradient(180deg, rgba(0,0,0,0.7) 0%, rgba(11,11,11,1) 100%), 
                        url('Images/neew6.png') center/cover no-repeat;
            height: 60vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            border-bottom: 1px solid #222;
        }

        .hero-badge {
            display: inline-block;
            border: 1px solid #FFC3B9;
            color: #FFC3B9;
            padding: 6px 18px;
            border-radius: 20px;
            font-size: 0.75rem;
            letter-spacing: 2px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .hero-title {
            font-size: 2.8rem;
            font-weight: 800;
            color: #fff;
            margin-bottom: 15px;
        }

        .hero-subtitle {
            color: #aaa;
            font-size: 1rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* --- Our Theatre Section --- */
        .theatre-section {
            background: #0f0f0f;
            padding: 60px 40px;
            margin: 40px;
            border-radius: 12px;
            border: 1px solid #1a1a1a;
        }

        .section-header {
            margin-bottom: 30px;
        }

        .section-title {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .section-sub {
            color: #888;
            font-size: 0.9rem;
        }

        .theatre-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        @media (max-width: 992px) {
            .theatre-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 576px) {
            .theatre-grid { grid-template-columns: 1fr; }
        }

        .theatre-card {
            background: #151515;
            border: 1px solid #222;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .theatre-card:hover {
            border-color: #FFC3B9;
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(255, 195, 185, 0.15);
        }

        .theatre-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .theatre-info {
            padding: 15px;
        }

        .theatre-info h5 {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .theatre-info p {
            color: #888;
            font-size: 0.8rem;
            margin-bottom: 10px;
        }

        .badge-tag {
            display: inline-block;
            border: 1px solid #555;
            color: #bbb;
            font-size: 0.65rem;
            padding: 3px 10px;
            border-radius: 4px;
            margin-right: 5px;
            margin-bottom: 5px;
            letter-spacing: 1px;
        }

        /* --- Signature Screens Section --- */
        .screens-section {
            padding: 40px;
        }

        .screens-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 25px;
            margin-top: 25px;
        }

        @media (max-width: 768px) {
            .screens-grid { grid-template-columns: 1fr; }
        }

        .screen-card {
            background: #151515;
            border: 1px solid #222;
            border-radius: 12px;
            overflow: hidden;
            display: flex;
            transition: all 0.3s ease;
        }

        .screen-card:hover {
            border-color: #FFC3B9;
            box-shadow: 0 10px 25px rgba(255, 195, 185, 0.15);
        }

        .screen-card img {
            width: 180px;
            height: 100%;
            object-fit: cover;
            min-height: 220px;
        }

        .screen-info {
            padding: 20px;
            flex: 1;
        }

        .screen-badge {
            display: inline-block;
            background: #FFC3B9;
            color: #000;
            font-size: 0.65rem;
            font-weight: 700;
            padding: 3px 10px;
            border-radius: 4px;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }

        .screen-info h4 {
            font-size: 1.3rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .screen-info p {
            color: #999;
            font-size: 0.85rem;
            margin-bottom: 12px;
            line-height: 1.5;
        }

        .screen-meta {
            color: #777;
            font-size: 0.75rem;
            margin-bottom: 12px;
        }

        .screen-meta i {
            color: #FFC3B9;
            margin-right: 5px;
        }

        .btn-book-now {
            background: #e50914;
            color: #fff;
            border: none;
            padding: 8px 20px;
            border-radius: 6px;
            font-size: 0.8rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .btn-book-now:hover {
            background: #b80710;
            color: #fff;
            box-shadow: 0 4px 12px rgba(229, 9, 20, 0.4);
        }

        /* --- Comfort Section --- */
        .comfort-section {
            padding: 40px;
        }

        .comfort-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-top: 25px;
        }

        @media (max-width: 768px) {
            .comfort-grid { grid-template-columns: 1fr; }
        }

        .comfort-card {
            background: #151515;
            border: 1px solid #222;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.3s ease;
        }

        .comfort-card:hover {
            border-color: #FFC3B9;
            box-shadow: 0 10px 25px rgba(255, 195, 185, 0.15);
        }

        .comfort-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }

        .comfort-info {
            padding: 20px;
        }

        .comfort-info h5 {
            font-size: 1.1rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .comfort-info p {
            color: #999;
            font-size: 0.85rem;
            margin-bottom: 0;
            line-height: 1.5;
        }

        .comfort-icon {
            color: #FFC3B9;
            font-size: 1.2rem;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <div class="hero-badge">PREMIUM EXPERIENCE</div>
            <h1 class="hero-title">Redefining Cinematic Immersion</h1>
            <p class="hero-subtitle">
                Step into a world where cutting-edge technology meets unparalleled comfort.
                Discover our signature screens designed for the ultimate movie enthusiast.
            </p>
        </div>
    </div>

    <!-- Our Theatre Section -->
    <div class="theatre-section">
        <div class="section-header">
            <h2 class="section-title">Our Theatre</h2>
            <p class="section-sub">Find a premium CinePulse experience near you.</p>
        </div>

        <div class="theatre-grid">
            <!-- Theatre 1 -->
            <div class="theatre-card">
                <img src="Images/neew1.png" alt="CinePulse Downtown" />
                <div class="theatre-info">
                    <h5>CinePulse Downtown</h5>
                    <p>Mumbai, MH</p>
                    <span class="badge-tag">IMAX</span>
                    <span class="badge-tag">ATMOS</span>
                </div>
            </div>

            <!-- Theatre 2 -->
            <div class="theatre-card">
                <img src="Images/neew6.png" alt="CinePulse Westside" />
                <div class="theatre-info">
                    <h5>CinePulse Westside</h5>
                    <p>Ahmedabad, GJ</p>
                    <span class="badge-tag">ATMOS</span>
                    <span class="badge-tag">GOLD CLASS</span>
                </div>
            </div>

            <!-- Theatre 3 -->
            <div class="theatre-card">
                <img src="Images/neew5.png" alt="CinePulse Metro" />
                <div class="theatre-info">
                    <h5>CinePulse Metro</h5>
                    <p>Bengaluru, KA</p>
                    <span class="badge-tag">IMAX</span>
                </div>
            </div>

            <!-- Theatre 4 -->
            <div class="theatre-card">
                <img src="Images/pexels-tima-miroshnichenko-7991579.jpg" alt="CinePulse Grand" />
                <div class="theatre-info">
                    <h5>CinePulse Grand</h5>
                    <p>New Delhi, DL</p>
                    <span class="badge-tag">IMAX</span>
                    <span class="badge-tag">ATMOS</span>
                    <span class="badge-tag">LUXE</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Our Signature Screens Section -->
    <div class="screens-section">
        <div class="section-header">
            <h2 class="section-title">Our Signature Screens</h2>
            <p class="section-sub">Select your preferred viewing format for today's showings.</p>
        </div>

        <div class="screens-grid">
            <!-- Screen 1: FIGHTER -->
            <div class="screen-card">
                <img src="Images/neew8.png" alt="Fighter" />
                <div class="screen-info">
                    <span class="screen-badge">IMAX</span>
                    <h4>FIGHTER</h4>
                    <p>Top IAF aviators unite under Air Dragons, facing grave danger to complete a high-stakes mission for the nation.</p>
                    <div class="screen-meta">
                        <i class="fa-solid fa-expand"></i> Expanded Ratio &nbsp;
                        <i class="fa-solid fa-volume-high"></i> 12-Channel Sound
                    </div>
                    <div class="screen-meta">
                        <i class="fa-solid fa-clock"></i> 2:30 PM &nbsp; 6:00 PM &nbsp; 9:45 PM
                    </div>
                    <asp:Button ID="btnFighter" runat="server" Text="Book Now" CssClass="btn-book-now" OnClick="btnBookNow_Click" CommandArgument="FIGHTER" />
                </div>
            </div>

            <!-- Screen 2: JAWAN -->
            <div class="screen-card">
                <img src="Images/neew12.png" alt="Jawan" />
                <div class="screen-info">
                    <span class="screen-badge">4DX</span>
                    <h4>JAWAN</h4>
                    <p>A driven man sets out to rectify the wrongs in society with the help of a team of skilled women.</p>
                    <div class="screen-meta">
                        <i class="fa-solid fa-user"></i> Vijay Sethupathi &nbsp;
                        <i class="fa-solid fa-volume-high"></i> Dolby Atmos
                    </div>
                    <div class="screen-meta">
                        <i class="fa-solid fa-clock"></i> 12:30 PM &nbsp; 4:00 PM &nbsp; 8:00 PM
                    </div>
                    <asp:Button ID="btnJawan" runat="server" Text="Book Now" CssClass="btn-book-now" OnClick="btnBookNow_Click" CommandArgument="JAWAN" />
                </div>
            </div>
        </div>
    </div>

    <!-- Uncompromised Comfort Section -->
    <div class="comfort-section">
        <div class="section-header" style="text-align: center;">
            <h2 class="section-title">Uncompromised Comfort</h2>
            <p class="section-sub">Every detail curated for the most luxurious cinematic experience.</p>
        </div>

        <div class="comfort-grid">
            <!-- Motorized Recliners -->
            <div class="comfort-card">
                <img src="Images/neew4.png" alt="Motorized Recliners" />
                <div class="comfort-info">
                    <div class="comfort-icon"><i class="fa-solid fa-couch"></i></div>
                    <h5>Motorized Recliners</h5>
                    <p>Fully adjustable plush leather seating with personalized temperature control and ample legroom.</p>
                </div>
            </div>

            <!-- Gourmet Dining -->
            <div class="comfort-card">
                <img src="Images/food.jpg" alt="Gourmet Dining" />
                <div class="comfort-info">
                    <div class="comfort-icon"><i class="fa-solid fa-utensils"></i></div>
                    <h5>Gourmet Dining</h5>
                    <p>In-seat service featuring artisanal snacks, popcorn, and refreshing beverages.</p>
                </div>
            </div>

            <!-- Private Lounges -->
            <div class="comfort-card">
                <img src="Images/alone.jpg" alt="Private Lounges" />
                <div class="comfort-info">
                    <div class="comfort-icon"><i class="fa-solid fa-door-open"></i></div>
                    <h5>Private Lounges</h5>
                    <p>Exclusive pre-show waiting areas with complimentary beverages.</p>
                </div>
            </div>

            <!-- Dual-Laser Projection -->
            <div class="comfort-card">
                <img src="Images/IMAX-inside-Cinepolis-scaled.jpg" alt="Dual-Laser Projection" />
                <div class="comfort-info">
                    <div class="comfort-icon"><i class="fa-solid fa-film"></i></div>
                    <h5>Dual-Laser Projection</h5>
                    <p>Unmatched brightness, contrast, and color accuracy for a flawless picture.</p>
                </div>
            </div>
        </div>
    </div>

</asp:Content>