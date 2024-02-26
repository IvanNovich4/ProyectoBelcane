<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConocerClientesyMascotas.aspx.cs" Inherits="ProyectoBelcane.ConocerClientesyMascotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .gridview-container {
            height: 420px; /* Ajusta esta altura según tus necesidades */
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

            <h3 align="center">Conocer Clientes y Mascotas </h3>
            <br />
            <br />
            <div class="row align-items-center">

                <div class="row">
                    <div class="col-md-2"><b>Cantidad de Clientes :</b></div>
                    <div class="col-md-1">
                        <b><asp:Label ID="Label1" runat="server"></asp:Label></b></div>
                    <div class="col-md-2"><b>Cantidad de Mascotas :</b></div>
                    <div class="col-md-1">
                        <b><asp:Label ID="Label2" runat="server"></asp:Label></b></div>
                </div>
                <br />
                <br />
                <div class="gridview-container">
                    <asp:GridView ID="GridView1" class="table table-striped table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="dni" DataSourceID="DSCliMasc" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:BoundField DataField="dni" HeaderText="DNI" ReadOnly="True" SortExpression="dni" />
                            <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                            <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                            <asp:BoundField DataField="perrito" HeaderText="Mascota/s" ReadOnly="True" SortExpression="perrito" />
                            <asp:BoundField DataField="raza" HeaderText="Raza" ReadOnly="True" SortExpression="raza" />
                            <asp:CommandField SelectText="Info. Cliente" ShowSelectButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#CCCCCC" />
                    </asp:GridView>
                </div>
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
                <div class="row align-items-center">
                    <div class="col">
                        <b>
                            <asp:Label align="left" ID="Label8" runat="server"></asp:Label></b>
                    </div>
                    <br />
                    <div class="col text-end">
                        <b>
                            <asp:Label align="right" ID="Label11" runat="server"></asp:Label></b>
                    </div>
                </div>
                <br />
                <br />

                <asp:GridView ID="GridView2" class="table table-striped table-hover" runat="server" DataSourceID="DSDetCliente" AutoGenerateColumns="False" DataKeyNames="dni">
                    <Columns>
                        <asp:BoundField DataField="dni" HeaderText="dni" ReadOnly="True" SortExpression="dni" Visible="False" />
                        <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre" Visible="False" />
                        <asp:BoundField DataField="apellido" HeaderText="apellido" SortExpression="apellido" Visible="False" />
                        <asp:BoundField DataField="telefono" HeaderText="Teléfono" SortExpression="telefono" />
                        <asp:BoundField DataField="correo" HeaderText="E-mail" SortExpression="correo" />
                        <asp:BoundField DataField="direccion" HeaderText="Dirección" SortExpression="direccion" />
                        <asp:BoundField DataField="nombreBarrio" HeaderText="Barrio" SortExpression="nombreBarrio" />
                        <asp:BoundField DataField="nombreLocalidad" HeaderText="Localidad" SortExpression="nombreLocalidad" />
                        <asp:BoundField DataField="nombreProvincia" HeaderText="Provincia" SortExpression="nombreProvincia" />
                    </Columns>
                </asp:GridView>

            </div>


        </div>

        <asp:SqlDataSource ID="DSCliMasc" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT cli.dni, cli.nombre, cli.apellido, STRING_AGG(mas.nombreMascota, ',') AS perrito, STRING_AGG(ra.nombreRaza, ',') AS raza FROM clientes AS cli LEFT OUTER JOIN mascotas AS mas ON cli.dni = mas.codigoDueño LEFT OUTER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza GROUP BY cli.dni, cli.nombre, cli.apellido ORDER BY cli.nombre"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTotCli" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT (SELECT COUNT(dni) AS totalClientes FROM clientes) AS totalClientes, (SELECT COUNT(idMascota) AS totalMascotas FROM mascotas WHERE (idMascota &lt;&gt; '1008')) AS cantidad_mascotas"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDetCliente" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, b.nombreBarrio, l.nombreLocalidad, p.nombreProvincia FROM clientes AS c INNER JOIN barrios AS b ON c.codigoBarrio = b.idBarrio INNER JOIN localidad AS l ON l.idLocalidad = b.codigoLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia WHERE (c.dni = @dni)">
            <SelectParameters>
                <asp:Parameter Name="dni" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
