<%@ Page Title="" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Movies111.aspx.cs" Inherits="WebApplication2.WebForm4" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Page Header --- */
        .page-header {
            padding: 30px 0 10px;
        }
        .page-title {
            font-size: 2.2rem;
            font-weight: 800;
            margin-bottom: 5px;
        }
        .page-sub {
            color: #888;
            font-size: 0.95rem;
        }

        /* --- Filters --- */
        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            margin: 25px 0;
        }

        .filter-pills {
            display: flex;
            gap: 10px;
            flex-wrap: wrap;
        }

        .pill {
            background: #1a1a1a;
            color: #ccc;
            border: 1px solid #2a2a2a;
            border-radius: 25px;
            padding: 6px 18px;
            font-size: 0.85rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .pill:hover {
            border-color: #3471cf;
            color: #fff;
        }
        .pill.active {
            background: #3471cf;
            color: #fff;
            border-color: #3471cf;
        }

        .filter-selects {
            display: flex;
            gap: 10px;
        }
        .filter-select {
            background: #1a1a1a;
            color: #ccc;
            border: 1px solid #2a2a2a;
            border-radius: 6px;
            padding: 6px 15px;
            font-size: 0.85rem;
            cursor: pointer;
        }
        .filter-select:focus {
            outline: none;
            border-color: #3471cf;
        }

        /* --- Search Bar --- */
        .search-bar {
            position: relative;
            max-width: 400px;
            margin-bottom: 30px;
        }
        .search-bar input {
            width: 100%;
            background: #1a1a1a;
            border: 1px solid #2a2a2a;
            border-radius: 8px;
            padding: 10px 40px 10px 15px;
            color: #fff;
            font-size: 0.9rem;
            transition: border 0.3s ease;
        }
        .search-bar input:focus {
            outline: none;
            border-color: #3471cf;
        }
        .search-bar i {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #666;
        }

        /* --- Movie Cards --- */
        .movie-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin-bottom: 60px;
        }
        @media (max-width: 992px) {
            .movie-grid { grid-template-columns: repeat(2, 1fr); }
        }
        @media (max-width: 576px) {
            .movie-grid { grid-template-columns: 1fr; }
        }

        .movie-card {
            background: #151515;
            border: 1px solid #222;
            border-radius: 12px;
            overflow: hidden;
            transition: all 0.4s ease;
            position: relative;
        }
        .movie-card:hover {
            transform: translateY(-8px);
            border-color: #3471cf;
            box-shadow: 0 15px 30px rgba(52, 113, 207, 0.15);
        }

        .movie-poster-wrap {
            position: relative;
            height: 320px;
            overflow: hidden;
        }
        .movie-poster-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .movie-card:hover .movie-poster-wrap img {
            transform: scale(1.08);
        }

        .movie-lang-badge {
            position: absolute;
            top: 10px;
            left: 10px;
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            font-size: 0.65rem;
            font-weight: 600;
            padding: 3px 8px;
            border-radius: 4px;
            letter-spacing: 0.5px;
        }

        .movie-heart {
            position: absolute;
            top: 10px;
            right: 10px;
            color: #fff;
            font-size: 0.9rem;
            cursor: pointer;
            opacity: 0.7;
            transition: all 0.3s ease;
        }
        .movie-heart:hover {
            opacity: 1;
            color: #e50914;
            transform: scale(1.2);
        }

        .movie-info {
            padding: 15px;
        }
        .movie-title {
            font-size: 1rem;
            font-weight: 700;
            margin-bottom: 3px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        .movie-rating {
            color: #f5c518;
            font-size: 0.8rem;
            font-weight: 600;
            margin-bottom: 12px;
        }

        .btn-book {
            background: #e50914;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 8px;
            font-size: 0.85rem;
            font-weight: 600;
            width: 100%;
            transition: all 0.3s ease;
        }
        .btn-book:hover {
            background: #b80710;
            box-shadow: 0 4px 12px rgba(229, 9, 20, 0.4);
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Header -->
    <div class="container page-header">
        <h1 class="page-title">Now Showing</h1>
        <p class="page-sub">Discover the latest blockbusters and critically acclaimed films.</p>
    </div>

    <div class="container">
        <!-- Filters -->
        <div class="filter-bar">
            <div class="filter-pills">
                <span class="pill active">All Movies</span>
                <span class="pill">Hindi</span>
                <span class="pill">Gujarati</span>
                <span class="pill">English</span>
            </div>
            <div class="filter-selects">
                <select class="filter-select">
                    <option>All Genres</option>
                    <option>Action</option>
                    <option>Comedy</option>
                    <option>Drama</option>
                    <option>Horror</option>
                </select>
                <select class="filter-select">
                    <option>Format</option>
                    <option>2D</option>
                    <option>3D</option>
                    <option>IMAX</option>
                </select>
            </div>
        </div>

        <!-- Search -->
        <div class="search-bar">
            <input type="text" placeholder="Search movies..." />
            <i class="fa-solid fa-magnifying-glass"></i>
        </div>

        <!-- Movie Grid -->
        <div class="movie-grid">

            <!-- Movie 1 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=400&q=80" alt="Jhamkudi" />
                    <span class="movie-lang-badge">GUJARATI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Jhamkudi</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 9.5/10</div>
                    <asp:Button ID="btnMovie1" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Jhamkudi" />
                </div>
            </div>

            <!-- Movie 2 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1509248961158-e54f6934749c?auto=format&fit=crop&w=400&q=80" alt="Stree 2" />
                    <span class="movie-lang-badge">HINDI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Stree 2</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 8.2/10</div>
                    <asp:Button ID="btnMovie2" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Stree 2" />
                </div>
            </div>

            <!-- Movie 3 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=400&q=80" alt="Ialo" />
                    <span class="movie-lang-badge">GUJARATI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Ialo</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 8.0/10</div>
                    <asp:Button ID="btnMovie3" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Ialo" />
                </div>
            </div>

            <!-- Movie 4 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1578632767115-351597cf2477?auto=format&fit=crop&w=400&q=80" alt="Satyameva Jayate 2" />
                    <span class="movie-lang-badge">HINDI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Satyameva Jayate 2</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 8.5/10</div>
                    <asp:Button ID="btnMovie4" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Satyameva Jayate 2" />
                </div>
            </div>

            <!-- Movie 5 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1536440136628-849c177e76a1?auto=format&fit=crop&w=400&q=80" alt="Jungle Heart" />
                    <span class="movie-lang-badge">HINDI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Jungle Heart</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 9.0/10</div>
                    <asp:Button ID="btnMovie5" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Jungle Heart" />
                </div>
            </div>

            <!-- Movie 6 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1518709268805-4e9042af9f23?auto=format&fit=crop&w=400&q=80" alt="Void" />
                    <span class="movie-lang-badge">ENGLISH</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Void</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 8.8/10</div>
                    <asp:Button ID="btnMovie6" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Void" />
                </div>
            </div>

            <!-- Movie 7 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1578632767115-351597cf2477?auto=format&fit=crop&w=400&q=80" alt="Koh-i-noor" />
                    <span class="movie-lang-badge">HINDI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">Koh-i-noor</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 8.0/10</div>
                    <asp:Button ID="btnMovie7" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="Koh-i-noor" />
                </div>
            </div>

            <!-- Movie 8 -->
            <div class="movie-card">
                <div class="movie-poster-wrap">
                    <img src="https://images.unsplash.com/photo-1534447677768-be436bb09401?auto=format&fit=crop&w=400&q=80" alt="CHHAAVA" />
                    <span class="movie-lang-badge">HINDI</span>
                    <i class="fa-solid fa-heart movie-heart"></i>
                </div>
                <div class="movie-info">
                    <div class="movie-title">CHHAAVA</div>
                    <div class="movie-rating"><i class="fa-solid fa-star"></i> 9.2/10</div>
                    <asp:Button ID="btnMovie8" runat="server" Text="Book Now" CssClass="btn btn-book" OnClick="btnMovie_Click" CommandArgument="CHHAAVA" />
                </div>
            </div>

        </div>
    </div>

</asp:Content>