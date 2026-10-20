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
                    <div class="inline">
                        <div>
                            <h2>Weekly Meal Planner</h2>
                        </div>
                        <div class="form-group" style="min-width: 150px">
                            <asp:Label ID="Label2" runat="server" Text="Number of Peoples"></asp:Label>
                            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                <asp:ListItem Text="Select People" Value=""></asp:ListItem>
                                <asp:ListItem>1</asp:ListItem>
                                <asp:ListItem>2</asp:ListItem>
                                <asp:ListItem>3</asp:ListItem>
                                <asp:ListItem>4</asp:ListItem>
                                <asp:ListItem>5</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Label ID="Label1" runat="server" Text="Custom"></asp:Label>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </div>
                    </div>
                    <div class="meal-planner-grid">

                        <div class="card day-editor">
                            <h3>Monday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label3" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlMondayBreakfast" runat="server">
                                    <asp:ListItem Text="Select Breakfast" Value=""></asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label4" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlMondayLunch" runat="server">
                                    <asp:ListItem Text="Select Lunch" Value=""></asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label5" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlMondayDinner" runat="server">
                                    <asp:ListItem Text="Select Dinner" Value=""></asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="card day-editor">
                            <h3>Tuesday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label6" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlTuesdayBreakfast" runat="server">
                                    <asp:ListItem Text="Select Breakfast" Value=""></asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label7" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlTuesdayLunch" runat="server">
                                    <asp:ListItem Text="Select Lunch" Value=""></asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label8" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlTuesdayDinner" runat="server">
                                    <asp:ListItem Text="Select Dinner" Value=""></asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card day-editor">
                            <h3>Wednesday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label9" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlWednesdayBreakfast" runat="server">
                                    <asp:ListItem Text="Select Breakfast" Value=""></asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label10" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlWednesdayLunch" runat="server">
                                    <asp:ListItem Text="Select Lunch" Value=""></asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label11" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlWednesdayDinner" runat="server">
                                    <asp:ListItem Text="Select Dinner" Value=""></asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card day-editor">
                            <h3>Thursday</h3>
                            <div class="form-group">
                                <asp:Label ID="Label12" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlThursdayBreakfast" runat="server">
                                    <asp:ListItem>Select Breakfast</asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label13" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlThursdayLunch" runat="server">
                                    <asp:ListItem>Select Lunch</asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label14" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlThursdayDinner" runat="server">
                                    <asp:ListItem>Select Dinner</asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card day-editor">
                            <h3>Friday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label15" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlFridayBreakfast" runat="server">
                                    <asp:ListItem>Select Breakfast</asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label16" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlFridayLunch" runat="server">
                                    <asp:ListItem>Select Lunch</asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label17" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlFridayDinner" runat="server">
                                    <asp:ListItem>Select Dinner</asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card day-editor">
                            <h3>Saturday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label18" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlSaturdayBreakfast" runat="server">
                                    <asp:ListItem>Select Breakfast</asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label23" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlSaturdayLunch" runat="server">
                                    <asp:ListItem>Select Lunch</asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label19" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlSaturdayDinner" runat="server">
                                    <asp:ListItem>Select Dinner</asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="card day-editor">
                            <h3>Sunday</h3>

                            <div class="form-group">
                                <asp:Label ID="Label20" runat="server" Text="Breakfast"></asp:Label>
                                <asp:DropDownList ID="ddlSundayBreakfast" runat="server">
                                    <asp:ListItem>Select Breakfast</asp:ListItem>
                                    <asp:ListItem>Masala Dosa</asp:ListItem>
                                    <asp:ListItem>Aloo Paratha</asp:ListItem>
                                    <asp:ListItem>Vegetable Sandwich</asp:ListItem>
                                    <asp:ListItem>Poha</asp:ListItem>
                                    <asp:ListItem>Idli Sambar</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label21" runat="server" Text="Lunch"></asp:Label>
                                <asp:DropDownList ID="ddlSundayLunch" runat="server">
                                    <asp:ListItem>Select Lunch</asp:ListItem>
                                    <asp:ListItem>Vegetable Pulao</asp:ListItem>
                                    <asp:ListItem>Dal Tadka</asp:ListItem>
                                    <asp:ListItem>Rajma Rice</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="Label22" runat="server" Text="Dinner"></asp:Label>
                                <asp:DropDownList ID="ddlSundayDinner" runat="server">
                                    <asp:ListItem>Select Dinner</asp:ListItem>
                                    <asp:ListItem>Paneer Butter Masala</asp:ListItem>
                                    <asp:ListItem>Palak Paneer</asp:ListItem>
                                    <asp:ListItem>Chole</asp:ListItem>
                                    <asp:ListItem>Veg Biryani</asp:ListItem>
                                    <asp:ListItem>Vegetable Soup</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="Button1" CssClass="btn btn-primary" Style="margin-top: 20px" runat="server" Text="Generate Grocery List" OnClick="Button1_Click" />
                </section>
            </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/meal-planner.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Meal Planner'); initMealPlanner();</script>
    </body>
    </html>
</asp:Content>

