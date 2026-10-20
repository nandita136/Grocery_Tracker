<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="forgot-password.aspx.cs" Inherits="Grocery.forgot_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="auth-shell" style="min-height: 100vh; display: flex; justify-content: center; align-items: center; background: #fff;">
        <main class="auth-panel" style="width: 100%; display: flex; justify-content: center; align-items: center; padding: 30px;">
            <div id="forgot-password-form" class="form-card" style="display: block; width: 470px; max-width: 92%; background: #fff; padding: 34px; border-radius: 20px; border: 1px solid #dcebe1; box-shadow: 0 10px 30px rgba(31,93,58,.1);">
                <h1 style="font-family: Quicksand, sans-serif; color: #1f5d3a; margin: 0 0 10px 0; font-size: 1.8rem;">Forgot Password?</h1>
                <p class="sub" style="color: #6b7280; margin: 0 0 20px 0; font-size: 0.95rem; line-height: 1.5;">Enter your email address and we'll send you a link to reset your password.</p>

                <div id="form_error" class="form-error" runat="server" visible="false" style="background: #fee2e2; color: #991b1b; padding: 10px 12px; border-radius: 9px; font-size: .9rem; margin: 12px 0;"></div>
                <div id="form_success" class="form-success" runat="server" visible="false" style="background: #dcfce7; color: #166534; padding: 10px 12px; border-radius: 9px; font-size: .9rem; margin: 12px 0;"></div>

                <div class="form-group" style="margin-bottom: 15px;">
                    <asp:Label ID="Label1" runat="server" Text="Email Address" Style="display: block; margin-bottom: 6px; font-weight: 800; font-size: .9rem; color: #374151;"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="Enter your registered email" Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px; outline: 0; box-sizing: border-box; font-size: 1rem;"></asp:TextBox>
                </div>

                <asp:Button ID="btnSendReset" runat="server" CssClass="btn btn-primary" Style="width: 100%; margin-top: 20px; padding: 12px; background: #1f5d3a; color: white; border: none; border-radius: 9px; font-weight: 800; font-size: 1rem; cursor: pointer;" Text="Send Reset Link" OnClick="btnSendReset_Click" />

                <p class="small muted" style="text-align: center; margin-top: 20px; color: #6b7280; font-size: .88rem;">
                    Remember your password? 
                    <a href="login.aspx" style="color: var(--green); font-weight: 800; text-decoration: none;">Sign in</a>
                </p>
            </div>
        </main>
    </div>

</asp:Content>