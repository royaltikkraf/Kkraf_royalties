Public Class FormAuthor
    Inherits System.Web.UI.UserControl

    Dim clss As New Clss
    Dim strTest As String
    Dim Query As String

    Public Property PassValue() As String
        Get
            Return strTest
        End Get

        Set(ByVal Value As String)
            strTest = Value
        End Set

    End Property

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        lblID.Text = Me.strTest

        Dim dT As DataTable

        Query = "Select * From infAuthor WHERE id = " & lblID.Text & " Order by Name ASC"
        dT = Clss.ExecuteDataTable(Query, "Order")
        If dT Is Nothing Then
            lblErrMsg.Text = String.Format("ERROR : Bind Data ({0})!", Clss.oErrMsg)
        ElseIf Not dT Is Nothing Then

            FormView1.DataSource = dT
            FormView1.DataBind()
            ViewState.Add("Senarai", dT)
            dT.Dispose()
        End If
    End Sub

End Class