<%@ Control Language="vb" AutoEventWireup="false" CodeBehind="FormAuthor.ascx.vb" Inherits="Kkraf_royalties.FormAuthor" %>
<asp:Label ID="lblID" runat="server"></asp:Label>
<asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
    <EditItemTemplate>
        name:
        <asp:DynamicControl ID="nameDynamicControl" runat="server" DataField="name" Mode="Edit" />
        <br />
        nickname:
        <asp:DynamicControl ID="nicknameDynamicControl" runat="server" DataField="nickname" Mode="Edit" />
        <br />
        IC:
        <asp:DynamicControl ID="ICDynamicControl" runat="server" DataField="IC" Mode="Edit" />
        <br />
        HPhone:
        <asp:DynamicControl ID="HPhoneDynamicControl" runat="server" DataField="HPhone" Mode="Edit" />
        <br />
        fax:
        <asp:DynamicControl ID="faxDynamicControl" runat="server" DataField="fax" Mode="Edit" />
        <br />
        address_mail:
        <asp:DynamicControl ID="address_mailDynamicControl" runat="server" DataField="address_mail" Mode="Edit" />
        <br />
        address_Permanent:
        <asp:DynamicControl ID="address_PermanentDynamicControl" runat="server" DataField="address_Permanent" Mode="Edit" />
        <br />
        address_email:
        <asp:DynamicControl ID="address_emailDynamicControl" runat="server" DataField="address_email" Mode="Edit" />
        <br />
        DateJoin:
        <asp:DynamicControl ID="DateJoinDynamicControl" runat="server" DataField="DateJoin" Mode="Edit" />
        <br />
        website:
        <asp:DynamicControl ID="websiteDynamicControl" runat="server" DataField="website" Mode="Edit" />
        <br />
        facebook:
        <asp:DynamicControl ID="facebookDynamicControl" runat="server" DataField="facebook" Mode="Edit" />
        <br />
        twitter:
        <asp:DynamicControl ID="twitterDynamicControl" runat="server" DataField="twitter" Mode="Edit" />
        <br />
        Status:
        <asp:DynamicControl ID="StatusDynamicControl" runat="server" DataField="Status" Mode="Edit" />
        <br />
        BankNo:
        <asp:DynamicControl ID="BankNoDynamicControl" runat="server" DataField="BankNo" Mode="Edit" />
        <br />
        BankName:
        <asp:DynamicControl ID="BankNameDynamicControl" runat="server" DataField="BankName" Mode="Edit" />
        <br />
        PaymentType:
        <asp:DynamicControl ID="PaymentTypeDynamicControl" runat="server" DataField="PaymentType" Mode="Edit" />
        <br />
        AuthorType:
        <asp:DynamicControl ID="AuthorTypeDynamicControl" runat="server" DataField="AuthorType" Mode="Edit" />
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Insert" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
    <FooterStyle BackColor="#CCCCCC" />
    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
    <InsertItemTemplate>
        name:
        <asp:DynamicControl ID="nameDynamicControl" runat="server" DataField="name" Mode="Insert" ValidationGroup="Insert" />
        <br />
        nickname:
        <asp:DynamicControl ID="nicknameDynamicControl" runat="server" DataField="nickname" Mode="Insert" ValidationGroup="Insert" />
        <br />
        IC:
        <asp:DynamicControl ID="ICDynamicControl" runat="server" DataField="IC" Mode="Insert" ValidationGroup="Insert" />
        <br />
        HPhone:
        <asp:DynamicControl ID="HPhoneDynamicControl" runat="server" DataField="HPhone" Mode="Insert" ValidationGroup="Insert" />
        <br />
        fax:
        <asp:DynamicControl ID="faxDynamicControl" runat="server" DataField="fax" Mode="Insert" ValidationGroup="Insert" />
        <br />
        address_mail:
        <asp:DynamicControl ID="address_mailDynamicControl" runat="server" DataField="address_mail" Mode="Insert" ValidationGroup="Insert" />
        <br />
        address_Permanent:
        <asp:DynamicControl ID="address_PermanentDynamicControl" runat="server" DataField="address_Permanent" Mode="Insert" ValidationGroup="Insert" />
        <br />
        address_email:
        <asp:DynamicControl ID="address_emailDynamicControl" runat="server" DataField="address_email" Mode="Insert" ValidationGroup="Insert" />
        <br />
        DateJoin:
        <asp:DynamicControl ID="DateJoinDynamicControl" runat="server" DataField="DateJoin" Mode="Insert" ValidationGroup="Insert" />
        <br />
        website:
        <asp:DynamicControl ID="websiteDynamicControl" runat="server" DataField="website" Mode="Insert" ValidationGroup="Insert" />
        <br />
        facebook:
        <asp:DynamicControl ID="facebookDynamicControl" runat="server" DataField="facebook" Mode="Insert" ValidationGroup="Insert" />
        <br />
        twitter:
        <asp:DynamicControl ID="twitterDynamicControl" runat="server" DataField="twitter" Mode="Insert" ValidationGroup="Insert" />
        <br />
        Status:
        <asp:DynamicControl ID="StatusDynamicControl" runat="server" DataField="Status" Mode="Insert" ValidationGroup="Insert" />
        <br />
        BankNo:
        <asp:DynamicControl ID="BankNoDynamicControl" runat="server" DataField="BankNo" Mode="Insert" ValidationGroup="Insert" />
        <br />
        BankName:
        <asp:DynamicControl ID="BankNameDynamicControl" runat="server" DataField="BankName" Mode="Insert" ValidationGroup="Insert" />
        <br />
        PaymentType:
        <asp:DynamicControl ID="PaymentTypeDynamicControl" runat="server" DataField="PaymentType" Mode="Insert" ValidationGroup="Insert" />
        <br />
        AuthorType:
        <asp:DynamicControl ID="AuthorTypeDynamicControl" runat="server" DataField="AuthorType" Mode="Insert" ValidationGroup="Insert" />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        name:
        <asp:DynamicControl ID="nameDynamicControl" runat="server" DataField="name" Mode="ReadOnly" />
        <br />
        nickname:
        <asp:DynamicControl ID="nicknameDynamicControl" runat="server" DataField="nickname" Mode="ReadOnly" />
        <br />
        IC:
        <asp:DynamicControl ID="ICDynamicControl" runat="server" DataField="IC" Mode="ReadOnly" />
        <br />
        HPhone:
        <asp:DynamicControl ID="HPhoneDynamicControl" runat="server" DataField="HPhone" Mode="ReadOnly" />
        <br />
        fax:
        <asp:DynamicControl ID="faxDynamicControl" runat="server" DataField="fax" Mode="ReadOnly" />
        <br />
        address_mail:
        <asp:DynamicControl ID="address_mailDynamicControl" runat="server" DataField="address_mail" Mode="ReadOnly" />
        <br />
        address_Permanent:
        <asp:DynamicControl ID="address_PermanentDynamicControl" runat="server" DataField="address_Permanent" Mode="ReadOnly" />
        <br />
        address_email:
        <asp:DynamicControl ID="address_emailDynamicControl" runat="server" DataField="address_email" Mode="ReadOnly" />
        <br />
        DateJoin:
        <asp:DynamicControl ID="DateJoinDynamicControl" runat="server" DataField="DateJoin" Mode="ReadOnly" />
        <br />
        website:
        <asp:DynamicControl ID="websiteDynamicControl" runat="server" DataField="website" Mode="ReadOnly" />
        <br />
        facebook:
        <asp:DynamicControl ID="facebookDynamicControl" runat="server" DataField="facebook" Mode="ReadOnly" />
        <br />
        twitter:
        <asp:DynamicControl ID="twitterDynamicControl" runat="server" DataField="twitter" Mode="ReadOnly" />
        <br />
        Status:
        <asp:DynamicControl ID="StatusDynamicControl" runat="server" DataField="Status" Mode="ReadOnly" />
        <br />
        BankNo:
        <asp:DynamicControl ID="BankNoDynamicControl" runat="server" DataField="BankNo" Mode="ReadOnly" />
        <br />
        BankName:
        <asp:DynamicControl ID="BankNameDynamicControl" runat="server" DataField="BankName" Mode="ReadOnly" />
        <br />
        PaymentType:
        <asp:DynamicControl ID="PaymentTypeDynamicControl" runat="server" DataField="PaymentType" Mode="ReadOnly" />
        <br />
        AuthorType:
        <asp:DynamicControl ID="AuthorTypeDynamicControl" runat="server" DataField="AuthorType" Mode="ReadOnly" />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
    </ItemTemplate>
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
</asp:FormView>
<asp:SqlDataSource ID="Author" runat="server" ConnectionString="<%$ ConnectionStrings:RoyaltiesConn %>" DeleteCommand="DELETE FROM infAuthor WHERE (id = @ID)" SelectCommand="SELECT name, nickname, IC, HPhone, fax, address_mail, address_Permanent, address_email, DateJoin, website, facebook, twitter, Status, BankNo, BankName, PaymentType, AuthorType FROM infAuthor WHERE (id = @ID)" UpdateCommand="UPDATE infAuthor SET name = @name, nickname = @nickname, IC = @ic, HPhone = @hphone, fax = @fax, address_mail = @mail, address_Permanent = @address, address_email = @email, website = @website, facebook = @Facebook, twitter = @twitter, Status = @Status, BankNo = @bankNo, BankName = @BankName, PaymentType = @paymentType, AuthorType = @AuthorType WHERE (id = @ID)">
    <DeleteParameters>
        <asp:Parameter Name="ID" />
    </DeleteParameters>
    <SelectParameters>
        <asp:ControlParameter ControlID="lblID" Name="ID" PropertyName="Text" />
    </SelectParameters>
    <UpdateParameters>
        <asp:Parameter Name="name" />
        <asp:Parameter Name="nickname" />
        <asp:Parameter Name="ic" />
        <asp:Parameter Name="hphone" />
        <asp:Parameter Name="fax" />
        <asp:Parameter Name="mail" />
        <asp:Parameter Name="address" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="website" />
        <asp:Parameter Name="Facebook" />
        <asp:Parameter Name="twitter" />
        <asp:Parameter Name="Status" />
        <asp:Parameter Name="bankNo" />
        <asp:Parameter Name="BankName" />
        <asp:Parameter Name="paymentType" />
        <asp:Parameter Name="AuthorType" />
        <asp:Parameter Name="ID" />
    </UpdateParameters>
</asp:SqlDataSource>
<asp:Label ID="lblErrMsg" runat="server" ForeColor="Red"></asp:Label>

