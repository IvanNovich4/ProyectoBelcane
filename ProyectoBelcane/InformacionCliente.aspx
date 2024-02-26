<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InformacionCliente.aspx.cs" Inherits="ProyectoBelcane.InformacionCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
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

          <h3 align="center">Información completa - Cliente</h3>
            <br />
             <br />
             <br />
            <div class="row align-items-center">
               
    <div class="col align-self-center">
      <b>Nombre Cliente :</b>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        <br />
        <b>Telefono :</b>
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <br />
       <b> Correo :</b>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
        <br />
        <b>Dirección :</b>
         <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
    </div>
    <div class="col align-self-center">
         <b>Dni :</b> <asp:Label ID="Label5" runat="server"></asp:Label>
         <br />
         <br />
        <b> Barrio :</b>
         <asp:Label ID="Label6" runat="server"></asp:Label>
        <br />
        <br />
        <b> Localidad :</b>
         <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        <br />
         <b>Provincia :</b>
          <asp:Label ID="Label8" runat="server"></asp:Label>
        <br />
    </div>
    </div>
&nbsp;<asp:SqlDataSource ID="DSCliente" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, b.nombreBarrio, l.nombreLocalidad, p.nombreProvincia FROM clientes AS c INNER JOIN barrios AS b ON c.codigoBarrio = b.idBarrio INNER JOIN localidad AS l ON l.idLocalidad = b.codigoLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia WHERE (c.dni = @dni)">
                <SelectParameters>
                    <asp:Parameter Name="dni" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
