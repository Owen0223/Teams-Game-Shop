<%@ Page Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="labexw2.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 34px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
        <div>
            <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000;font-weight: bold;">Teams Support</h1>
            <table class="auto-style1" style="width:100%">
                <tr>
                    <td class="auto-style5" style="text-align: left; font-size: x-large;">What do you need help with ?
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                </tr>
                <tr>
                    <td style="font-size:x-large">Having Trouble...<br />
                        <asp:RadioButton ID="rdoFeatures" runat="server" Text="What features should my gaming store website have?" AutoPostBack="true" Font-Bold="true" ForeColor="#00FFCC"/><br />
                        <asp:BulletedList ID="btlFeatures" runat="server"></asp:BulletedList>
                        <asp:RadioButton ID="rdoSupport" runat="server" Text="How do I handle customer support?" AutoPostBack="true" Font-Bold="true" ForeColor="#00FFCC"/><br />
                        <asp:BulletedList ID="btlSupport" runat="server" ></asp:BulletedList>
                        <asp:RadioButton ID="rdoRefund" runat="server" Text="What if a purchase is refunded to my bank or my purchase is disputed/chargeback?" AutoPostBack="true" Font-Bold="true" ForeColor="#00FFCC"/><br />
                        <asp:Label ID="lblRefund" runat="server"></asp:Label>
                        <asp:RadioButton ID="rdoPurchase" runat="server" Text="What if my purchase is pending or processing? When will I become unlimited?" AutoPostBack="true" Font-Bold="true" ForeColor="#00FFCC"/><br />
                        <asp:Label ID="lblPurchase" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnFeedback" runat="server" Text="Feedback" PostBackUrl="~/Feedback.aspx" Height="30px" Width="90px"/>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnContactUs" runat="server" Text="Contact Us" OnClick="btnContactUs_Click" Height="30px" Width="100px" />
                        <asp:Label ID="lblContactUs" runat="server"></asp:Label>
                        <asp:BulletedList ID="btlContactUs" runat="server"></asp:BulletedList>
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>