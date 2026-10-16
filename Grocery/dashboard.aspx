<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="Grocery.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                        <h2 data-welcome>Welcome back!</h2>
                        <p class="muted" id="plan-date">Your weekly plan at a glance.</p>
                    </div>
                    <div class="stat-grid">
                        <div class="card stat-card">
                            <div><span class="muted">Planned Meals</span><strong id="planned-count">0</strong></div>
                            <i class="fa-solid fa-calendar-check"></i></div>
                        <div class="card stat-card">
                            <div><span class="muted">Grocery Items</span><strong id="grocery-count">0</strong></div>
                            <i class="fa-solid fa-basket-shopping"></i></div>
                        <div class="card stat-card">
                            <div><span class="muted">Special Requests</span><strong id="request-count">0</strong></div>
                            <i class="fa-solid fa-cake-candles"></i></div>
                    </div>
                    <div class="inline">
                        <h2>Weekly meal summary</h2>
                        <a class="btn btn-secondary" href="meal-planner.aspx">Edit plan</a></div>
                    <div id="week-grid" class="week-grid"></div>
                    <h2 style="margin-top: 30px">Quick actions</h2>
                    <div class="quick-grid"><a class="card quick-card" href="meal-planner.aspx"><i class="fa-solid fa-calendar-days"></i>
                        <h3>Meal Planner</h3>
                        <p class="muted small">Plan your week</p>
                    </a><a class="card quick-card" href="grocery-suggestions.aspx"><i class="fa-solid fa-wand-magic-sparkles"></i>
                        <h3>Suggestions</h3>
                        <p class="muted small">Generate ingredients</p>
                    </a><a class="card quick-card" href="grocery-list.aspx"><i class="fa-solid fa-basket-shopping"></i>
                        <h3>Grocery List</h3>
                        <p class="muted small">Manage your shopping</p>
                    </a><a class="card quick-card" href="special-meals.aspx"><i class="fa-solid fa-cake-candles"></i>
                        <h3>Special Meals</h3>
                        <p class="muted small">Plan an occasion</p>
                    </a></div>
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

