<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="admin-special-meals.aspx.cs" Inherits="Grocery.admin_special" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
        <title>Special Requests | Grocery Tracker Admin</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/dashboard.css">
        <link rel="stylesheet" href="css/admin.css">
    </head>
    <body>
        <div class="app-shell admin-shell">
            <main class="main-area">
                <header class="topbar">
                    <h1>Special Meal Requests</h1>
                    <div class="profile-chip">Administrator <span class="avatar"><i class="fa-solid fa-shield-halved"></i></span></div>
                </header>
                <section class="content">
                    <div class="toolbar">
                        <select id="request-filter">
                            <option value="">All statuses</option>
                            <option>Pending</option>
                            <option>Accepted</option>
                            <option>Rejected</option>
                        </select></div>
                    <div class="card table-wrap">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>User</th>
                                    <th>Occasion</th>
                                    <th>People</th>
                                    <th>Meal Request</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="admin-request-body"></tbody>
                        </table>
                    </div>
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/admin-special-meals.js"></script>
        <script>protectAdminPage(); setupAppShell(true, 'Special Meal Requests'); initAdminRequests();</script>
    </body>
    </html>
</asp:Content>

