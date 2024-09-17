<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeFile="EditGames.aspx.cs" Inherits="groupassignment.EditGames" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <aside><h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000; font-size: 40px;">Games Management Site</h1></aside>
    <article>
        <div>
            <asp:Panel runat="server" ID="panel1" Font-Size="Large">
                <asp:GridView ID="dltGame" runat="server" AutoGenerateColumns="false" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="GameID" HeaderText="ID" HeaderStyle-Font-Size="X-Large" ItemStyle-Font-Size="Large" ItemStyle-HorizontalAlign="Center" SortExpression="CategoryID"></asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name" HeaderStyle-Font-Size="X-Large" ItemStyle-Font-Size="Large" ItemStyle-HorizontalAlign="Center" SortExpression="CategoryName"></asp:BoundField>
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
                Game ID:
                <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>&nbsp;&nbsp;
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CausesValidation="false"/><br />
                <asp:Label ID="lblResult" runat="server" ></asp:Label>
            </asp:Panel><br /><br />
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <asp:Label ID="lbHeader" runat="server" Text="** Add New Record **" Font-Size="Larger" ForeColor="Black" BackColor="#ffcc99"></asp:Label>
            
            <asp:Table ID="tabEditing" runat="server">
                <asp:TableRow>
                   <asp:TableCell>
                       Game ID:
                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtGameID" runat="server" />
                   </asp:TableCell><asp:TableCell>
                       <asp:RequiredFieldValidator ID="rfvTXTGameID" runat="server" ErrorMessage="Please enter GameID" BackColor="Yellow" ControlToValidate="txtGameID" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                       <asp:RegularExpressionValidator ID="revGameID" runat="server" BackColor="Yellow" ControlToValidate="txtGameID" Display="Dynamic" ErrorMessage="GameID format must be :g0xxx!" ForeColor="Red" ValidationExpression="^g0\d{3}$"></asp:RegularExpressionValidator>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       Name:
                   </asp:TableCell><asp:TableCell>
                       <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                   </asp:TableCell><asp:TableCell>
                       <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="Please enter Game Name" BackColor="Yellow" ControlToValidate="txtName" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                       CategoryID:
                    </asp:TableCell><asp:TableCell>
                        <asp:SqlDataSource ID="SqlDSCategories" runat="server" ConnectionString="<%$ ConnectionStrings:TeamsDatabaseConnString %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
                        <asp:DropDownList ID="ddlCate" runat="server" DataSourceID="SqlDSCategories" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvDDLCate" runat="server" ErrorMessage="Please enter Game Category" BackColor="Yellow" ControlToValidate="ddlCate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        Price:
                   </asp:TableCell><asp:TableCell>
                       <asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox>
                   </asp:TableCell><asp:TableCell>
                       <asp:RequiredFieldValidator ID="rfvTxtPrice" runat="server" ErrorMessage="Please enter Price" BackColor="Yellow" ControlToValidate="txtPrice" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       Description:
                   </asp:TableCell><asp:TableCell>
                        <asp:TextBox ID="txtDesc" runat="server"  TextMode="MultiLine" MaxLength="50"/>
                   </asp:TableCell><asp:TableCell>
                       <asp:RequiredFieldValidator ID="rfvTxtDescrip" runat="server" ErrorMessage="Please enter Game Description" BackColor="Yellow" ControlToValidate="txtDesc" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        Photo:
                    </asp:TableCell><asp:TableCell>
                        <asp:Image ID="imgProdPhoto" runat="server" Height="100" Width="80"/>
                        <asp:LinkButton ID="lbtnProdPhoto" runat="server" OnClick="lbtnProdPhoto_Click" Text="Change photo?" CausesValidation="false"></asp:LinkButton>
                        <asp:FileUpload ID="fiuImage" runat="server"  /><br />
                        <asp:LinkButton ID="lbtnCancel" runat="server" OnClick="lbtnCancel_Click" CausesValidation="false">Cancel Upload</asp:LinkButton><br />
                        <asp:Label ID="lblUploadStatus" runat="server" ForeColor="Red" />
                        <asp:Label ID="lblFileName" runat="server" Visible="false"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                       <asp:RequiredFieldValidator ID="rfvFileUpload" runat="server" ErrorMessage="Please upload the image" BackColor="Yellow" ControlToValidate="fiuImage" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>
                        Advertiment:
                    </asp:TableCell><asp:TableCell>
                        <asp:Image ID="imgAD" runat="server" Height="100" Width="80"/>
                        <asp:LinkButton ID="lbtnAD" runat="server" OnClick="lbtnProdPhoto_Click" Text="Change photo?" CausesValidation="false"></asp:LinkButton>
                        <asp:FileUpload ID="fiuAD" runat="server" /><br />
                        <asp:LinkButton ID="lbtnCancel1" runat="server" OnClick="lbtnCancel_Click" CausesValidation="false">Cancel Upload</asp:LinkButton><br />
                        <asp:Label ID="lblUploadStatus1" runat="server" ForeColor="Red" />
                        <asp:Label ID="lblFilename1" runat="server" Visible="false"></asp:Label>
                    </asp:TableCell><asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvFiuAD" runat="server" ErrorMessage="Please upload the advertisement" BackColor="Yellow" ControlToValidate="fiuAD" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
                       Game ID:
                   </asp:TableCell><asp:TableCell>
                       <asp:Label ID="lblGameID" runat="server"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       Name:
                   </asp:TableCell><asp:TableCell>
                       <asp:Label ID="lblName" runat="server"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       CategoryID:
                   </asp:TableCell><asp:TableCell>
                       <asp:Label ID="lblCate" runat="server"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>Price:
                   </asp:TableCell><asp:TableCell>
                        <asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       Description:
                   </asp:TableCell><asp:TableCell>
                       <asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label>
                   </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>Photo:
                    </asp:TableCell><asp:TableCell>
                        <asp:Image ID="imgGame" runat="server" Width="300px" Height="300px"/>
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                    <asp:TableCell>Advertisment:
                    </asp:TableCell><asp:TableCell>
                        <asp:Image ID="imgDisplay" runat="server" Width="300px" Height="300px"/>              
                    </asp:TableCell></asp:TableRow><asp:TableRow>
                   <asp:TableCell>
                       <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click"/>
                   </asp:TableCell></asp:TableRow></asp:Table></div></article></asp:Content>