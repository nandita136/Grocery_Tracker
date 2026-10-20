<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="special-meals.aspx.cs" Inherits="Grocery.special_meals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btnRequestMeal { background: var(--green) !important; color: #fff !important; border: 1px solid var(--green) !important; opacity: 1; }
        #btnRequestMeal:hover { background: var(--dark) !important; color: #fff !important; border-color: var(--dark) !important; }
    </style>
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
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Special Meals | Grocery Tracker</title>
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
                    <h1>Special Meals</h1>
                    <div class="profile-chip"><span data-user-name>User</span><span class="avatar"><i class="fa-solid fa-user"></i></span></div>
                </header>
                <section class="content">
                    <div class="welcome">
                        <p class="eyebrow">A little extra occasion</p>
                        <h2>Plan a meal worth gathering for</h2>
                        <p class="muted">Choose an occasion and meal. Quantities scale automatically.</p>
                    </div>
                    <div class="card">
                        <div class="toolbar">
                            <div class="form-group" style="flex: 1">
                                <asp:Label ID="lblOccasion" runat="server" Text="Occasion Type" AssociatedControlID="occasion"></asp:Label>
                                <asp:DropDownList ID="occasion" runat="server" ClientIDMode="Static">
                                    <asp:ListItem>Birthday Party</asp:ListItem>
                                    <asp:ListItem>Family Gathering</asp:ListItem>
                                    <asp:ListItem>Festival Celebration</asp:ListItem>
                                    <asp:ListItem>Office Lunch</asp:ListItem>
                                    <asp:ListItem>Wedding Function</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <h3>Select Meal</h3>
                        <div id="meal-options" class="feature-grid" style="grid-template-columns: repeat(3,1fr)"></div>
                        <div class="form-group" style="width: 180px; margin-top: 20px">
                            <asp:Label ID="lblPeople" runat="server" Text="People" AssociatedControlID="people"></asp:Label>
                            <asp:DropDownList ID="people" runat="server" ClientIDMode="Static">
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>6</asp:ListItem>
                                <asp:ListItem>8</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>15</asp:ListItem>
                                <asp:ListItem>20</asp:ListItem>
                                <asp:ListItem Value="custom">Custom</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="custom_people" runat="server" TextMode="Number" placeholder="Number" ClientIDMode="Static" style="display: none; margin-top: 8px; width: 100%; padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px"></asp:TextBox>
                        </div>
                        <asp:Button ID="generate_special" runat="server" Text="Generate Grocery List" CssClass="btn btn-primary" Style="margin-top: 20px" ClientIDMode="Static" OnClientClick="return false;" />
                    </div>
                    <div id="special-result" style="margin-top: 20px"></div>
                    <div class="card" style="margin-top: 20px">
                        <h2>Can't Find Your Meal? Request a Meal</h2>
                        <div class="toolbar">
                            <div class="form-group" style="flex: 1; min-width: 160px">
                                <asp:Label ID="lblRequestOccasion" runat="server" Text="Occasion Type" AssociatedControlID="request_occasion"></asp:Label>
                                <asp:DropDownList ID="request_occasion" runat="server" ClientIDMode="Static">
                                    <asp:ListItem>Birthday Party</asp:ListItem>
                                    <asp:ListItem>Family Gathering</asp:ListItem>
                                    <asp:ListItem>Festival Celebration</asp:ListItem>
                                    <asp:ListItem>Office Lunch</asp:ListItem>
                                    <asp:ListItem>Wedding Function</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group" style="flex: 1; min-width: 160px">
                                <asp:Label ID="lblRequestPeople" runat="server" Text="Number of People" AssociatedControlID="request_people"></asp:Label>
                                <asp:DropDownList ID="request_people" runat="server" ClientIDMode="Static">
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem Value="custom">Custom</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="request_custom_people" runat="server" TextMode="Number" placeholder="Number" ClientIDMode="Static" style="display: none; margin-top: 8px; width: 100%; padding: 9px; border: 1px solid #cfe1d5; border-radius: 8px"></asp:TextBox>
                            </div>
                            <asp:TextBox ID="meal_request" runat="server" placeholder="Enter meal or dish name" ClientIDMode="Static"></asp:TextBox>
                            <asp:Button ID="btnRequestMeal" runat="server" Text="Request" CssClass="btn btn-primary" ClientIDMode="Static" OnClientClick="return false;" />
                        </div>
                    </div>
                    <h2 style="margin-top: 30px">Your Request Status</h2>
                    <div class="card table-wrap">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Occasion</th>
                                    <th>People</th>
                                    <th>Meals</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody id="request-body"></tbody>
                        </table>
                    </div>
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/grocery-suggestions.js"></script>
        <script src="js/special-meals.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Special Meals'); initSpecialMeals();</script>
    </body>
    </html>
</asp:Content>
