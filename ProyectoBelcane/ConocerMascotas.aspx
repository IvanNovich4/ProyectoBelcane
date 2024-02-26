<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConocerMascotas.aspx.cs" Inherits="ProyectoBelcane.ConocerMascotas" %>

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

          <h3 align="center">Mascotas de
              <asp:Label ID="Label14" runat="server"></asp:Label>
              &nbsp;</h3>
            
                    
            <br />
            <br />
            <br />
            <asp:GridView ID="GridView1" Class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="idMascota" DataSourceID="DSMascDue" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="idMascota" HeaderText="Codigo" InsertVisible="False" ReadOnly="True" SortExpression="idMascota" />
                    <asp:BoundField DataField="nombreMascota" HeaderText="Mascota" SortExpression="nombreMascota" />
                    <asp:BoundField DataField="nombreRaza" HeaderText="Raza" SortExpression="nombreRaza" />
                    <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                    <asp:BoundField DataField="nombreTamaño" HeaderText="Tamaño " SortExpression="nombreTamaño" />
                    <asp:CommandField SelectText="Info. Comlpeta" ShowSelectButton="True" HeaderText="Eliminar / Info. Completa" ShowDeleteButton="True" />
                </Columns>
                <SelectedRowStyle BackColor="#CCCCCC" />
            </asp:GridView>
            <br />
            <br />
            <div class="row align-items-center">
    <div class="col">
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
        <br />
        <asp:Label ID="Label4" runat="server"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    <div class="col">
         <asp:Label ID="Label6" runat="server"></asp:Label>
        <br />
        <br />
         <asp:Label ID="Label7" runat="server"></asp:Label>
        <br />
        <br />
         <asp:Label ID="Label8" runat="server"></asp:Label>
        <br />
        <br />
    </div>
    <div class="col">
          <asp:Label ID="Label9" runat="server"></asp:Label>
        <br />
        <br />
          <asp:Label ID="Label10" runat="server"></asp:Label>
        <br />
        <br />
          <asp:Label ID="Label11" runat="server"></asp:Label>
        <br />
        <br />
        </div> 
    </div>
            <asp:Label ID="Label12" runat="server"></asp:Label>
        <br />
        <br />
            
            <asp:Label ID="Label13" runat="server"></asp:Label>
            
            <asp:SqlDataSource ID="DSMascotaSelec" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT m.idMascota, m.nombreMascota, m.edadMascota, m.sexo, t.nombreTamaño, ntos.nombreManto, r.nombreRaza, m.color, m.castrado, m.alergia, m.comportamiento, m.comentarios, c.dni, c.nombre, c.apellido FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza INNER JOIN clientes AS c ON m.codigoDueño = c.dni WHERE (m.idMascota = @idMascota)">
                <SelectParameters>
                    <asp:Parameter Name="idMascota" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <asp:SqlDataSource ID="DSMascDue" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT m.idMascota, m.nombreMascota, r.nombreRaza, m.color, t.nombreTamaño FROM mascotas AS m INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN clientes AS c ON m.codigoDueño = c.dni WHERE (m.codigoDueño = @codigoDueño)" DeleteCommand="DELETE FROM mascotas WHERE (idMascota = @idMascota)">
            <DeleteParameters>
                <asp:Parameter Name="idMascota" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter Name="codigoDueño" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDueño" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT nombre, apellido FROM clientes WHERE (dni = @codigoDueño)">
            <SelectParameters>
                <asp:Parameter Name="codigoDueño" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
