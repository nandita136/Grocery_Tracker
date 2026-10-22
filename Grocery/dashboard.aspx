<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Grocery.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Load dashboard specific CSS -->
    <link rel="stylesheet" href="css/dashboard.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<main>
    <section class="hero">
        <div class="container hero-grid">
            <div>
                <div class="eyebrow">
                    Fresh planning, less waste</div>
                <h1>Plan Meals.<br>Track Groceries.<br>Save Time.</h1>
                <p>
                    Plan your weekly meals, automatically generate grocery suggestions, manage your shopping list, and organize special meals in one simple application.</p>
                <div class="actions">
                    <a class="btn btn-primary" href="register.aspx">Get Started Free <i class="fa-solid fa-arrow-right"></i></a><a class="btn btn-secondary" href="login.aspx">Login</a></div>
            </div>
            <div class="hero-art" aria-label="Fresh grocery illustration">
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="section-head">
                <div class="eyebrow">
                    Everything in one place</div>
                <h2>Your kitchen, a little more organized</h2>
                <p>
                    Turn a handful of meal ideas into a calm, confident shopping routine.</p>
            </div>
            <div class="feature-grid">
                <article class="card feature-card">
                    <i class="fa-solid fa-calendar-days"></i>
                    <h3>Weekly Meal Planning</h3>
                    <p>
                        Map breakfast, lunch and dinner across your week.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-wand-magic-sparkles"></i>
                    <h3>Grocery Suggestions</h3>
                    <p>
                        Let your meal choices build an ingredient list.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-basket-shopping"></i>
                    <h3>Grocery Management</h3>
                    <p>
                        Add, edit and check off what you need.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-cake-candles"></i>
                    <h3>Special Meals</h3>
                    <p>
                        Scale recipes for celebrations and gatherings.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-chart-line"></i>
                    <h3>Easy Tracking</h3>
                    <p>
                        See your plans, lists and requests at a glance.</p>
                </article>
            </div>
        </div>
    </section>
    <section class="section about-band">
        <div class="container hero-grid">
            <div>
                <div class="eyebrow">
                    About Grocery Tracker</div>
                <h2>Good food starts with a good plan.</h2>
                <p class="muted">
                    Grocery Tracker is a practical meal planning companion for students and busy households. It keeps your recipes, shopping list and special occasions connected, using your browser for private, persistent storage.</p>
                <a class="btn btn-secondary" href="about.aspx">Learn more <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="card">
                <h3><i class="fa-solid fa-seedling" style="color: var(--green)"></i>Built for everyday decisions</h3>
                <p class="muted">
                    Choose meals, adjust servings and let the quantities do the arithmetic. Less mental load, fewer forgotten ingredients.</p>
            </div>
        </div>
    </section>
    </main>--%>
    <!doctype html>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Dashboard | Grocery Tracker</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/dashboard.css">
    </head>
    <body>
        <div class="app-shell">
            <main class="main-area">
                <header class="topbar">
                    <h1>Dashboard</h1>
                    <div class="profile-chip"><span data-user-name>User</span><span class="avatar"><i class="fa-solid fa-user"></i></span></div>
                </header>
                <section class="content">
                        <div class="welcome">
                            <div class="welcome-greeting">Welcome back,</div>
                            <h2 data-welcome>Priyesha Chauhan</h2>
                            <p id="plan-date">You have 3 meals planned for today.</p>
                        </div>
                        <div class="stats-container">
                        <!-- Card 1: Meals This Week -->
                        <div class="stat-card-modern">
                            <div class="stat-icon-wrapper bg-green-light">
                                <i class="fa-regular fa-calendar text-green"></i>
                            </div>
                            <div class="stat-info">
                                <strong id="planned-count">21</strong>
                                <span>Meals This Week</span>
                            </div>
                        </div>
    
                        <!-- Card 2: Grocery Items -->
                        <div class="stat-card-modern">
                            <div class="stat-icon-wrapper bg-blue-light">
                                <i class="fa-solid fa-cart-shopping text-blue"></i>
                            </div>
                            <div class="stat-info">
                                <strong id="grocery-count">34</strong>
                                <span>Grocery Items</span>
                            </div>
                        </div>
                    </div>
                   <!-- Weekly Meal Summary Section -->
                    <div style="background: #fff; border-radius: 16px; padding: 24px; margin-bottom: 30px; border: 1px solid var(--border);">
                        <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                            <h2 style="font-family: Quicksand, sans-serif; font-size: 1.5rem; font-weight: 800; color: var(--dark); margin: 0;">Weekly Meal Summary</h2>
                            <a href="meal-planner.aspx" style="color: var(--green); font-weight: 700; text-decoration: none; display: flex; align-items: center; gap: 4px;">
                                View Planner <i class="fa-solid fa-arrow-right" style="font-size: 0.8rem;"></i>
                            </a>
                        </div>
                        <div id="week-summary-container" class="week-summary-grid">
                            <!-- Weekly meal cards will be injected here -->
                        </div>
                    </div>

                    <!-- Quick Actions Section -->
                    <h2 style="margin-top: 30px; font-family: Quicksand, sans-serif; color: var(--dark);">Quick actions</h2>
                    <div class="quick-grid">
                        <a class="quick-card-modern" href="meal-planner.aspx">
                            <div class="quick-card-icon" style="background: #f0fdf4;">
                                <i class="fa-solid fa-calendar-days" style="color: #16a34a;"></i>
                            </div>
                            <h3 style="font-family: Quicksand, sans-serif; font-size: 1rem; font-weight: 800; color: var(--dark); margin: 12px 0 4px 0;">Meal Planner</h3>
                            <p class="muted small" style="margin: 0; font-size: 0.85rem;">Plan your week</p>
                        </a>
    
                        <a class="quick-card-modern" href="grocery-suggestions.aspx">
                            <div class="quick-card-icon" style="background: #f0fdf4;">
                                <i class="fa-solid fa-wand-magic-sparkles" style="color: #16a34a;"></i>
                            </div>
                            <h3 style="font-family: Quicksand, sans-serif; font-size: 1rem; font-weight: 800; color: var(--dark); margin: 12px 0 4px 0;">Suggestions</h3>
                            <p class="muted small" style="margin: 0; font-size: 0.85rem;">Generate ingredients</p>
                        </a>
    
                        <a class="quick-card-modern" href="grocery-list.aspx">
                            <div class="quick-card-icon" style="background: #f0fdf4;">
                                <i class="fa-solid fa-basket-shopping" style="color: #16a34a;"></i>
                            </div>
                            <h3 style="font-family: Quicksand, sans-serif; font-size: 1rem; font-weight: 800; color: var(--dark); margin: 12px 0 4px 0;">Grocery List</h3>
                            <p class="muted small" style="margin: 0; font-size: 0.85rem;">Manage your shopping</p>
                        </a>
    
                        <a class="quick-card-modern" href="special-meals.aspx">
                            <div class="quick-card-icon" style="background: #f0fdf4;">
                                <i class="fa-solid fa-cake-candles" style="color: #16a34a;"></i>
                            </div>
                            <h3 style="font-family: Quicksand, sans-serif; font-size: 1rem; font-weight: 800; color: var(--dark); margin: 12px 0 4px 0;">Special Meals</h3>
                            <p class="muted small" style="margin: 0; font-size: 0.85rem;">Plan an occasion</p>
                        </a>
                    </div>
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/dashboard.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Dashboard'); renderDashboard();</script>
    </body>
    </html>
</asp:Content>

