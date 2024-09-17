<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EditCategory.aspx.cs" Inherits="labexw2.EditCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <aside><h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000; font-size: 40px;">Categories Management Site</h1></aside>
    <article>
        <div>
            <asp:GridView ID="dltCate" runat="server" AutoGenerateColumns="False" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="CategoryID" HeaderText="ID" HeaderStyle-Font-Size="X-Large" ItemStyle-Font-Size="Large" ItemStyle-HorizontalAlign="Center" SortExpression="CategoryID"></asp:BoundField>
                    <asp:BoundField DataField="CategoryName" HeaderText="Name" HeaderStyle-Font-Size="X-Large" ItemStyle-Font-Size="Large" ItemStyle-HorizontalAlign="Center" SortExpression="CategoryName"></asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
            </asp:GridView><br />
            Category ID:
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>&nbsp;&nbsp;
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false"/><br />
            <asp:Label ID="lblResult" runat="server" ></asp:Label><br /><br />
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <asp:Label ID="lbHeader" runat="server" Text="** Add New Record **" Font-Size="Larger" ForeColor="Black" BackColor="#ffff66"></asp:Label>
            <asp:Table ID="tabEditing" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        Category ID:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCatID" runat="server" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvTXTCateID" runat="server" ErrorMessage="Please enter GameID" BackColor="Yellow" ControlToValidate="txtCatID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revGameID" runat="server" BackColor="Yellow" ControlToValidate="txtCatID" Display="Dynamic" ErrorMessage="CategoryID format must be :cx!" ForeColor="Red" ValidationExpression="^c\d{1}$"></asp:RegularExpressionValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Name:
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvTXTGameID" runat="server" ErrorMessage="Please enter Name" BackColor="Yellow" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>&nbsp;
                    </asp:TableCell><asp:TableCell>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" CausesValidation="false"/>
                        <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" CausesValidation="false"/>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" />
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="false" />
                    </asp:TableCell></asp:TableRow></asp:Table><br />
            <asp:Table ID="tabResult" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        Category ID:
                    </asp:TableCell>
                    <asp:TableCell>
                    <asp:Label ID="lblCategoryID" runat="server" Text="Label"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        Name:
                    </asp:TableCell><asp:TableCell>
                        <asp:Label ID="lblName" runat="server" Text="Label"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </article>
</asp:Content>