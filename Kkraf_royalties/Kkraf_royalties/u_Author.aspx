﻿<%@ Page Title="Author" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="u_Author.aspx.vb" Inherits="Kkraf_royalties.u_Author" %>

<%@ Register Src="FormAuthor.ascx" TagName="FormAuthor" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="PanelGrid" runat="server">
        <asp:Label ID="lblStaffID" runat="server"></asp:Label>
        <asp:Label ID="SortExp" runat="server"></asp:Label>
        <asp:Label ID="lblErrMsg" runat="server"></asp:Label>
        <asp:DataGrid ID="Senarai" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="3" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="Black" GridLines="Horizontal" HeaderStyle-BackColor="Blue" HeaderStyle-ForeColor="White" PagerStyle-Visible="True" Style="border-right: black thin solid; border-top: black thin solid; border-left: black thin solid; border-bottom: black thin solid" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" HorizontalAlign="Justify">
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:ButtonColumn CommandName="Select" Text="&gt;&gt;" ButtonType="PushButton"></asp:ButtonColumn>
                <asp:BoundColumn DataField="id" HeaderText="S/N" SortExpression="id"></asp:BoundColumn>
                <asp:BoundColumn DataField="nickname" HeaderText="Nama" SortExpression="nickname"></asp:BoundColumn>
                <asp:BoundColumn DataField="hphone" HeaderText="HP" SortExpression="hphone"></asp:BoundColumn>
                <asp:BoundColumn DataField="address_email" HeaderText="e-mail" SortExpression="address_email"></asp:BoundColumn>
                <asp:BoundColumn DataField="status" HeaderText="Status" SortExpression="status"></asp:BoundColumn>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Justify" VerticalAlign="Middle" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Mode="NumericPages" VerticalAlign="Middle" />
            <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        </asp:DataGrid>
        <asp:SqlDataSource ID="Author" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT [id], [nickname], [HPhone], [address_email], [Status] FROM [infAuthor]"></asp:SqlDataSource>
        <asp:Button ID="btnCreate" runat="server" Text="Create New" />
    </asp:Panel>
    <asp:Panel ID="PanelDetail" runat="server" Visible="False">
        <table>
            <tr>
                <td style="vertical-align: top; text-align: left">S/N</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Name</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Nickname</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtNickname" runat="server" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNickname" ErrorMessage="Nickname" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">NRIC</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtIC" runat="server" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIC" ErrorMessage="NRIC" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Telephone (HP)</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtHPhone" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Telephone (Fax)</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtFax" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Address (Mailing)</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtAddMailing" runat="server" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Address (Permanent)</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtAddPermanent" runat="server" Height="100px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAddPermanent" ErrorMessage="Address (Permanent)" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">e-Mail</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Date Join</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtDateJoin" runat="server" Width="80px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDateJoin" ErrorMessage="Date Join" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <cc1:CalendarExtender ID="txtDateJoin_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDateJoin" Format="dd/MM/yyyy">
                    </cc1:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Website</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtWebsite" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">facebook</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtFacebook" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Twitter</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtTwitter" runat="server" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Status</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server" DataSourceID="Status" DataTextField="Desc" DataValueField="Status">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Status" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT Status, [Desc] FROM ConfStatus ORDER BY [Desc]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Bank No</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:TextBox ID="txtBankNo" runat="server" Width="400px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtBankNo" ErrorMessage="Bank No" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Bank Name</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:DropDownList ID="ddlBankName" runat="server" DataSourceID="Bank" DataTextField="Desc" DataValueField="Name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="Bank" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT [Name], [Desc] FROM [ConfBankName] ORDER BY [Desc]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Payment type</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:DropDownList ID="ddlPaymentType" runat="server" DataSourceID="PaymentType" DataTextField="Desc" DataValueField="Name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="PaymentType" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT [Name], [Desc] FROM [ConfPaymentType] ORDER BY [Desc]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">Author Type</td>
                <td style="vertical-align: top; text-align: left">:</td>
                <td>
                    <asp:DropDownList ID="ddlAuthorType" runat="server" DataSourceID="AuthorType" DataTextField="Desc" DataValueField="Name">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="AuthorType" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT [Name], [Desc] FROM [ConfAuthorType] ORDER BY [Desc]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td style="vertical-align: top; text-align: left">&nbsp;</td>
                <td style="vertical-align: top; text-align: left">&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" HeaderText="Error - Validation" ShowMessageBox="True" />
                    <asp:Button ID="btnCancel" runat="server" CausesValidation="False" Text="Cancel" />
                    <asp:Button ID="btnSave" runat="server" Text="Save" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>