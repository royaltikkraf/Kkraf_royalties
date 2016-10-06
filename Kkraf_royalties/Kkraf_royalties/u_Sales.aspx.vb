Imports System.IO
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Globalization
Imports System.Globalization.CultureInfo
Imports System.Threading

Public Class u_Sales
    Inherits System.Web.UI.Page

    Dim Query As String
    Dim Clss As New Clss
    Dim Result As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Thread.CurrentThread.CurrentCulture = New CultureInfo("en-CA")
        If Not Page.IsPostBack Then
            ddlSalesType.DataBind()
            ddlEntryType.DataBind()
            ddlChannelType.DataBind()
            If SortExp.Text = "" Then
                LoadGridSales("", "")
            Else
                LoadGridSales(SortExp.Text, "")
            End If
        End If
    End Sub

    Function LoadGridSales(ByVal SortField As String, ByVal SQuery As String) As Boolean
        Dim dT As DataTable
        Senarai.CurrentPageIndex = 0
        Query = "Select * From infSales Order by SalesDate ASC"
        dT = Clss.ExecuteDataTable(Query, "Senarai")
        If dT Is Nothing Then
            lblErrMsg.Text = String.Format("ERROR : Bind Data ({0})!", Clss.oErrMsg)
        ElseIf Not dT Is Nothing Then
            lblErrMsg.Text = ""
            Senarai.DataSource = dT
            Senarai.DataBind()
            ViewState.Add("Senarai", dT)
            dT.Dispose()
        End If
        Return 0
    End Function

    Private Sub Senarai_SelectedIndexChanged(sender As Object, e As EventArgs) Handles Senarai.SelectedIndexChanged
        Dim code As Integer
        Senarai.CurrentPageIndex = 0
        code = Senarai.SelectedItem.Cells(1).Text
        Result = LoadDetailGridSales(code)
        If Result = True Then
            PanelDetail.Visible = True
            btnUpdate.Visible = True
            btnDelete.Visible = True
            PanelGrid.Visible = False
            btnSave.Visible = False
        Else
            PanelDetail.Visible = False
            btnUpdate.Visible = False
            btnDelete.Visible = False
            PanelGrid.Visible = True
            btnSave.Visible = True
        End If

    End Sub

    Function LoadDetailGridSales(id As Integer) As Boolean
        Query = "Select * From infSales WHERE ID =" & id & ""
        Result = Clss.ExecuteNonQuery_Sales(Query)
        If Result = True Then
            Dim SalesDate As Object

            lblID.Text = Clss.oIDNo

            SalesDate = Clss.oSalesDate
            If SalesDate Is DBNull.Value Or SalesDate = "" Then
                txtSalesDate.Text = ""
            Else
                If SalesDate = "01/01/1900 12:00:00 AM" Or SalesDate = "01/01/1900" Then
                    txtSalesDate.Text = ""
                Else
                    txtSalesDate.Text = Convert.ToDateTime(SalesDate).ToString("dd/MM/yyyy")
                End If
            End If

            txtInvoiceNo.Text = Clss.oInvoiceNo
            lblISBN.Text = Clss.oISBN
            lblItemCode.Text = Clss.oItemCode
            txtTitle.Text = Clss.oTitle
            txtCustomerName.Text = Clss.oCustomerName
            ddlSalesType.SelectedValue = Clss.oSalesType
            ddlEntryType.SelectedValue = Clss.oEntryType
            txtQty.Text = Clss.oQty
            txtRetailPrice.Text = Clss.oRetailPrice
            txtDiscount.Text = Clss.oDiscount
            ddlChannelType.SelectedValue = Clss.oChanneltype
            Result = True
        Else
            ShowPopUpMsg("ERROR : Load Data" & Clss.oErrMsg & "")
            Result = False
        End If
        Return Result
    End Function

    Protected Sub btnUpload_Click(sender As Object, e As EventArgs) Handles btnUpload.Click

        'Upload and save the file
        Dim csvPath As String = Server.MapPath("~/") + Path.GetFileName(FileUpload1.PostedFile.FileName)
        FileUpload1.SaveAs(csvPath)

        Dim dt As New DataTable()
        dt.Columns.AddRange(New DataColumn(2) {New DataColumn("Id", GetType(Integer)), New DataColumn("SalesDate", GetType(String)), New DataColumn("InvoiceNo", GetType(String))})

        Dim csvData As String = File.ReadAllText(csvPath)
        For Each row As String In csvData.Split(ControlChars.Lf)
            If Not String.IsNullOrEmpty(row) Then
                dt.Rows.Add()
                Dim i As Integer = 0
                For Each cell As String In row.Split(","c)
                    dt.Rows(dt.Rows.Count - 1)(i) = cell
                    i += 1
                Next
            End If
        Next

        Dim consString As String = ConfigurationManager.ConnectionStrings("RoyaltiesConn").ConnectionString
        Using con As New SqlConnection(consString)
            Using sqlBulkCopy As New SqlBulkCopy(con)
                'Set the database table name
                sqlBulkCopy.DestinationTableName = "dbo.infSales"
                con.Open()
                sqlBulkCopy.WriteToServer(dt)
                con.Close()
            End Using
        End Using
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        PanelDetail.Visible = False
        PanelGrid.Visible = True
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim SQLQuery As String
        SQLQuery = "INSERT INTO infSales( SalesDate, invoiceNo, ISBN, ItemCode, Title, CustomerName, SalesType, EntryType, Qty, RetailPrice, Discount, ChannelType) VALUES (CONVERT(DATETIME, '" & _
            txtSalesDate.Text & "', 102), '" & txtInvoiceNo.Text & "', '" & lblISBN.Text & "', '" & lblItemCode.Text & "', '" & txtTitle.Text & "', '" & txtCustomerName.Text & "', '" & _
            ddlSalesType.SelectedValue & "', '" & ddlEntryType.SelectedValue & "', " & txtQty.Text & ", " & txtRetailPrice.Text & ", " & txtDiscount.Text & ", '" & ddlChannelType.SelectedValue & "') "
        Result = Clss.ExecuteNonQuery(SQLQuery)
        If Result = True Then
            ShowPopUpMsg("Succes : SAVE Data")
            LoadGridSales("", "")
            PanelDetail.Visible = False
            PanelGrid.Visible = True
        Else
            ShowPopUpMsg("Error : SAVE Data " & Clss.oErrMsg & "")
        End If
    End Sub

    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs) Handles btnUpdate.Click
        Dim SQLQuery As String
        SQLQuery = "UPDATE infSales SET SalesDate = CONVERT(DATETIME, '" & txtSalesDate.Text & "', 102), invoiceNo = '" & txtInvoiceNo.Text & "', ISBN = '" & lblISBN.Text & "', ItemCode = '" & lblItemCode.Text & "', Title = '" & txtTitle.Text & "', CustomerName = '" & txtCustomerName.Text & "', SalesType = '" & ddlSalesType.SelectedValue & "', EntryType = '" & ddlEntryType.SelectedValue & "', Qty = " & txtQty.Text & ", RetailPrice = " & txtRetailPrice.Text & ", Discount = " & txtDiscount.Text & ", ChannelType = '" & ddlChannelType.SelectedValue & "'"
        Result = Clss.ExecuteNonQuery(SQLQuery)
        If Result = True Then
            ShowPopUpMsg("Succes : UPDATE Data")
            LoadGridSales("", "")
            PanelDetail.Visible = False
            PanelGrid.Visible = True
        Else
            ShowPopUpMsg("Error : UPDATE Data " & Clss.oErrMsg & "")
        End If
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click
        Dim SQLQuery As String
        SQLQuery = "DELETE From infSales WHERE ID =" & lblID.Text & ""
        Result = Clss.ExecuteNonQuery(SQLQuery)
        If Result = True Then
            ShowPopUpMsg("Succes : DELETE Data")
            LoadGridSales("", "")
            PanelDetail.Visible = False
            PanelGrid.Visible = True
        Else
            ShowPopUpMsg("Error : DELETE Data " & Clss.oErrMsg & "")
        End If
    End Sub

    Protected Sub btnClear_Click(sender As Object, e As EventArgs) Handles btnClear.Click
        ClearDetailSales()
    End Sub

    Sub ClearDetailSales()
        lblID.Text = ""
        txtSalesDate.Text = ""
        txtInvoiceNo.Text = ""
        lblISBN.Text = ""
        lblItemCode.Text = ""
        txtTitle.Text = ""
        txtCustomerName.Text = ""
        ddlSalesType.DataBind()
        ddlEntryType.DataBind()
        txtQty.Text = ""
        txtRetailPrice.Text = ""
        txtDiscount.Text = ""
        ddlChannelType.DataBind()
    End Sub

    Private Sub ShowPopUpMsg(msg As String)
        Dim sb As New StringBuilder()
        sb.Append("alert('")
        sb.Append(msg.Replace(vbLf, "\n").Replace(vbCr, "").Replace("'", "\'"))
        sb.Append("');")
        ScriptManager.RegisterStartupScript(Me.Page, Me.[GetType](), "showalert", sb.ToString(), True)
    End Sub

    Function TentukanAksaraCalit(ByVal ayat As String) As String
        'On Local Error Resume Next
        Dim i As Integer
        Dim adaCalit As String
        Dim ayatbaru As String
        Dim aksara As String

        adaCalit = InStr(1, ayat, "'")

        If adaCalit > 0 Then
            ayatbaru = ""
            For i = 1 To Len(ayat)
                aksara = Mid$(ayat, i, 1)
                If aksara = "'" Then
                    ayatbaru = ayatbaru & "''"
                Else
                    ayatbaru = ayatbaru & aksara
                End If
            Next i

            TentukanAksaraCalit = ayatbaru
        Else
            TentukanAksaraCalit = ayat
        End If

    End Function

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs) Handles btnCreate.Click
        PanelDetail.Visible = True
        PanelGrid.Visible = False
        btnCreate.Visible = True
        btnUpdate.Visible = False
        btnDelete.Visible = False
        btnSave.Visible = True
        ClearDetailSales()
    End Sub

    Protected Sub btnSearchTitle_Click(sender As Object, e As EventArgs) Handles btnSearchTitle.Click
        Query = "Select * From infTitles WHERE Title like '%" & txtTitle.Text & "%'"
        Result = Clss.ExecuteNonQuery_Title(Query)
        If Result = True Then
            lblISBN.Text = Clss.oISBN
            lblItemCode.Text = Clss.oItemCode
            txtTitle.Text = Clss.oTitle
            txtRetailPrice.Text = Clss.oCoverPrice
            Result = True
        Else
            ShowPopUpMsg("ERROR : Load Data" & Clss.oErrMsg & "")
            Result = False
        End If

    End Sub
End Class