<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ConnDBase.aspx.vb" Inherits="Kkraf_royalties.ConnDBase" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.2" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <dx:ASPxGridView ID="Grid" runat="server" AutoGenerateColumns="False" DataSourceID="Royalties" KeyFieldName="id" OnRowUpdated="Grid_RowUpdated" ClientIDMode="AutoID">
        <ClientSideEvents EndCallback="function(s, e) 
            {
	        if (s.cpIsUpdated != '')
    	        {
	            clientLabel.SetText('The category '+s.cpIsUpdated+' is updated successfully');
	            clientLabel.GetMainElement().style.backgroundColor = 'green';
	            clientLabel.GetMainElement().style.color = 'white';
	            }
	        else
    	        {
	            clientLabel.SetText('');
	            }
            }" />
        <Columns>
            <dx:GridViewCommandColumn ShowInCustomizationForm="True" VisibleIndex="0">
                <EditButton Visible="True">
                </EditButton>
                <NewButton Visible="True">
                </NewButton>
                <DeleteButton Visible="True">
                </DeleteButton>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" VisibleIndex="0" ReadOnly="True" Caption="S/N">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Title" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Catagory1" VisibleIndex="3" Caption="Category">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Catagory2" VisibleIndex="4" Caption="Sub Category">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="imprint" VisibleIndex="6" Caption="Imprint">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ISBN" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="PubDate" VisibleIndex="7">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FirstPrintDate" VisibleIndex="8">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="CopyrightDate" VisibleIndex="9">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="language" VisibleIndex="10" Caption="Language">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Status" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowFilterRow="True" ShowGroupPanel="True" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="Royalties" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" 
        SelectCommand="SELECT * FROM ConfTitles" 
        DeleteCommand="DELETE FROM ConfTitles WHERE (id = @id)" 
        UpdateCommand="UPDATE ConfTitles SET Status = @Status, imprint = @Imprint, Catagory1 = @Category1, Catagory2 = @Catagory2, Title = @Title WHERE (id = @id)" 
        InsertCommand="INSERT INTO ConfTitles(ItemCode, ISBN, PubDate, FirstPrintDate, Status, CopyrightDate, imprint, language, Catagory1, Catagory2, Title) VALUES (@ItemCode, @ISBN, @PubDate, @FirstPrintDate, @Status, @CopyrightDate, @Imprint, @Language, @Category1, @Category2, @Title)">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ItemCode" Type="String" />
            <asp:Parameter Name="ISBN" Type="String" />
            <asp:Parameter Name="PubDate" Type="DateTime" />
            <asp:Parameter Name="FirstPrintDate" Type="DateTime" />
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="CopyrightDate" Type="DateTime" />
            <asp:Parameter Name="Imprint" Type="String" />
            <asp:Parameter Name="Language" Type="String" />
            <asp:Parameter Name="Category1" Type="String" />
            <asp:Parameter Name="Category2" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Status" Type="String" />
            <asp:Parameter Name="Imprint" Type="String" />
            <asp:Parameter Name="Category1" Type="String" />
            <asp:Parameter Name="Catagory2" Type="String" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientInstanceName="clientLabel">
    </dx:ASPxLabel>
</asp:Content>
