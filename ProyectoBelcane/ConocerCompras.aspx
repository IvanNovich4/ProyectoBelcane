<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConocerCompras.aspx.cs" Inherits="ProyectoBelcane.ConocerCompras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .gridview-container {
            height: 280px; /* Ajusta esta altura según tus necesidades */
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

            <h3 align="center">Conocer Compras </h3>
            <br />
            <br />
            <div class="row">
                <div class="col-md-2"><b>Conocer compras desde :</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                <div class="col-md-1" align="center"><b>hasta el</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox></div>
                <div class="col-md-5" align="right"><asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Buscar Compras" Width="300px" /></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-8"><asp:Label ID="Label5" runat="server"></asp:Label>
                    <br /><br /><br /><b><asp:Label ID="Label9" runat="server"></asp:Label></b>
                </div>
                <div class="col-md-4" align="right"><asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Generar Informe Completo de Compras" Width="300px" />
                    <br /><br /><asp:Chart ID="Chart1" runat="server" BackColor="Thistle" Palette="Excel" Height="170px" Width="420px">
                <Series>
                    <asp:Series IsValueShownAsLabel="True" Name="Series1">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1">
                    </asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
                </div>
            </div>
            <br />
            <div class="row align-items-center">
                <div class="col">
                   
                    <div class="gridview-container">
                        <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="idCompra" DataSourceID="DSCompras" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                            <Columns>
                                <asp:BoundField DataField="idCompra" HeaderText="N° Compra" InsertVisible="False" ReadOnly="True" SortExpression="idCompra" Visible="False" />
                                <asp:BoundField DataField="codigoDetalle" HeaderText="N° Compra" SortExpression="codigoDetalle" />
                                <asp:BoundField DataField="fech" HeaderText="Fecha" ReadOnly="True" SortExpression="fech" />
                                <asp:BoundField DataField="importeCompraConSigno" HeaderText="Importe Total" ReadOnly="True" SortExpression="importeCompraConSigno" />
                                <asp:BoundField DataField="descripcionMedioPago" HeaderText="Forma de Pago" SortExpression="descripcionMedioPago" />
                                <asp:BoundField DataField="comentarioCompra" HeaderText="Comentario/Dato" SortExpression="comentarioCompra" />
                                <asp:BoundField DataField="usuarioCompra" HeaderText="Usuario" SortExpression="usuarioCompra" />
                                <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
                            </Columns>
                            <SelectedRowStyle BackColor="#CCCCCC" />
                        </asp:GridView>

                    </div>

                </div>
                <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label7" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label10" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <div class="row align-items-center">
                    <div class="col">
                        <b>
                            <asp:Label align="left" ID="Label8" runat="server"></asp:Label></b>
                    </div>
                    <div class="col text-end">
                        <b>
                            <asp:Label align="right" ID="Label11" runat="server"></asp:Label></b>
                    </div>
                </div>



                <br />
                <br />
                <div class="gridview-container">
                    <asp:GridView ID="GridView2" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataSourceID="DSDetalle">
                        <Columns>
                            <asp:BoundField DataField="cantidad" HeaderText="Cant." SortExpression="cantidad" />
                            <asp:BoundField DataField="nombreInsumo" HeaderText="Ins./Serv." SortExpression="nombreInsumo" />
                            <asp:BoundField DataField="nombreRubro" HeaderText="Rubro" SortExpression="nombreRubro" />
                            <asp:BoundField DataField="precUnit" HeaderText="Precio Un." ReadOnly="True" SortExpression="precUnit" />
                            <asp:BoundField DataField="totalPorProd" HeaderText="Total - Prod" ReadOnly="True" SortExpression="totalPorProd" />
                        </Columns>
                    </asp:GridView>
                </div>


            </div>
            <br />

            
            <asp:Label ID="Label12" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label13" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label14" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label15" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label16" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label17" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label18" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label19" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label20" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label21" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label22" runat="server" Text="Label" Visible="False"></asp:Label>
            <asp:Label ID="Label23" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />

            <br />
            <asp:SqlDataSource ID="DSCompras" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT com.idCompra, com.codigoDetalle, format(com.fecha, 'dd-MM-yyyy') AS fech, FORMAT(com.importeTotalCompra, 'C', 'es-AR') AS importeCompraConSigno, mp.descripcionMedioPago, com.comentarioCompra, com.usuarioCompra FROM compras AS com INNER JOIN mediosdepago AS mp ON com.codigoPago = mp.codigoMedioPago WHERE (com.fecha &gt;= @fechaDesde) AND (com.fecha &lt;= @fechaHasta) ORDER BY com.fecha DESC">
                <SelectParameters>
                    <asp:Parameter Name="fechaDesde" />
                    <asp:Parameter Name="fechaHasta" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT det.cantidad, ins.nombreInsumo, ru.nombreRubro, FORMAT(det.precioUnitario, 'C', 'es-AR') AS precUnit, FORMAT(det.totalPorProducto, 'C', 'es-AR') AS totalPorProd FROM detalleCompra AS det INNER JOIN insumos AS ins ON ins.idInsumo = det.insumoServicio INNER JOIN rubros AS ru ON ru.idRubro = det.codigoRubro WHERE (det.idDetalle = @idDetalle)">
                <SelectParameters>
                    <asp:Parameter Name="idDetalle" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTotalCompras" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadCompras, FORMAT(SUM(importeTotalCompra), '$#,0.00') AS sumaTotal FROM compras WHERE (fecha &gt;= @fechaDesde) AND (fecha &lt;= @fechaHasta)">
                <SelectParameters>
                    <asp:Parameter Name="fechaDesde" />
                    <asp:Parameter Name="fechaHasta" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadComprasUno, SUM(importeTotalCompra) AS TotalMes, DATENAME(MONTH, fecha) AS Mes, YEAR(fecha) AS Año FROM compras WHERE (MONTH(fecha) = MONTH(DATEADD(MONTH, - 1, GETDATE()))) AND (YEAR(fecha) = YEAR(DATEADD(MONTH, - 1, GETDATE()))) GROUP BY DATENAME(MONTH, fecha), YEAR(fecha)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSDosMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadComprasDos, SUM(importeTotalCompra) AS TotalMes, DATENAME(MONTH, fecha) AS Mes, YEAR(fecha) AS Año FROM compras WHERE (MONTH(fecha) = MONTH(DATEADD(MONTH, - 2, GETDATE()))) AND (YEAR(fecha) = YEAR(DATEADD(MONTH, - 2, GETDATE()))) GROUP BY DATENAME(MONTH, fecha), YEAR(fecha)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTresMesAnterior" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS cantidadComprasTres, SUM(importeTotalCompra) AS TotalMes, DATENAME(MONTH, fecha) AS Mes, YEAR(fecha) AS Año FROM compras WHERE (MONTH(fecha) = MONTH(DATEADD(MONTH, - 3, GETDATE()))) AND (YEAR(fecha) = YEAR(DATEADD(MONTH, - 3, GETDATE()))) GROUP BY DATENAME(MONTH, fecha), YEAR(fecha)"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTodosLosDetalles" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT c.idCompra, c.fecha, c.usuarioCompra, d.idDetalle, i.nombreInsumo, d.precioUnitario, d.cantidad, r.nombreRubro, d.totalPorProducto FROM detalleCompra AS d INNER JOIN compras AS c ON d.idDetalle = c.codigoDetalle INNER JOIN insumos AS i ON d.insumoServicio = i.idInsumo INNER JOIN rubros AS r ON d.codigoRubro = r.idRubro WHERE (c.fecha &gt;= @fechaDesde) AND (c.fecha &lt;= @fechaHasta)"></asp:SqlDataSource>
    </form>
</body>
</html>
