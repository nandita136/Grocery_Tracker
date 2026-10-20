<%@ Page Title="Register" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Grocery.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="auth-shell" style="min-height: 100vh; display: flex; justify-content: center; align-items: center; background: #fff;">
        <main class="auth-panel" style="width: 100%; display: flex; justify-content: center; align-items: center; padding: 30px;">
            <div id="register-form" class="form-card" style="display: block; width: 470px; max-width: 92%; background: #fff; padding: 34px; border-radius: 20px; border: 1px solid #dcebe1; box-shadow: 0 10px 30px rgba(31,93,58,.1);">
                <h1>Create account</h1>
                <div id="form-error" class="form-error"></div>
                <div id="form-success" class="form-success"></div>
                
                <div class="form-group" style="display: block; width: 100%; margin-bottom: 15px;">
                    <asp:Label ID="Label1" runat="server" Text="Name" Style="display: block; margin-bottom: 6px; font-weight: 800; font-size: .9rem;"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px; outline: 0;"></asp:TextBox>
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <asp:Label ID="Label2" runat="server" Text="Email" Style="display: block; margin-bottom: 6px; font-weight: 800; font-size: .9rem;"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px; outline: 0;"></asp:TextBox>
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <asp:Label ID="Label3" runat="server" Text="Password" Style="display: block; margin-bottom: 6px; font-weight: 800; font-size: .9rem;"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px; outline: 0;"></asp:TextBox>
                </div>
                
                <div class="form-group" style="margin-bottom: 15px;">
                    <asp:Label ID="Label4" runat="server" Text="Confirm Password" Style="display: block; margin-bottom: 6px; font-weight: 800; font-size: .9rem;"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px; outline: 0;"></asp:TextBox>
                </div>
                
                <asp:Button ID="Button1" CssClass="btn btn-primary" Style="width: 100%; margin-top: 10px;" runat="server" Text="Register" OnClick="Button1_Click" />
                
                <p class="small muted" style="text-align: center; margin-top: 20px; color: #6b7280; font-size: .88rem;">
                    Already registered? <a href="login.aspx" style="color: var(--green); font-weight: 800; text-decoration: none;">Sign in</a>
                </p>
            </div>
        </main>
    </div>
    
    <script src="js/storage.js"></script>
    <script src="js/common.js"></script>
    <script src="js/auth.js"></script>
    <script>registerUser();</script>

</asp:Content>