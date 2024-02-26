<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionGeneral.aspx.cs" Inherits="ProyectoBelcane.AdministracionGeneral" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        body {
            background-image: url('imagenes/general.jpeg');
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body style="background-image: url('imagenes/general.jpeg'); background-size: 2000px 1000px; background-position: center top; display: flex; flex-direction: column; min-height: 100vh;">
    <form id="form1" runat="server">
        <div class="container">

            <header style="display: flex; justify-content: center; align-items: center; padding: 20px; border-bottom: 1px solid #ccc;">
                <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img src="imagenes/BELCANE2.png" width="70px" />
                    <span class="fs-4">BELCANE</span>
                </a>

                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <asp:Button ID="Button9" CssClass="btn btn-outline-dark" runat="server" Text="Modificar Clave" OnClick="Button2_Click" Width="150px" /></li>
                    &nbsp;&nbsp;
   
                    <li class="nav-item">
                        <asp:Button ID="Button10" CssClass="btn btn-outline-dark" runat="server" OnClick="Button1_Click" Text="Cerrar Sesión" Width="150px" /></li>
                </ul>
            </header>
            <br />


            <h3 align="center">Bienvenido a la Administracion General</h3>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <div>
                <div class="row">
                    <div class="col" align="left">
                        <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Admin. Mascotas" Width="240px" />
                        <br />
                        <br />
                        <asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Admin. Medios de Pago" Width="240px" />
                    </div>
                    <div class="col" align="Center">

                        <asp:Button ID="Button5" CssClass="btn btn-dark" runat="server" OnClick="Button5_Click" Text="Conocer Turnos" Width="240px" />
                        <br />
                        <br />
                        <asp:Button ID="Button6" CssClass="btn btn-dark" runat="server" Text="Conocer Compras " OnClick="Button6_Click" Width="240px" />

                    </div>
                    <div class="col" align="right">

                        <asp:Button ID="Button7" CssClass="btn btn-dark" runat="server" Text="Conocer Clientes y Mascotas" OnClick="Button7_Click" Width="240px" />
                        <br />
                        <br />
                        <asp:Button ID="Button8" CssClass="btn btn-dark" runat="server" Text="Conocer Mascotas" OnClick="Button8_Click" Width="240px" />

                    </div>

                </div>

            </div>

            <br />
            <br />
            <br />
    </form>

</body>
</html>
