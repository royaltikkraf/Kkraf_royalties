Imports Microsoft.VisualBasic
Imports System
Imports System.Collections.Generic
Imports System.Linq
Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports DevExpress.Web.ASPxGridView

Public Class u_Product
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Grid.JSProperties("cpIsUpdated") = ""
    End Sub

    Protected Sub Grid_RowUpdated(sender As Object, e As DevExpress.Web.Data.ASPxDataUpdatedEventArgs)
        If e.Exception Is Nothing Then
            CType(sender, ASPxGridView).JSProperties("cpIsUpdated") = e.Keys(0)
        End If
    End Sub
End Class