<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VerCompras.aspx.cs" Inherits="ProyectoBelcane.VerCompras" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title><link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
<style>
    .gridview-container {
        height: 290px; /* Ajusta esta altura según tus necesidades */
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

          <h3 align="center">Lista de Compras </h3>
            <br />
            <div class="row align-items-center">
    
    <div class="Container">
          <br />
           <h5 align="center">(Solo puede ver compras hasta un mes anterior inclusive.)</h5>
          <div class="gridview-container">
        <asp:GridView ID="GridView1" runat="server"  class="table table-striped table-hover" AutoGenerateColumns="False" DataKeyNames="idCompra" DataSourceID="DSCompras" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="idCompra" HeaderText="N° Compra" InsertVisible="False" ReadOnly="True" SortExpression="idCompra" Visible="False" />
                <asp:BoundField DataField="codigoDetalle" HeaderText="N° Compra" SortExpression="codigoDetalle" />
                <asp:BoundField DataField="fech" HeaderText="Fecha" ReadOnly="True" SortExpression="fech" />
                <asp:BoundField DataField="importeCompraConSigno" HeaderText="Total" ReadOnly="True" SortExpression="importeCompraConSigno" />
                <asp:BoundField DataField="descripcionMedioPago" HeaderText="Medio-Pago" SortExpression="descripcionMedioPago" />
                <asp:BoundField DataField="comentarioCompra" HeaderText="Comentario" SortExpression="comentarioCompra" />
                <asp:CommandField SelectText="Ver Detalle" ShowSelectButton="True" />
            </Columns>
            <SelectedRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
              </div>
          </div>
        <br /><br />
        <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
     
        <asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
        <br /><br /><br />
               <div class="row align-items-center">
    <div class="col">
        <b><asp:Label align="left" ID="Label3" runat="server"></asp:Label></b>
    </div>
    <div class="col text-end">
        <b><asp:Label align="right" ID="Label4" runat="server"></asp:Label></b>
    </div>
</div>
                     
        <br /><br />
        <asp:GridView ID="GridView2"  class="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="DSDetalle">
            <Columns>
                <asp:BoundField DataField="cantidad" HeaderText="Cantidad" SortExpression="cantidad" />
                <asp:BoundField DataField="nombreInsumo" HeaderText="Ins. / Serv." SortExpression="nombreInsumo" />
                <asp:BoundField DataField="nombreRubro" HeaderText="Rubro" SortExpression="nombreRubro" />
                <asp:BoundField DataField="precioUnidad" HeaderText="Precio Un." SortExpression="precioUnidad" ReadOnly="True" />
                <asp:BoundField DataField="totalProducto" HeaderText="Total - Ins. / Serv." ReadOnly="True" SortExpression="totalProducto" />
            </Columns>
        </asp:GridView>
     
    </div>
   
    </div>
        
            
        </div>
        <asp:SqlDataSource ID="DSCompras" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT com.idCompra, com.codigoDetalle, format(com.fecha, 'dd-MM-yyyy') AS fech, FORMAT(com.importeTotalCompra, 'C', 'es-AR') AS importeCompraConSigno, mp.descripcionMedioPago, com.comentarioCompra FROM compras AS com INNER JOIN mediosdepago AS mp ON com.codigoPago = mp.codigoMedioPago WHERE (com.fecha &gt;= DATEADD(MONTH, - 2, GETDATE())) AND (com.fecha &lt;= GETDATE()) ORDER BY com.fecha DESC, com.codigoDetalle DESC"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT det.cantidad, ins.nombreInsumo, ru.nombreRubro, FORMAT(det.precioUnitario, 'C', 'es-AR') AS precioUnidad, FORMAT(det.totalPorProducto, 'C', 'es-AR') AS totalProducto FROM detalleCompra AS det INNER JOIN insumos AS ins ON ins.idInsumo = det.insumoServicio INNER JOIN rubros AS ru ON ru.idRubro = det.codigoRubro WHERE (det.idDetalle = @idDetalle)">
            <SelectParameters>
                <asp:Parameter Name="idDetalle" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSComPorRub" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT DISTINCT com.idCompra, com.codigoDetalle, format(com.fecha, 'dd-MM-yyyy') AS fech, com.importeTotalCompra, mp.descripcionMedioPago, com.comentarioCompra FROM compras AS com INNER JOIN mediosdepago AS mp ON com.codigoPago = mp.codigoMedioPago INNER JOIN detalleCompra AS det ON det.idDetalle = com.codigoDetalle WHERE (det.codigoRubro = @codigoRubro)">
            <SelectParameters>
                <asp:Parameter Name="codigoRubro" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRubros" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idRubro, nombreRubro FROM rubros"></asp:SqlDataSource>
    </form>
</body>
</html>
