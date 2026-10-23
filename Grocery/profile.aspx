<%@ Page Title="" Language="C#" MasterPageFile="~/Dashboard.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Grocery.profile" %>

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
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>Profile | Grocery Tracker</title>
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
                    <h1>Profile</h1>
                    <div class="profile-chip"><span data-user-name>User</span><span class="avatar"><i class="fa-solid fa-user"></i></span></div>
                </header>
                <section class="content">
                    <!-- Profile Header Card -->
                    <div class="profile-header-card">
                        <div class="profile-avatar-large">
                            <span id="profile-initials">PC</span>
                            <div class="camera-icon">
                                <i class="fa-solid fa-camera"></i>
                            </div>
                        </div>
                        <div class="profile-info-header">
                            <h2 id="profile-name">Priyesha Chauhan</h2>
                            <div class="status-badge">Active</div>
                        </div>
                        <button id="btnEditProfile" class="btn-edit-profile" onclick="startEditProfile(event); return false;">
                            <i class="fa-solid fa-pen"></i> Edit Profile
                        </button>
                    </div>

                    <!-- Personal Information -->
                    <div class="personal-info-card">
                        <h3>Personal Information</h3>
        
                        <!-- View Mode -->
                        <div id="profile-view">
                            <div class="info-item">
                                <i class="fa-regular fa-user"></i>
                                <div class="info-item-content">
                                    <div class="info-item-label">Full Name</div>
                                    <div class="info-item-value" id="profile-name-display">Priyesha Chauhan</div>
                                </div>
                            </div>
                            <div class="info-item">
                                <i class="fa-regular fa-envelope"></i>
                                <div class="info-item-content">
                                    <div class="info-item-label">Email Address</div>
                                    <div class="info-item-value" id="profile-email-display">priyesha@example.com</div>
                                </div>
                            </div>
                           <div class="info-item">
                                <i class="fa-solid fa-phone"></i>
                                <div class="info-item-content">
                                    <div class="info-item-label">Mobile Number</div>
                                    <div class="info-item-value" id="profile-mobile-display">+91 98765 43210</div>
                                </div>
                            </div>
                        </div>

                        <!-- Edit Mode -->
                        <div id="profile-edit" style="display: none;">
                            <div class="form-group">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtEditName" runat="server" ClientIDMode="Static" placeholder="Enter your full name"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Email Address</label>
                                <asp:TextBox ID="txtEditEmail" runat="server" ClientIDMode="Static" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Mobile Number</label>
                                <asp:TextBox ID="txtEditMobile" runat="server" ClientIDMode="Static" placeholder="+91 98765 43210"></asp:TextBox>
                            </div>
                            <div class="actions" style="display: flex; gap: 12px; margin-top: 20px;">
                                <button type="button" class="btn btn-primary" onclick="saveProfile(event); return false;">
                                    <i class="fa-solid fa-check"></i> Save Changes
                                </button>
                                <button type="button" class="btn btn-secondary" onclick="cancelEditProfile(event); return false;">
                                    Cancel
                                </button>
                            </div>
                        </div>

                        <!-- Stats -->
                        <div class="profile-stats-grid" id="profile-stats">
                            <div class="stat-card-modern">
                                <strong>1</strong>
                                <span class="muted">Meal plans</span>
                            </div>
                            <div class="stat-card-modern">
                                <strong>0</strong>
                                <span class="muted">Grocery items</span>
                            </div>
                            <div class="stat-card-modern">
                                <strong>3</strong>
                                <span class="muted">Special requests</span>
                            </div>
                        </div>
                    </div>

                    <!-- Password Section -->
                    <div id="password-form" class="card">
                        <p class="eyebrow">Security</p>
                        <h2>Change password</h2>
                        <div class="form-group">
                            <asp:Label ID="lblCurrentPassword" runat="server" Text="Current Password"></asp:Label>
                            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblNewPassword" runat="server" Text="New Password"></asp:Label>
                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblConfirmPassword" runat="server" Text="Confirm New Password"></asp:Label>
                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnUpdatePassword" runat="server" Text="Update Password" CssClass="btn btn-primary" OnClick="btnUpdatePassword_Click" />
                    </div>
                </section>
           </main>
        </div>
        <div class="toast-wrap"></div>
        <script src="js/storage.js"></script>
        <script src="js/common.js"></script>
        <script src="js/auth.js"></script>
        <script src="js/profile.js"></script>
        <script>protectUserPage(); setupAppShell(false, 'Profile'); initProfile();</script>
    </body>
    </html>
</asp:Content>

