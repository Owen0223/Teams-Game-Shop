<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Catecontrol.ascx.cs" Inherits="labexw2.Catecontrol" %>
<asp:DataList ID="dltCategories" runat="server" RepeatDirection="Horizontal" RepeatLayout="Table" Width="100%" Height="50px" HorizontalAlign="Center" Font-Bold="true" Font-Size="Large">
    <ItemTemplate>
        <asp:HyperLink ID="hlkMenu" runat="server" Text='<%# Eval("CategoryName") + "&nbsp;" %>' NavigateUrl='<%# "Category.aspx?IDCAT="+Eval("CategoryID")%>' ForeColor="Black" Font-Names="Times New Roman"></asp:HyperLink>
    </ItemTemplate>
</asp:DataList>