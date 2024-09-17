<%@ Page Title="" Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeFile="Gamedetail.aspx.cs" Inherits="labexw2.Gamedetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1 style="font-family: 'Times New Roman'; font-weight: bold; ">Game Detail :</h1>
    
    <asp:DataList ID="dltGame" runat="server"  RepeatColumns="3" RepeatDirection="Horizontal" Width="100%">
    <ItemTemplate>
        <table class="auto-style2">
            <tr>
                <td colspan="2">
                    <asp:Image ID="imgGame" runat="server" ImageUrl='<%# Eval("Ad", "~/images/TeamsImage/{0}") %>' Width="800px" Height="600px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("Name") %>' Font-Size="XX-Large" Font-Bold="true"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><h2>Game Price:</h2></td>
                <td>
                   <asp:Label ID="lblPrice" runat="server" Text='<%# String.Format("{0:#.00}", Eval("Price")) %>' Font-Size="Large"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><h2>Game Description:</h2></td>
                <td>
                    <asp:Label ID="lblDescrip" runat="server" Text='<%# Eval("Description") %>' Font-Size="Large"></asp:Label>
               </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:DataList>

    <asp:Button ID="btnBuy" runat="server" Text="Add To Cart List" OnClick="btnBuy_Click" Width="250px" Height="60px" Font-Size="X-Large" Font-Bold="True" Font-Names=" Times New Roman" />
    <asp:Label ID="lblStatus" runat="server" Font-Size="Large"></asp:Label>
</asp:Content>

