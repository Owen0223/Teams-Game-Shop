<%@ Page Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="labexw2.home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
    <div style="text-align: center">
        <br />
        <asp:TextBox ID="txtSearch" runat="server" Height="30px" Width="300px"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" Height="30px"/>
        <asp:Label ID="lblResult" runat="server" ></asp:Label>
        <br /><br />

        <table class="auto-style5">
            <tr>
                <td>
                    <asp:Image ID="imgWelcome" runat="server" ImageUrl="~/images/TeamsImage/Welcome.png" Width="100%"/>
                </td>
            <tr>
                <td>
                    <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000; font-size: 70px; font-weight: bold; text-align: left;">What's New</h1>
                </td>
            </tr>
        </table>

        <asp:MultiView ID="mvAdver" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPicture1" runat="server">
                <asp:ImageButton ID="imgArrow1" runat="server" ImageUrl="~/images/TeamsImage/arrow2.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle"  CommandArgument="viewPicture5" CommandName="SwitchViewByID"/>
                <asp:ImageButton ID="imbAdverList1" runat="server" ImageUrl="~/images/TeamsImage/gtaVad.png" Width="90%" Height="800px" ImageAlign="AbsMiddle" OnClick="imbAdverList1_Click"/>
                <asp:ImageButton ID="imgArrow2" runat="server" ImageUrl="~/images/TeamsImage/arrow.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle" CommandName="NextView" />
            </asp:View>
            <asp:View ID="viewPicture2" runat="server">
                <asp:ImageButton ID="imgArrow3" runat="server" ImageUrl="~/images/TeamsImage/arrow2.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle"/>
                <asp:ImageButton ID="imbAdverList2" runat="server" ImageUrl="~/images/TeamsImage/dbdad.png" Width="90%" Height="800px" ImageAlign="AbsMiddle" OnClick="imbAdverList2_Click"/>
                <asp:ImageButton ID="imgArrow4" runat="server" ImageUrl="~/images/TeamsImage/arrow.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle" CommandName="NextView" />
            </asp:View>
            <asp:View ID="viewPicture3" runat="server">
                <asp:ImageButton ID="imgArrow5" runat="server" ImageUrl="~/images/TeamsImage/arrow2.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle"/>
                <asp:ImageButton ID="imbAdverList3" runat="server" ImageUrl="~/images/TeamsImage/gtaV.png" Width="90%" Height="800px" ImageAlign="AbsMiddle"  OnClick="imbAdverList3_Click"/>
                <asp:ImageButton ID="imgArrow6" runat="server" ImageUrl="~/images/TeamsImage/arrow.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle" CommandName="NextView" />
            </asp:View>
                <asp:View ID="viewPicture4" runat="server">
                <asp:ImageButton ID="imgArrow7" runat="server" ImageUrl="~/images/TeamsImage/arrow2.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle"/>
                <asp:ImageButton ID="imbAdverList4" runat="server" ImageUrl="~/images/TeamsImage/yugioh.png" Width="90%" Height="800px" ImageAlign="AbsMiddle" OnClick="imbAdverList4_Click"/>
                <asp:ImageButton ID="imgArrow8" runat="server" ImageUrl="~/images/TeamsImage/arrow.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle" CommandName="NextView" />
            </asp:View>
                <asp:View ID="viewPicture5" runat="server">
                <asp:ImageButton ID="imgArrow9" runat="server" ImageUrl="~/images/TeamsImage/arrow2.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle"/>
                <asp:ImageButton ID="imbAdverList5" runat="server" ImageUrl="~/images/TeamsImage/dbdad.png" Width="90%" Height="800px" ImageAlign="AbsMiddle" OnClick="imbAdverList5_Click"/>
                <asp:ImageButton ID="imgArrow10" runat="server" ImageUrl="~/images/TeamsImage/arrow.jpeg" Height="40px" Width="40px" ImageAlign="AbsMiddle" CommandName="SwitchViewByIndex" CommandArgument="0" />
            </asp:View>
        </asp:MultiView><br /><br />
        <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000; font-weight: bold; text-align: left;">Categories</h1>
        <asp:ImageButton ID="imbCatelistAc" runat="server" ImageUrl="~/images/TeamsImage/action.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistAc_Click" />

        <asp:ImageButton ID="imbCatelistHorror" runat="server" ImageUrl="~/images/TeamsImage/Horror.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistHorror_Click"/>
        <asp:ImageButton ID="imbCatelistStra" runat="server" ImageUrl="~/images/TeamsImage/stratrgic.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistStra_Click"/>
            

        <asp:ImageButton ID="imbCatelistSport" runat="server" ImageUrl="~/images/TeamsImage/Sportandracing'.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistSport_Click"/>

        <asp:ImageButton ID="imbCatelistAdv" runat="server" ImageUrl="~/images/TeamsImage/Adventure.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistAdv_Click"/>
        <asp:ImageButton ID="imbCatelistSimu" runat="server" ImageUrl="~/images/TeamsImage/Simulative.png" ImageAlign="AbsMiddle" Width="215" Height="215" OnClick="imbCatelistSimu_Click"/>
            

    </div>
    <br />
</asp:Content>
