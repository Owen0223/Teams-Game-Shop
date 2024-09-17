<%@ Page Language="C#" MasterPageFile="~/Payment.Master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="labexw2.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 31px;
        }
        .auto-style6 {
            height: 68px;
        }
        .auto-style7 {
            height: 68px;
            width: 300px;
        }
        .auto-style8 {
            width: 100%;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:MultiView ID="mlvTransaction" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewPayment" runat="server">
                <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000;">Payment</h1>
                <table>
                    <tr>
                        <td colspan="3" style="font-size: large; font-weight: bold;">Please selest a payment method<br />
                            <asp:DropDownList ID="ddlMethod" runat="server" OnSelectedIndexChanged="ddlMethod_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem>Choose one...</asp:ListItem>
                            <asp:ListItem>Visa</asp:ListItem>
                            <asp:ListItem>MasterCard</asp:ListItem>
                            <asp:ListItem>Touch&#39;n Go</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvMethod" runat="server" BackColor="Yellow" ControlToValidate="ddlMethod" ErrorMessage="You must select a payment method." ForeColor="Red" InitialValue="Choose one..." ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                            &nbsp;<br />
                            <asp:Label ID="lblTNG" runat="server"></asp:Label>
                        </td>
                        <td rowspan="4"><h3>PAYMENT METHODS</h3>
                            We accept the following secure payment methods:<br />
                            <asp:ImageButton ID="ibtnCard" runat="server" ImageUrl="~/images/TeamsImage/Card.png" OnClick="ibtnCard_Click" CausesValidation="false"/>
                            <asp:ImageButton ID="ibtnMasterCard" runat="server" ImageUrl="~/images/TeamsImage/MasterCard.png" OnClick="ibtnMasterCard_Click" CausesValidation="false"/>
                            <asp:ImageButton ID="ibtnTouchnGo" runat="server" ImageUrl="~/images/TeamsImage/TouchnGo.png" OnClick="ibtnTouchnGo_Click" CausesValidation="false" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style7" colspan="2" style="font-size: large; font-weight: bold;">Card number<br />
                            <asp:TextBox ID="txtCard" runat="server" CssClass="auto-style4" Width="244px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvCard" runat="server" BackColor="Yellow" ControlToValidate="txtCard" Display="Dynamic" ErrorMessage="You must give a card number." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revCard" runat="server" BackColor="Yellow" ControlToValidate="txtCard" Display="Dynamic" ErrorMessage="Card number must be xxxx-xxxx-xxxx" ForeColor="Red" ValidationExpression="\d{4}\-\d{4}\-\d{4}" ValidationGroup="paymentGroup"></asp:RegularExpressionValidator>
                        </td>
                        <td style="font-size: large; font-weight: bold;">Expiration date&nbsp;&nbsp;&nbsp;Security Code<br />
                            <asp:DropDownList ID="ddlExpMonth" runat="server">
                                <asp:ListItem>--</asp:ListItem>
                                <asp:ListItem>01</asp:ListItem>
                                <asp:ListItem>02</asp:ListItem>
                                <asp:ListItem>03</asp:ListItem>
                                <asp:ListItem>04</asp:ListItem>
                                <asp:ListItem>05</asp:ListItem>
                                <asp:ListItem>06</asp:ListItem>
                                <asp:ListItem>07</asp:ListItem>
                                <asp:ListItem>08</asp:ListItem>
                                <asp:ListItem>09</asp:ListItem>
                                <asp:ListItem>10</asp:ListItem>
                                <asp:ListItem>11</asp:ListItem>
                                <asp:ListItem>12</asp:ListItem>
                            </asp:DropDownList>
                            <asp:DropDownList ID="ddlExpYear" runat="server">
                                <asp:ListItem>----</asp:ListItem>
                                <asp:ListItem>2023</asp:ListItem>
                                <asp:ListItem>2024</asp:ListItem>
                                <asp:ListItem>2025</asp:ListItem>
                                <asp:ListItem>2026</asp:ListItem>
                                <asp:ListItem>2027</asp:ListItem>
                                <asp:ListItem>2028</asp:ListItem>
                            </asp:DropDownList>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:TextBox ID="txtCode" runat="server" Width="76px"></asp:TextBox><br />
                            <asp:RequiredFieldValidator ID="rfvExpMonth" runat="server" BackColor="Yellow" ControlToValidate="ddlExpMonth" Display="Dynamic" ErrorMessage="Expiration cannot be empty." ForeColor="Red" InitialValue="--" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvExpYear" runat="server" BackColor="Yellow" ControlToValidate="ddlExpYear" Display="Dynamic" ErrorMessage="Expiration year cannot be empty." ForeColor="Red" InitialValue="----" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCode" runat="server" BackColor="Yellow" ControlToValidate="txtCode" ErrorMessage="Code cannot be empty." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" class="auto-style5"></td>
                    </tr>
               </table>
               
                <table>
                   <h2 style="background-color:powderblue; font-family: 'Times New Roman'; color: #000000; text-align: left;">Billing Information</h2>
                   <tr>
                       <td class="auto-style10" style="font-size: large; font-weight: bold;">First name<br />
                           <asp:TextBox ID="txtFirstName" runat="server" Width="131px"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" BackColor="Yellow" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="First name must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="revFirstName" runat="server" BackColor="Yellow" ControlToValidate="txtFirstName" Display="Dynamic" ErrorMessage="Alphabets and space only. No numbers are allow." ForeColor="Red" ValidationExpression="[a-zA-Z]*$" ValidationGroup="paymentGroup"></asp:RegularExpressionValidator>
                       </td>
                       <td class="auto-style6" style="font-size: large; font-weight: bold;">Last Name<br />
                           <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvLastName" runat="server" BackColor="Yellow" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Last name must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="revLastName" runat="server" BackColor="Yellow" ControlToValidate="txtLastName" Display="Dynamic" ErrorMessage="Alphabets and space only. No numbers are allow." ForeColor="Red" ValidationExpression="[a-zA-Z ]*$" ValidationGroup="paymentGroup"></asp:RegularExpressionValidator>
                       </td>
                       <td style="font-size: large; font-weight: bold;">City<br />
                           <asp:TextBox ID="txtCity" runat="server" Width="213px"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvCity" runat="server" BackColor="Yellow" ControlToValidate="txtCity" ErrorMessage="City must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">&nbsp;</td>
                   </tr>
                   <tr>
                       <td colspan="2" style="font-size: large; font-weight: bold;">Billing address<br />
                           <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvAddress" runat="server" BackColor="Yellow" ControlToValidate="txtAddress" Display="Dynamic" ErrorMessage="Address must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                       </td>
                       <td style="font-size: large; font-weight: bold;">Zip or postal code<br />
                           <asp:TextBox ID="txtPoscode" runat="server"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvPoscode" runat="server" BackColor="Yellow" ControlToValidate="txtPoscode" Display="Dynamic" ErrorMessage="Postal code must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="revPoscode" runat="server" BackColor="Yellow" ControlToValidate="txtPoscode" Display="Dynamic" ErrorMessage="Only 5 numbers are accepted." ForeColor="Red" ValidationExpression="\d{5}" ValidationGroup="paymentGroup"></asp:RegularExpressionValidator>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">&nbsp;</td>
                   </tr>
                   <tr>
                       <td colspan="2" style="font-size: large; font-weight: bold;">Country<br />
                           <asp:DropDownList ID="ddlCountry" runat="server">
                               <asp:ListItem>Malaysia</asp:ListItem>
                               <asp:ListItem>Other...</asp:ListItem>
                           </asp:DropDownList>
                           <asp:RequiredFieldValidator ID="rfvCountry" runat="server" BackColor="Yellow" ControlToValidate="ddlCountry" ErrorMessage="You must select a country." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                       </td>
                       <td style="font-size: large; font-weight: bold;">Phone number<br />
                           <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox><br />
                           <asp:RequiredFieldValidator ID="rfvPhone" runat="server" BackColor="Yellow" ControlToValidate="txtPhone" Display="Dynamic" ErrorMessage="Phone number must be given." ForeColor="Red" ValidationGroup="paymentGroup"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="revPhone" runat="server" BackColor="Yellow" ControlToValidate="txtPhone" ErrorMessage="Phone number must be xxx-xxxxxxx" ForeColor="Red" ValidationExpression="^(\+?6?01)[0-46-9]-*[0-9]{7,8}$" ValidationGroup="paymentGroup"></asp:RegularExpressionValidator>
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">
                           <asp:CheckBox ID="cbxAgree" runat="server" AutoPostBack="true" OnCheckedChanged="cbxAgree_CheckedChanged" Text="I agree that the information above is correct." /><br />
                       </td>
                   </tr>
                   <tr>
                       <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                           <asp:Button ID="btnCheckout" runat="server" CommandName="NextView" Enabled="false" OnClick="btnCheckout_Click" Text="Checkout" ValidationGroup="paymentGroup" /><br />
                           <asp:Label ID="lblResult" runat="server"></asp:Label>
                       </td>
                   </tr>
               </table>
           </asp:View>

           <asp:View ID="viewReceipt" runat="server">
               <h1 style="background-color:rgb(136, 186, 237); font-family: 'Times New Roman'; color: #000000;">Purchase Receipt</h1>
               <asp:Label ID="lblUser" runat="server" Font-Size="Larger"></asp:Label>
               <asp:GridView ID="grvReceipt" runat="server" OnRowDataBound="grvReceipt_RowDataBound" AutoGenerateColumns="False" CellPadding="4" GridLines="None" Width="100%" RowStyle-HorizontalAlign="Center" ForeColor="#333333">
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   <Columns>
                       <asp:BoundField DataField="Name" HeaderText="Items" HeaderStyle-Font-Size="X-Large" HeaderStyle-Height="30px" ItemStyle-Font-Size="Larger"></asp:BoundField>
                       <asp:BoundField DataField="Price" HeaderText="Price per Unit" DataFormatString="{0:c}" HeaderStyle-Font-Size="X-Large" HeaderStyle-Height="30px" ItemStyle-Font-Size="Larger"></asp:BoundField>
                   </Columns>
                   <EditRowStyle BackColor="#999999" />
                   <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                   <SortedAscendingCellStyle BackColor="#E9E7E2" />
                   <SortedAscendingHeaderStyle BackColor="#506C8C" />
                   <SortedDescendingCellStyle BackColor="#FFFDF8" />
                   <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
               </asp:GridView><hr />
                
               <table style="text-align: right" class="auto-style8">
                   <tr>
                       <td style="font-size: large">
                           <asp:Label ID="lblTotalPrice" runat="server" Font-Bold="true" ></asp:Label>
                       </td>
                   </tr>
                   <tr>
                       <td style="font-size: large">
                           <asp:Label ID="lblMethod" runat="server" ></asp:Label><hr />&nbsp;&nbsp;
                       </td>
                   </tr>
                   <tr>
                       <td style="text-align: center"> 
                           <asp:Image ID="imgDone" runat="server" ImageUrl="~/images/TeamsImage/Complete_icon.png" Height="100px" Width="100px" />
                       </td>
                   </tr>
                   <tr>
                       <td style="text-align: center; font-size: x-large;">Transaction Complete!<br />
                           Thanks for Purchasing!</td>
                   </tr>
                   <tr>
                       <td style="text-align: center">
                           <asp:Button ID="txtDone" runat="server" CssClass="auto-style6" Height="37px" Text="Done" Width="97px" OnClick="txtDone_Click" />
                           <asp:Label ID="lblStatus" runat="server" ></asp:Label>
                       </td>
                   </tr>
               </table>
           </asp:View>
       </asp:MultiView>
   </div>
</asp:Content>