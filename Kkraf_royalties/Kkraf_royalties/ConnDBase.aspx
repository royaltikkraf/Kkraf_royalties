<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConnDBase.aspx.vb" Inherits="Kkraf_royalties.ConnDBase" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.2" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientIDMode="AutoID" DataSourceID="Royalties">
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
            <ClearFilterButton Visible="True">
            </ClearFilterButton>
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="0">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="ISBN" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="imprint" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="PubDate" VisibleIndex="4">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="FirstPrintDate" VisibleIndex="5">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataDateColumn FieldName="CopyrightDate" VisibleIndex="6">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Catagory1" VisibleIndex="7">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Catagory2" VisibleIndex="8">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="language" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="10">
        </dx:GridViewDataTextColumn>
    </Columns>
    <Settings ShowFilterRow="True" ShowGroupPanel="True" />
</dx:ASPxGridView>
<asp:SqlDataSource ID="Royalties" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" SelectCommand="SELECT ItemCode, ISBN, Title, imprint, PubDate, FirstPrintDate, CopyrightDate, Catagory1, Catagory2, language, Status FROM ConfTitles"></asp:SqlDataSource>
</asp:Content>
