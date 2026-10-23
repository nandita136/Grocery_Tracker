<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="meal-planner.aspx.cs" Inherits="Grocery.meal_planner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<main>
    <section class="hero">
        <div class="container hero-grid">
            <div>
                <div class="eyebrow">
                    Fresh planning, less waste</div>
                    Fresh planning, less waste</div>
                <h1>Plan Meals.<br>Track Groceries.<br>Save Time.</h1>
                <p>
                    Plan your weekly meals, automatically generate grocery suggestions, manage your shopping alist, and organize special meals in one simple application.</p>
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
        <title>Meal Planner | Grocery Tracker</title>
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
                    <h1>Meal Planner</h1>
                    <div class="profile-chip"><span data-user-name>User</span><span class="avatar"><i class="fa-solid fa-user"></i></span></div>
                </header>
                <section class="content">
                    <!-- Header Section -->
                    <div class="modern-planner-header">
                        <div>
                            <h1>Weekly Meal Planner</h1>
                            <p id="week-range">August 2026 · Week 1</p>
                        </div>
                        <asp:Button ID="btnGenerateGrocery" runat="server" Text="Generate Grocery List"
                            CssClass="btn-generate" PostBackUrl="~/grocery-suggestions.aspx" />
                    </div>

                    <div class="people-selector-card">
                        <div class="people-label">
                            <i class="fa-solid fa-users"></i>
                            <span>Number of People</span>
                        </div>
                        <div class="people-buttons">
                            <button type="button" class="people-btn" onclick="selectPeople(1, this)">1</button>
                            <button type="button" class="people-btn active" onclick="selectPeople(2, this)">2</button>
                            <button type="button" class="people-btn" onclick="selectPeople(3, this)">3</button>
                            <button type="button" class="people-btn" onclick="selectPeople(4, this)">4</button>
                            <button type="button" class="people-btn" onclick="selectPeople(5, this)">5</button>
                            <button type="button" class="people-btn" id="custom-btn" onclick="selectPeople('custom', this)">Custom</button>
                            <input type="number" id="custom-people-input" class="custom-people-input" placeholder="e.g. 12" min="1" style="display: none;">
                        </div>
                        <div class="people-info">
                            Ingredients auto-calculated for <strong id="people-count">2 people</strong>
                        </div>
                    </div>

                    <!-- Meal Planner Grid (3 columns) -->
                    <div class="modern-meal-grid">
                        <!-- Monday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Monday</h3>
                                <span class="day-date">04 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlMondayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Poha" Value="Poha"></asp:ListItem>
                                    <asp:ListItem Text="Upma" Value="Upma"></asp:ListItem>
                                    <asp:ListItem Text="Paratha" Value="Paratha"></asp:ListItem>
                                    <asp:ListItem Text="Idli Sambar" Value="Idli Sambar"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlMondayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Paneer Butter Masala + Rice" Value="Paneer Butter Masala + Rice"></asp:ListItem>
                                    <asp:ListItem Text="Dal Tadka + Roti" Value="Dal Tadka + Roti"></asp:ListItem>
                                    <asp:ListItem Text="Rajma Chawal" Value="Rajma Chawal"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlMondayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Palak Paneer + Naan" Value="Palak Paneer + Naan"></asp:ListItem>
                                    <asp:ListItem Text="Mixed Veg Curry + Rice" Value="Mixed Veg Curry + Rice"></asp:ListItem>
                                    <asp:ListItem Text="Chicken Curry + Roti" Value="Chicken Curry + Roti"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Tuesday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Tuesday</h3>
                                <span class="day-date">05 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlTuesdayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Upma" Value="Upma"></asp:ListItem>
                                    <asp:ListItem Text="Poha" Value="Poha"></asp:ListItem>
                                    <asp:ListItem Text="Paratha" Value="Paratha"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlTuesdayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Dal Tadka + Roti" Value="Dal Tadka + Roti"></asp:ListItem>
                                    <asp:ListItem Text="Paneer Butter Masala + Rice" Value="Paneer Butter Masala + Rice"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlTuesdayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Mixed Veg Curry + Rice" Value="Mixed Veg Curry + Rice"></asp:ListItem>
                                    <asp:ListItem Text="Palak Paneer + Naan" Value="Palak Paneer + Naan"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Wednesday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Wednesday</h3>
                                <span class="day-date">06 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlWednesdayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Paratha" Value="Paratha"></asp:ListItem>
                                    <asp:ListItem Text="Poha" Value="Poha"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlWednesdayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Rajma Chawal" Value="Rajma Chawal"></asp:ListItem>
                                    <asp:ListItem Text="Dal Tadka + Roti" Value="Dal Tadka + Roti"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlWednesdayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Chicken Curry + Roti" Value="Chicken Curry + Roti"></asp:ListItem>
                                    <asp:ListItem Text="Mixed Veg Curry + Rice" Value="Mixed Veg Curry + Rice"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Thursday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Thursday</h3>
                                <span class="day-date">07 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlThursdayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Idli Sambar" Value="Idli Sambar"></asp:ListItem>
                                    <asp:ListItem Text="Poha" Value="Poha"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlThursdayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Vegetable Pulao" Value="Vegetable Pulao"></asp:ListItem>
                                    <asp:ListItem Text="Dal Tadka" Value="Dal Tadka"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlThursdayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Paneer Butter Masala" Value="Paneer Butter Masala"></asp:ListItem>
                                    <asp:ListItem Text="Palak Paneer" Value="Palak Paneer"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Friday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Friday</h3>
                                <span class="day-date">08 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlFridayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Masala Dosa" Value="Masala Dosa"></asp:ListItem>
                                    <asp:ListItem Text="Upma" Value="Upma"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlFridayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Rajma Rice" Value="Rajma Rice"></asp:ListItem>
                                    <asp:ListItem Text="Vegetable Pulao" Value="Vegetable Pulao"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlFridayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Veg Biryani" Value="Veg Biryani"></asp:ListItem>
                                    <asp:ListItem Text="Chole" Value="Chole"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Saturday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Saturday</h3>
                                <span class="day-date">09 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlSaturdayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Aloo Paratha" Value="Aloo Paratha"></asp:ListItem>
                                    <asp:ListItem Text="Poha" Value="Poha"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlSaturdayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Kadhai Paneer" Value="Kadhai Paneer"></asp:ListItem>
                                    <asp:ListItem Text="Dal Tadka" Value="Dal Tadka"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlSaturdayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Fish Curry" Value="Fish Curry"></asp:ListItem>
                                    <asp:ListItem Text="Paneer Tikka" Value="Paneer Tikka"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <!-- Sunday -->
                        <div class="day-card">
                            <div class="day-header">
                                <h3>Sunday</h3>
                                <span class="day-date">10 Aug</span>
                            </div>
                            <div class="meal-section">
                                <label>Breakfast</label>
                                <asp:DropDownList ID="ddlSundayBreakfast" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Poori Bhaji" Value="Poori Bhaji"></asp:ListItem>
                                    <asp:ListItem Text="Idli Sambar" Value="Idli Sambar"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Lunch</label>
                                <asp:DropDownList ID="ddlSundayLunch" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Veg Pulao" Value="Veg Pulao"></asp:ListItem>
                                    <asp:ListItem Text="Rajma Chawal" Value="Rajma Chawal"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="meal-section">
                                <label>Dinner</label>
                                <asp:DropDownList ID="ddlSundayDinner" runat="server" CssClass="meal-dropdown">
                                    <asp:ListItem Text="Butter Chicken" Value="Butter Chicken"></asp:ListItem>
                                    <asp:ListItem Text="Paneer Tikka" Value="Paneer Tikka"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/meal-planner.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Meal Planner'); initMealPlanner();</script>

        <script>
            function selectPeople(count, clickedBtn) {
                // Remove active class from all buttons
                document.querySelectorAll('.people-btn').forEach(btn => {
                    btn.classList.remove('active');
                });

                // Add active class to clicked button
                if (clickedBtn) {
                    clickedBtn.classList.add('active');
                }

                const customInput = document.getElementById('custom-people-input');
                const countText = document.getElementById('people-count');

                if (count === 'custom') {
                    // Show the custom input field
                    customInput.style.display = 'block';
                    customInput.focus();
                    countText.textContent = 'custom';

                    // Update count when user types in the custom input
                    customInput.oninput = function () {
                        const value = this.value;
                        if (value && parseInt(value) > 0) {
                            countText.textContent = value + ' people';
                        } else {
                            countText.textContent = 'custom';
                        }
                    };
                } else {
                    // Hide the custom input field
                    customInput.style.display = 'none';
                    customInput.value = '';
                    countText.textContent = count + ' people';
                }
            }
        </script>
    </body>
    </html>
</asp:Content>

