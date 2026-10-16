<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="grocery-list.aspx.cs" Inherits="Grocery.grocery_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btnAddItem, #btnSaveGroceryList { background: var(--light) !important; color: var(--dark) !important; border: 1px solid var(--border) !important; opacity: 1; }
        #btnAddItem:hover, #btnSaveGroceryList:hover { background: #d8eee0 !important; color: var(--dark) !important; }
        #btnOrderOnline { background: var(--green) !important; color: #fff !important; border: 1px solid var(--green) !important; opacity: 1; }
        #btnOrderOnline:hover { background: var(--dark) !important; color: #fff !important; border-color: var(--dark) !important; }
        #grocery-body .btn-secondary { background: var(--light) !important; color: var(--dark) !important; border: 1px solid var(--border) !important; opacity: 1; }
        #grocery-body .btn-danger { background: #fee2e2 !important; color: var(--red) !important; border: 1px solid #fecaca !important; opacity: 1; }
    </style>
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
        <title>Grocery List | Grocery Tracker</title>
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
                    <h1>Grocery List</h1>
                    <div class="profile-chip"><span data-user-name>User</span><span class="avatar"><i class="fa-solid fa-user"></i></span></div>
                </header>
                <section class="content">
                    <div class="inline">
                        <div>
                            <p class="eyebrow">Your shopping companion</p>
                            <h2>Keep the list moving</h2>
                        </div>
                        <div class="actions">
                            <asp:Button ID="btnAddItem" runat="server" Text="Add Item" CssClass="btn btn-secondary" OnClientClick="showGroceryModal(); return false;" ClientIDMode="Static" />
                            <asp:Button ID="btnSaveGroceryList" runat="server" Text="Save" CssClass="btn btn-secondary" ClientIDMode="Static" OnClientClick="return false;" />
                            <asp:Button ID="btnOrderOnline" runat="server" Text="Blinkit" CssClass="btn btn-primary" ClientIDMode="Static" OnClientClick="return false;" />
                        </div>
                    </div>
                    <div class="toolbar">
                        <asp:TextBox ID="grocery_search" runat="server" placeholder="Search grocery items" ClientIDMode="Static"></asp:TextBox>
                        <asp:DropDownList ID="grocery_category" runat="server" ClientIDMode="Static">
                            <asp:ListItem Text="All categories" Value=""></asp:ListItem>
                            <asp:ListItem Value="Vegetables">Vegetables</asp:ListItem>
                            <asp:ListItem Value="Fruits">Fruits</asp:ListItem>
                            <asp:ListItem Value="Dairy">Dairy</asp:ListItem>
                            <asp:ListItem Value="Grains">Grains</asp:ListItem>
                            <asp:ListItem Value="Protein">Protein</asp:ListItem>
                            <asp:ListItem Value="Spices">Spices</asp:ListItem>
                            <asp:ListItem Value="Other">Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="card table-wrap">
                        <table class="data-table">
                            <thead>
                                <tr>
                                    <th>Grocery Item</th>
                                    <th>Quantity</th>
                                    <th>Category</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="grocery-body"></tbody>
                        </table>
                    </div>
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/grocery-list.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Grocery List'); initGroceryList();</script>
    </body>
    </html>
</asp:Content>
