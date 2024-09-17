<%@ Page Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="Adminpage.aspx.cs" Inherits="labexw2.Adminpage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000;">Admin Management</h1>
            <h3>Click a button to edit information:</h3>
            <asp:Button ID="btnGame" runat="server" Text="Games" PostBackUrl="~/EditGames.aspx" Height="35px" Width="80px" />&nbsp;
            <asp:Button ID="btnCat" runat="server" Text="Categories" PostBackUrl="~/EditCategory.aspx" Height="35px" Width="90px" />
        </div>
</asp:Content>
