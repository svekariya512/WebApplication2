<%@ Page Title="About" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="About111.aspx.cs" Inherits="WebApplication2.About111" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Hero Section --- */
        .hero-section {
            position: relative;
            background: linear-gradient(180deg, rgba(0,0,0,0.6) 0%, rgba(11,11,11,1) 100%), 
                        url('Images/neew13.png') center/cover no-repeat;
            height: 70vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            border-bottom: 1px solid #222;
        }

        .hero-title {
            font-size: 3rem;
            font-weight: 800;
            text-shadow: 2px 2px 20px rgba(0,0,0,0.9);
            color: #fff;
        }

        .hero-subtitle {
            font-size: 1.1rem;
            color: #ccc;
            max-width: 700px;
            margin: 15px auto 0;
            text-shadow: 1px 1px 10px rgba(0,0,0,0.9);
        }

        /* --- Our Story Section --- */
        .story-section {
            padding: 80px 0;
        }

        .story-title {
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 20px;
        }

        .story-text {
            color: #aaa;
            font-size: 1rem;
            line-height: 1.8;
        }

        .story-img {
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            height: 100%;
            object-fit: cover;
            width: 100%;
        }

        /* --- Quality Section --- */
        .quality-section {
            padding: 60px 0;
            text-align: center;
        }

        .quality-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .quality-sub {
            color: #888;
            margin-bottom: 40px;
        }

        .quality-card {
            background: #151515;
            border: 1px solid #222;
            border-radius: 12px;
            padding: 30px 20px;
            height: 100%;
            transition: all 0.4s ease;
        }

        .quality-card:hover {
            border-color: #ff2a2a;   /* પીચ કલર */
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(255, 195, 185, 0.15);
        }

        .quality-icon {
            font-size: 2.5rem;
            color: #FFC3B9;   /* પીચ કલર */
            margin-bottom: 15px;
        }

        .quality-card h5 {
            font-weight: 700;
            margin-bottom: 10px;
        }

        .quality-card p {
            color: #999;
            font-size: 0.9rem;
            margin-bottom: 0;
        }

        /* --- Theaters Section --- */
        .theaters-section {
            background: #0f0f0f;
            padding: 60px 0;
            border-top: 1px solid #1a1a1a;
            border-bottom: 1px solid #1a1a1a;
        }

        .theater-card {
            position: relative;
            border-radius: 12px;
            overflow: hidden;
            height: 350px;
            cursor: pointer;
            transition: transform 0.4s ease;
        }

        .theater-card:hover {
            transform: scale(1.02);
        }

        .theater-card img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s ease;
        }

        .theater-card:hover img {
            transform: scale(1.1);
        }

        .theater-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 25px;
            background: linear-gradient(0deg, rgba(0,0,0,0.95) 0%, rgba(0,0,0,0.4) 60%, transparent 100%);
            color: #fff;
        }

        .theater-overlay h4 {
            font-weight: 700;
            margin-bottom: 5px;
        }

        .theater-overlay p {
            color: #aaa;
            font-size: 0.9rem;
            margin-bottom: 10px;
        }

        .btn-view {
            border: 1px solid #FFC3B9;   /* પીચ કલર */
            color: #FFC3B9;              /* પીચ કલર */
            background: transparent;
            padding: 5px 15px;
            font-size: 0.8rem;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .btn-view:hover {
            background: #FFC3B9;         /* પીચ કલર */
            color: #000;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Section -->
    <div class="hero-section">
        <div class="container">
            <h1 class="hero-title">Redefining the Cinematic Experience</h1>
            <p class="hero-subtitle">
                Where cutting-edge technology meets unparalleled luxury. Step into a world where every screening is an event.
            </p>
        </div>
    </div>

    <!-- Our Story Section -->
    <div class="container story-section">
        <div class="row align-items-center g-5">
            <div class="col-md-6">
                <h2 class="story-title">Our Story</h2>
                <p class="story-text">
                    Founded in 2026, CinePulse started with a simple vision: to bring the magic of cinema back to the heart of the community. We believe that movies are more than just entertainment—they are experiences that bring people together.
                </p>
                <p class="story-text mt-3">
                    Today, our state-of-the-art venues are the proud home of the latest blockbusters, independent films, and everything in between. Join us and discover a new standard in cinematic excellence.
                </p>
            </div>
            <div class="col-md-6">
                <img src="https://images.unsplash.com/photo-1478720568477-152d9b164e26?auto=format&fit=crop&w=800&q=80" alt="Cinema Projector" class="story-img" />
            </div>
        </div>
    </div>

    <!-- Uncompromising Quality Section -->
    <div class="container quality-section">
        <h2 class="quality-title">Uncompromising Quality</h2>
        <p class="quality-sub">Experience the difference in every detail.</p>

        <div class="row g-4 justify-content-center">
            <!-- Card 1 -->
            <div class="col-md-4">
                <div class="quality-card">
                    <div class="quality-icon"><i class="fa-solid fa-volume-high"></i></div>
                    <h5>Dolby Atmos</h5>
                    <p>Sound that moves around you in three-dimensional space, creating an immersive audio experience.</p>
                </div>
            </div>

            <!-- Card 2 -->
            <div class="col-md-4">
                <div class="quality-card">
                    <div class="quality-icon"><i class="fa-solid fa-couch"></i></div>
                    <h5>Luxury Recliners</h5>
                    <p>Relax in our plush, full-recline seats with extra legroom, designed for maximum comfort during long films.</p>
                </div>
            </div>

            <!-- Card 3 -->
            <div class="col-md-4">
                <div class="quality-card">
                    <div class="quality-icon"><i class="fa-solid fa-film"></i></div>
                    <h5>IMAX with Laser</h5>
                    <p>Crystal-clear, larger-than-life images with unparalleled brightness and color accuracy.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Our Theaters Section -->
    <div class="theaters-section">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <div>
                    <h3 class="fw-bold mb-1">Our Theaters</h3>
                    <small class="text-secondary">Find your perfect cinematic experience near you.</small>
                </div>
                <asp:Button ID="btnViewAll" runat="server" Text="View All →" CssClass="btn btn-view" OnClick="btnViewAll_Click" />
            </div>

            <div class="row g-4">
                <!-- Theater 1 -->
                <div class="col-md-6">
                    <div class="theater-card">
                        <img src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?auto=format&fit=crop&w=800&q=80" alt="CinePulse Downtown" />
                        <div class="theater-overlay">
                            <h4>CinePulse Downtown</h4>
                            <p>123 Main Street, City Center</p>
                            <asp:Button ID="btnTheater1" runat="server" Text="View Details" CssClass="btn btn-view" OnClick="btnTheater_Click" CommandArgument="Downtown" />
                        </div>
                    </div>
                </div>

                <!-- Theater 2 -->
                <div class="col-md-6">
                    <div class="theater-card">
                        <img src="https://images.unsplash.com/photo-1595769816263-9b910be24d5f?auto=format&fit=crop&w=800&q=80" alt="CinePulse Westside" />
                        <div class="theater-overlay">
                            <h4>CinePulse Westside</h4>
                            <p>456 Oak Avenue, West Mall</p>
                            <asp:Button ID="btnTheater2" runat="server" Text="View Details" CssClass="btn btn-view" OnClick="btnTheater_Click" CommandArgument="Westside" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>