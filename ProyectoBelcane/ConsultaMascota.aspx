<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaMascota.aspx.cs" Inherits="ProyectoBelcane.ConsultaMascota" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
<style>
    .column {
  width: 200px; /* Ajusta el valor según tus necesidades */
  height: 50px;
  float: left;
}
    .column1 {
  width: 200px; /* Ajusta el valor según tus necesidades */
  height: 70px;
  float: left;
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

            <h3 align="center">Consulta de Mascotas</h3>
            <br />
            <div class="row">
                <div class="column" >
                    
                    <b>Nombre de Mascota:</b>
                </div>
                <div class="column" align="left" >
                    
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Width="169px"></asp:TextBox>
                </div>
                <div class="column" align="left" >
                    
                    <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Text="Buscar Mascota" OnClick="Button2_Click" Width="149px" />
                </div>
                <div class="column" align="left" >
                    
                    <asp:Label ID="Label1" runat="server" ForeColor="#FF6600"></asp:Label>
                </div>
               <div class="row">
                    <div class="column" >
                        <b>Filtrar por Raza:</b>
                        </div>
                   <div class="column" >
                       <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" DataSourceID="DSRazas" DataTextField="nombreRaza" DataValueField="codigoRaza" Width="170px">
                    </asp:DropDownList>
                        </div>
                   <div class="column" >
                       <asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Quitar Filtro" Width="149px" />
                        </div>
                   <div class="column" >
                        </div>
                   
                   </div>
                
                </div>
                &nbsp;
                    
                    &nbsp;&nbsp;
                    <br />
                <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Ver Todas las Mascotas" />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <br />
                <br />

            
        </div>

        <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.nombre, c.apellido, m.nombreMascota, m.idMascota, r.nombreRaza, m.color, ntos.nombreManto, t.nombreTamaño FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN clientes AS c ON m.codigoDueño = c.dni INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza WHERE (m.nombreMascota LIKE @nombreMascota + '%')">
            <SelectParameters>
                <asp:Parameter Name="nombreMascota" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMascotas1" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.nombre, c.apellido, m.nombreMascota, m.idMascota, r.nombreRaza, m.color, ntos.nombreManto, t.nombreTamaño FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN clientes AS c ON m.codigoDueño = c.dni INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza ORDER BY m.nombreMascota"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRazas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas ORDER BY nombreRaza"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMascotasPorRaza" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.nombre, c.apellido, m.nombreMascota, m.idMascota, r.nombreRaza, m.color, ntos.nombreManto, t.nombreTamaño FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN clientes AS c ON m.codigoDueño = c.dni INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza WHERE (r.codigoRaza = @codigoRaza) ORDER BY m.nombreMascota">
            <SelectParameters>
                <asp:Parameter Name="codigoRaza" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMascNomRaz" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.nombre, c.apellido, m.nombreMascota, m.idMascota, r.nombreRaza, m.color, ntos.nombreManto, t.nombreTamaño FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN clientes AS c ON m.codigoDueño = c.dni INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza WHERE (r.codigoRaza = @codigoRaza) AND (m.nombreMascota LIKE @nombreMascota + '%') ORDER BY m.nombreMascota">
            <SelectParameters>
                <asp:Parameter Name="codigoRaza" />
                <asp:Parameter Name="nombreMascota" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
