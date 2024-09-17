<%@ Page Language="C#" MasterPageFile="~/Teams.Master" AutoEventWireup="true" CodeFile="Library.aspx.cs" Inherits="labexw2.Library" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" col-lg-8" style="margin-top:30px" width:100%>
            <h1 style="font-family: 'times New Roman'">Library</h1>
            <asp:Panel ID="pnlLibrary" runat="server" GroupingText="<H1 style='font-family: Times New Roman;'>Recent Games</H1>">            
                <asp:DataList ID="dltLibrary" runat="server" RepeatDirection="Horizontal">
                <ItemTemplate>
                    <div style="width:300px; text-align:center; margin-right:20px;">
                        <asp:Image ID="imgLibrary" runat="server" ImageUrl='<%#Eval("Image","~/images/TeamsImage/{0}") %>' width="300px" Height="200px" /><br />
                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("Name") %>' Font-Size="x-Large" Font-Bold="true"></asp:Label><br />
                        <asp:Label ID="lblCategory" runat="server" Text='<%# "Category: " + Eval("CategoryName") %>' Font-Size="Large"></asp:Label><br />
                        <asp:HyperLink ID="hlkMore" runat="server" NavigateUrl='<%# "Gamedetail.aspx?IDGa="+Eval("GameID") %>' Font-Size="Large" ForeColor="Yellow" Text="Click Here for More Information"></asp:HyperLink><br />
                        <asp:Button ID="btnStart" runat="server" Text="Start" OnClick="btnStart_Click" Height="27px" Width="57px"/>
                </ItemTemplate>
                </asp:DataList>
            </asp:Panel>
    </div>
</asp:Content>