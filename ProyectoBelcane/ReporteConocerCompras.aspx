<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReporteConocerCompras.aspx.cs" Inherits="ProyectoBelcane.ReporteConocerCompras" %>

<%@ Register assembly="Microsoft.ReportViewer.WebForms" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <rsweb:ReportViewer ID="ReportViewer1" runat="server" BackColor="" ClientIDMode="AutoID" HighlightBackgroundColor="" InternalBorderColor="204, 204, 204" InternalBorderStyle="Solid" InternalBorderWidth="1px" LinkActiveColor="" LinkActiveHoverColor="" LinkDisabledColor="" PrimaryButtonBackgroundColor="" PrimaryButtonForegroundColor="" PrimaryButtonHoverBackgroundColor="" PrimaryButtonHoverForegroundColor="" SecondaryButtonBackgroundColor="" SecondaryButtonForegroundColor="" SecondaryButtonHoverBackgroundColor="" SecondaryButtonHoverForegroundColor="" SplitterBackColor="" ToolbarDividerColor="" ToolbarForegroundColor="" ToolbarForegroundDisabledColor="" ToolbarHoverBackgroundColor="" ToolbarHoverForegroundColor="" ToolBarItemBorderColor="" ToolBarItemBorderStyle="Solid" ToolBarItemBorderWidth="1px" ToolBarItemHoverBackColor="" ToolBarItemPressedBorderColor="51, 102, 153" ToolBarItemPressedBorderStyle="Solid" ToolBarItemPressedBorderWidth="1px" ToolBarItemPressedHoverBackColor="153, 187, 226" Width="878px" Height="998px">
                <LocalReport ReportPath="ReporteCompras.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSetObtenerDatosGraficoCompras" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource2" Name="DataSetObtenerListadoComprasMesActual" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource3" Name="DataSetObtenerListadoComprasMesAnterior" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource4" Name="DataSetObtenerEstadisticasComprasMesActual" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource5" Name="DataSetObtenerEstadisticasComprasMesAnterior" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource6" Name="DataSetObtenerEstadisticasComprasDosMesesAtras" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource7" Name="DataSetObtenerEstadisticasComprasTresMesesAtras" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource8" Name="DataSetObtenerListadoDetalleComprasMesActual" />
                        <rsweb:ReportDataSource DataSourceId="ObjectDataSource9" Name="DataSetObtenerListadoDetalleComprasMesAnterior" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerDatosGraficoComprasTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoComprasMesActualTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoComprasMesAnteriorTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasComprasMesActualTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource5" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasComprasMesAnteriorTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource6" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasComprasDosMesesAtrasTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource7" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerEstadisticasComprasTresMesesAtrasTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource8" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoDetalleComprasMesActualTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ObjectDataSource9" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="ProyectoBelcane.DataSetMascotasTableAdapters.ObtenerListadoDetalleComprasMesAnteriorTableAdapter"></asp:ObjectDataSource>
    </form>
</body>
</html>
