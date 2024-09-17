<%@ Page Language="C#" AutoEventWireup="true" Codefile="login.aspx.cs" Inherits="Assignment.login"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 198px;
        }
        .auto-style2 {
            width: 323px;
        }
        .auto-style3 {
            width: 1256px;
        } 
        body{
            background-color: rgb(9, 39, 67);
        }
        
        .auto-style4 {
            width: 129px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1 style="text-align:center; color:white">Login Page</h1>
            <br /><br />
            <table style="color:white; " width="100%">
                <tr>
                    <td class="auto-style4">
                        <asp:Label ID="lblName" runat="server" Visible="false" />
                    </td>
                    <td class="auto-style1"style="text-align:center">User Name: </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtUname" runat="server" Width="302px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4"></td>
                    <td class="auto-style1" style="text-align:center">Password: </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="txtPwd" runat="server" Width="302px" TextMode="Password" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">
                    </td>
                    <td class="auto-style1">
                    </td>
                    <td class="auto-style2" >
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click"/>
                        &nbsp;&nbsp;
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    </td>
                </tr>
            </table><br />

            <table width="100%">
                <tr>
                    <td style="text-align: center; color:white" >
                        <asp:Label ID="lblMessage" runat="server" />
                    </td>
                </tr>
            </table><br /><hr />
            <h2 style="text-align:center; color: rgb(202, 202, 202)">Or</h2>
            <h2 style="text-align:center; color: rgb(202, 202, 202)"">Are you a new comer?</h2><br /><br />
            <table width="100%">
                <tr>
                    <td style="text-align:center" class="auto-style3">
                       <asp:Button ID="btnRegister" runat="server" Text="Register a new account" BackColor="Lime" OnClick="btnRegister_Click" Width="277px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
