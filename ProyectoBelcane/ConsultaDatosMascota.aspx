<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultaDatosMascota.aspx.cs" Inherits="ProyectoBelcane.ConsultaDatosMascota" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .column {
            width: 16%; /* Ajusta el valor según tus necesidades */
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
            <h3 align="center">Información completa - Mascota</h3>
            <br />
            <br />
            <br />
            <br />
            <div class="row">
                <div class="column">
                    <b>Nombre Mascota:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Tamaño:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label4" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Color:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <b>Edad:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Tipo de Manto:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Castrado:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label8" runat="server"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <b>Sexo:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Raza:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </div>
                <div class="column">
                    <b>Alergia:</b>
                </div>
                <div class="column">
                    <asp:Label ID="Label9" runat="server"></asp:Label>
                </div>
            </div>
            
            <div class="row">
                <div class="column"><b>Comportamiento :</b></div>
                <div class="column">
                    <asp:Label ID="Label10" runat="server"></asp:Label></div>
            </div>
            <b>Comentarios / Otros Datos de Interés :</b>

            <asp:Label ID="Label11" runat="server"></asp:Label>
            <br />
            <br />
            <b>Dueño :</b>
            <asp:Label ID="Label12" runat="server"></asp:Label>
            &nbsp;
            <asp:Label ID="Label13" runat="server"></asp:Label>
            &nbsp;<b> DNI :</b>
            <asp:Label ID="Label14" runat="server"></asp:Label>
            <br />
            <br />
            <br />
            <asp:Button ID="Button2" runat="server" CssClass="btn btn-dark" OnClick="Button2_Click" Text="Editar Información" />
            &nbsp;
        </div>
        <asp:SqlDataSource ID="DSMascota" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT m.idMascota, m.nombreMascota, m.edadMascota, m.sexo, t.nombreTamaño, ntos.nombreManto, r.nombreRaza, m.color, m.castrado, m.alergia, m.comportamiento, m.comentarios, c.dni, c.nombre, c.apellido FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza INNER JOIN clientes AS c ON m.codigoDueño = c.dni WHERE (m.idMascota = @idMascota)">
            <SelectParameters>
                <asp:Parameter Name="idMascota" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
