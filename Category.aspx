<%@ Page Title="" Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="labexw2.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:DataList ID="dltProducts" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style2" style="text-align:center">
                <tr>
                    <td>
                        <asp:Image ID="imgCate" runat="server" ImageUrl='<%# Eval("Ad", "~/images/TeamsImage/{0}") %>' Height="300px" Width="500px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                       <asp:Label ID="lblPrice" runat="server" Text='<%# String.Format("{0:#.00}", Eval("Price")) %>' Font-Size="Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:HyperLink ID="hlkmenu" runat="server" NavigateUrl='<%# "Gamedetail.aspx?IDGa="+Eval("GameID") %>' Text="Click Here Know More" ForeColor="Yellow" Font-Bold="true" Font-Size="X-Large"></asp:HyperLink>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
