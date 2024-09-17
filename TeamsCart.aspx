<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" MasterPageFile="~/Teams.Master" CodeFile="TeamsCart.aspx.cs" Inherits="labexw2.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <h2>Item List:</h2>
        <asp:GridView ID="grvItem" runat="server" AutoGenerateColumns="false" OnRowDataBound="grvItem_RowDataBound" Width="100%">
            <Columns>
                <asp:TemplateField HeaderText="Game Photo" HeaderStyle-Font-Size="X-Large" HeaderStyle-BackColor="#999999" HeaderStyle-ForeColor="Black" HeaderStyle-Height="50px">
                    <ItemTemplate>
                        <asp:Image ID="imgGame" runat="server" ImageUrl='<%# Eval("Image", "~/images/TeamsImage/{0}") %>' width="400px" Height="300px" style="display: block; margin: 0 auto;" />
                     </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Name" HeaderText="Game" HeaderStyle-Font-Size="X-Large" HeaderStyle-BackColor="#999999" HeaderStyle-ForeColor="Black" HeaderStyle-Height="50px" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger" ></asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Price" HeaderStyle-Font-Size="X-Large" HeaderStyle-BackColor="#999999" HeaderStyle-ForeColor="Black" HeaderStyle-Height="50px" DataFormatString="{0:c}" ItemStyle-HorizontalAlign="Center" ItemStyle-Font-Size="Larger"></asp:BoundField>
            </Columns>
        </asp:GridView><br />
        <h2 style="color:yellow">Select the product you want to cancel:</h2>
        <asp:SqlDataSource ID="SqlDSDel" runat="server" ConnectionString="<%$ ConnectionStrings:TeamsDatabaseConnString %>" SelectCommand="SELECT CartList.[GameID], Games.[Name] FROM [CartList] CartList INNER JOIN [Games] Games ON CartList.[GameID] = Games.[GameID] WHERE CartList.[Username] = @Uname">
            <SelectParameters>
                <asp:CookieParameter Name="Uname" CookieName="cookie" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DropDownList ID="ddlDel" runat="server" DataSourceID="SqlDSDel" DataTextField="Name" DataValueField="GameID" Width="200px" Height="30px"></asp:DropDownList>
        <asp:Button ID="btnDel" runat="server" Text="Delete" Width="70px" Height="30px" OnClick="btnDel_Click" AutoPostBack="true"/>
        <asp:Label ID="lblStatus" runat="server"></asp:Label><hr />     
    </div>
    
    <table class="auto-style5">
        <tr>
            <td style="text-align: right;"><asp:Label ID="lblTotalPrice" runat="server" Font-Size="Larger" Font-Bold="true" Font-Underline="true" ></asp:Label></td>
        </tr>
        <tr style="text-align: center;">
            <td style="font-size:x-large; font-weight: bold;">Do you wish to proceed?<br /></td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Button ID="btnBack" runat="server" Text="Back" PostBackUrl="~/home.aspx" Width="70px" Height="30px"/>&nbsp;&nbsp;
                <asp:Button ID="btnPay" runat="server" Text="Pay" Width="70px" Height="30px" OnClick="btnPay_Click"/>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;"><br />
                <asp:Label ID="lblRemind" runat="server" Font-Size="X-Large" Font-Bold="true"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Button ID="btnYes" runat="server" Text="Yes" PostBackUrl="~/Payment.aspx" Width="70px" Height="30px"/>&nbsp;&nbsp;
                <asp:Button ID="btnNo" runat="server" Text="No" PostBackUrl="~/home.aspx" Width="70px" Height="30px"/>
            </td>
        </tr>
    </table>
</asp:Content>