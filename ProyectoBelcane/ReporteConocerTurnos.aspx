<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteConocerTurnos.aspx.cs" Inherits="ProyectoBelcane.ReporteConocerTurnos" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" Height="1000px" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="870px">
            <LocalReport ReportPath="ReporteTurnos.rdlc">
                <DataSources>
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetObtenerEstadisticasTurnosTresMesesAtras" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSetObtenerEstadisticasTurnosDosMesesAtras" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSetObtenerEstadisticasTurnosMesAnterior" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSetEstadisticasTurnosMesEnCursoEnAdelante" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DataSetListadoTurnosMesAnterior" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DataSetListadoTurnosMesEnCursoEnAdelante" />
                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DataSetObtenerDatosGrafico" />
                </DataSources>
            </LocalReport>
        </rsweb:ReportViewer>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoTurnosMesEnCursoEnAdelanteTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoTurnosMesAnteriorTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasTurnosMesEnCursoEnAdelanteTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasTurnosMesAnteriorTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasTurnosDosMesesAtrasTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasTurnosTresMesesAtrasTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerDatosGraficoTableAdapter"></asp:ObjectDataSource>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    </form>
    </body>
</html>
