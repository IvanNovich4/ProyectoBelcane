<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MascotasPorCliente.aspx.cs" Inherits="ProyectoBelcane.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
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

          <h3 align="center">Consulta de Mascotas por Cliente</h3>
            <br />
            <div class="row g-3">
              <div class="col-sm-2">
                  <asp:Label ID="Label4" runat="server" Text="Cliente - DNI : "></asp:Label>
              </div>
              <div class="col-sm-3">
                 <asp:TextBox ID="TextBox1" runat="server"  class="form-control" TextMode="Number"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="DNI incorrecto , por favor ingrese nuevamente el dni." ForeColor="#FF6600" ValidationExpression="^\d{7,8}$"></asp:RegularExpressionValidator>
              </div>
              <div class="col-sm-2">
                  <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Text="Buscar por DNI" OnClick="Button2_Click" Width="185px" />
              </div>
              <div class="col-sm-2">
                  <asp:Label ID="Label2" runat="server" ForeColor="#FF6600"></asp:Label>
              </div>
          </div>
            

            <div class="row g-3">
                <div class="col-sm-2">
                    <asp:Label ID="Label5" runat="server" Text="Nombre - Cliente : "></asp:Label>
                </div>
                <div class="col-sm-3">
                    <asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-sm-2">
                     <asp:Button ID="Button4" cssClass="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Buscar por Nombre" CausesValidation="False" Width="185px" />
                
                </div>
                <div class="col-sm-2">
                   <asp:Label ID="Label3" runat="server" ForeColor="#FF6600"></asp:Label>
                </div>
            </div>
            <div>
                <br />
                <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Ver Todos" CausesValidation="False" Width="185px" />
                
                <br />
                
                <br />
                <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                
                <br />

            </div>
            </div>
        
        <asp:SqlDataSource ID="DSClienteNom" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, b.nombreBarrio, l.nombreLocalidad, p.nombreProvincia FROM clientes AS c INNER JOIN barrios AS b ON b.idBarrio = c.codigoBarrio INNER JOIN localidad AS l ON b.codigoLocalidad = l.idLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia WHERE (c.nombre LIKE @nombre + '%') ORDER BY c.nombre">
            <SelectParameters>
                <asp:Parameter Name="nombre" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSClientes" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, b.nombreBarrio, l.nombreLocalidad, p.nombreProvincia FROM clientes AS c INNER JOIN barrios AS b ON b.idBarrio = c.codigoBarrio INNER JOIN localidad AS l ON b.codigoLocalidad = l.idLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia ORDER BY c.nombre"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSClienteDni" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, b.nombreBarrio, l.nombreLocalidad, p.nombreProvincia FROM clientes AS c INNER JOIN barrios AS b ON b.idBarrio = c.codigoBarrio INNER JOIN localidad AS l ON b.codigoLocalidad = l.idLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia WHERE (c.dni = @dni) ORDER BY c.nombre">
            <SelectParameters>
                <asp:Parameter Name="dni" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
