<%@ Page Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="labexw2.Feedback"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table class="auto-style1" style="width:100%">
            <tr>
                <td><h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000;font-weight: bold;">Privacy Feedback</></td>
            </tr>
            <tr>
                <td><h3>This page is meant for questions by people who do not have a Steam user account. To protect your data we will only provide information about your account, correct or delete user data if you have logged in and requested it here: <a href="mailto:i22022244@student.newinti.edu.my" target="_blank" style="color: #FFFF00">i22022244@student.newinti.edu.my</a></h3></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Your Email<br />
                    <asp:TextBox ID="txtEmail" runat="server" Width="241px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" BackColor="Yellow" ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="You must give an email." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" BackColor="Yellow" ControlToValidate="txtEmail" ErrorMessage="Only valid email is accepted." ForeColor="Red" ValidationExpression="\S+\@\S+\.\S+" Display="Dynamic"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Your Region<br />
                    <asp:DropDownList ID="ddlRegion" runat="server">
                        <asp:ListItem>Select one...</asp:ListItem>
                        <asp:ListItem>United States of America</asp:ListItem>
                        <asp:ListItem>Europe</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRegion" runat="server" BackColor="Yellow" ControlToValidate="ddlRegion" ErrorMessage="You must select a region." ForeColor="Red" InitialValue="Select one..."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td>Message<br />
                    <asp:TextBox ID="txtMessage" runat="server" Height="300px" Width="100%"></asp:TextBox><br />
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" BackColor="Yellow" ControlToValidate="txtMessage" ErrorMessage="You must enter your message." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnSend" runat="server" Text="Send" OnClick="btnSend_Click" Height="32px" Width="110px"/><br />
                    <asp:Label ID="lblNotice" runat="server" Font-Size="XX-Large"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>