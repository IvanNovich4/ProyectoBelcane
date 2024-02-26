<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConocerTurnos.aspx.cs" Inherits="ProyectoBelcane.ConocerTurnos" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .gridview-container {
            height: 320px; /* Ajusta esta altura según tus necesidades */
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <header style="display: flex; justify-content: center; align-items: center; padding: 20px; border-bottom: 1px solid #ccc;">
                <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img src="imagenes/BELCANE2.png" width="70px" />
                    <span class="fs-4">BELCANE</span>
                </a>

                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <asp:Button ID="Button1" CssClass="btn btn-outline-dark" runat="server" Text="Retornar" OnClick="Button1_Click" CausesValidation="False" /></li>
                    &nbsp;&nbsp;
 
                </ul>
            </header>
            <br />

            <h3 align="center">Conocer Turnos </h3>
            <br />
            <br />
            <div class="container">
                <div class="row">
                    <div class="col-md-2"><b>Conocer Turnos Desde :</b></div>
                    <div class="col-md-2">
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                    <div class="col-md-2" align="center"><b>hasta el día</b></div>
                    <div class="col-md-2">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                    <div class="col-md-4" align="right">
                        <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Width="71%" Text="Buscar Turnos" OnClick="Button2_Click" /></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2"><b>(Agre. Filtro Servicios)</b></div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" Width="100%" DataSourceID="DSServicios" DataTextField="nombreServicio" DataValueField="idServicio">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="Button4" CssClass="btn btn-dark" Width="100%" runat="server" OnClick="Button4_Click" Text="Quitar Filtro" /></div>
                    <div class="col-md-4">
                        <asp:Label ID="Label4" runat="server"></asp:Label></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6"> <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" Text="Ver Turnos de hoy en adelante" OnClick="Button3_Click" /></div>
                    <div class="col-md-6" align="right"><asp:Button ID="Button5" CssClass="btn btn-dark" runat="server" OnClick="Button5_Click" Text="Generar Informe completo de Turnos" /></div>
                </div>
                <br />
                <br />
                <div class="row">
                    <div class="col-md-7">
                        <b><asp:Label ID="Label1" runat="server"></asp:Label></b>
                        <br />
                        <br />
                        <b><asp:Label ID="Label2" runat="server"></asp:Label></b>

                        <br />
                        <br />
                        <b><asp:Label ID="Label17" runat="server"></asp:Label></b>
                        <br />
                        <br />
                        <b><asp:Label ID="Label18" runat="server"></asp:Label></b>
                        <br />
                        <br />
                        </div>
                    <div class="col-md-5" align="right">
                        <asp:Chart ID="Chart1" runat="server" Palette="Excel" Width="461px" BackColor="Thistle" BackImageTransparentColor="White" Height="170px" BorderlineColor="MediumSlateBlue">
                            <Series>
                                <asp:Series Name="Series1" YValuesPerPoint="2" IsValueShownAsLabel="True">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea Name="ChartArea1">
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                        </div>
                    <br />
                        <div class="gridview-container">
                            <asp:Label ID="Label3" runat="server"></asp:Label>
                        </div>
                        <br />
                        <br />
                        <br />
                        
                        <br />
                        <asp:Label ID="Label5" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label7" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label10" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label11" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />
                        <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label15" runat="server" Text="Label" Visible="False"></asp:Label>
                        <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label>
                        <br />

                    </div>


                </div>
            </div>


        
        <asp:SqlDataSource ID="DSTurnos" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT FORMAT(tu.fechaTurno, 'dd-MM-yyyy') AS fecha_formato, tu.horario, mas.nombreMascota, tu.codigoCliente, cli.nombre, cli.apellido, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto, ra.nombreRaza, FORMAT(det.importeTurno, 'C', 'es-AR') AS importeTurnoConSigno, tu.usuario FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde) AND (tu.fechaTurno &lt;= @fechaHasta) ORDER BY tu.fechaTurno, tu.horario">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
                <asp:Parameter Name="fechaHasta" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRegTot" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnos, FORMAT(SUM(det.importeTurno), '$#,0.00') AS sumaTotal, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde) AND (tu.fechaTurno &lt;= @fechaHasta)">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
                <asp:Parameter Name="fechaHasta" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSServicios" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idServicio, nombreServicio FROM servicios"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTurnosFiltrados" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT FORMAT(tu.fechaTurno, 'dd-MM-yyyy') AS fecha_formato, tu.horario, mas.nombreMascota, tu.codigoCliente, cli.nombre, cli.apellido, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto, ra.nombreRaza, FORMAT(det.importeTurno, 'C', 'es-AR') AS importeTurnoConSigno, tu.usuario FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde) AND (tu.fechaTurno &lt;= @fechaHasta) AND (det.codigoServicio = @codigoServicio) ORDER BY tu.fechaTurno, tu.horario">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
                <asp:Parameter Name="fechaHasta" />
                <asp:Parameter Name="codigoServicio" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTurnosPorDefecto" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT FORMAT(tu.fechaTurno, 'dd-MM-yyyy') AS fecha_formato, tu.horario, mas.nombreMascota, tu.codigoCliente, cli.nombre, cli.apellido, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto, ra.nombreRaza, FORMAT(det.importeTurno, 'C', 'es-AR') AS importeTurnoConSigno, tu.usuario FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde) ORDER BY tu.fechaTurno, tu.horario">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSNombreServ" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idServicio, nombreServicio FROM servicios WHERE (idServicio = @idServicio)">
            <SelectParameters>
                <asp:Parameter Name="idServicio" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRegTotFiltrado" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnos, FORMAT(SUM(det.importeTurno), '$#,0.00') AS sumaTotal, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde) AND (tu.fechaTurno &lt;= @fechaHasta) AND (ser.idServicio = @idServicio)">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
                <asp:Parameter Name="fechaHasta" />
                <asp:Parameter Name="idServicio" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRegTotDefecto" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnos, FORMAT(SUM(det.importeTurno), '$#,0.00') AS sumaTotal, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (tu.fechaTurno &gt;= @fechaDesde)">
            <SelectParameters>
                <asp:Parameter Name="fechaDesde" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSprueba" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnos, FORMAT(SUM(det.importeTurno), '$#,0.00') AS sumaTotal FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (MONTH(tu.fechaTurno) = MONTH(DATEADD(MONTH, - 2, GETDATE()))) AND (YEAR(tu.fechaTurno) = YEAR(DATEADD(MONTH, - 1, GETDATE())))"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnosUno, SUM(det.importeTurno) AS sumaTotalUno, DATENAME(MONTH, DATEADD(MONTH, - 1, GETDATE())) AS NombreUnoMesAnterior, YEAR(DATEADD(MONTH, - 1, GETDATE())) AS AnioUnoMesAnterior, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (MONTH(tu.fechaTurno) = MONTH(DATEADD(MONTH, - 1, GETDATE()))) AND (YEAR(tu.fechaTurno) = YEAR(DATEADD(MONTH, - 1, GETDATE())))"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDosMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnosDos, SUM(det.importeTurno) AS sumaTotalDos, DATENAME(MONTH, DATEADD(MONTH, - 2, GETDATE())) AS NombreDosMesAnterior, YEAR(DATEADD(MONTH, - 2, GETDATE())) AS AnioDosMesAnterior, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (MONTH(tu.fechaTurno) = MONTH(DATEADD(MONTH, - 2, GETDATE()))) AND (YEAR(tu.fechaTurno) = YEAR(DATEADD(MONTH, - 2, GETDATE())))"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTresMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadTurnosTres, SUM(det.importeTurno) AS sumaTotalTres, DATENAME(MONTH, DATEADD(MONTH, - 3, GETDATE())) AS NombreTresMesAnterior, YEAR(DATEADD(MONTH, - 3, GETDATE())) AS AnioTresMesAnterior, SUM(CASE WHEN mas.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadTurnosMachos, SUM(CASE WHEN mas.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadTurnosHembras, SUM(CASE WHEN mas.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN mas.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza WHERE (MONTH(tu.fechaTurno) = MONTH(DATEADD(MONTH, - 3, GETDATE()))) AND (YEAR(tu.fechaTurno) = YEAR(DATEADD(MONTH, - 3, GETDATE())))"></asp:SqlDataSource>
    </form>
</body>
</html>
