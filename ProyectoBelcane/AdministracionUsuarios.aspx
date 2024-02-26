<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionUsuarios.aspx.cs" Inherits="ProyectoBelcane.AdministracionUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous"/>
    
</head>
<body>
    <div class ="container">
    <form id="form1" runat="server">

        <header style="display: flex; justify-content: center; align-items: center; padding: 20px; border-bottom: 1px solid #ccc;">
                <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img src="imagenes/BELCANE2.png" width="70px" />
                    <span class="fs-4" style="color:black">BELCANE</span>
                </a>

                <ul class="nav nav-pills ml-auto">
                    &nbsp;&nbsp;
   
                    <li class="nav-item">
                        <asp:Button ID="Button10" CssClass="btn btn-outline-dark" runat="server" OnClick="Button1_Click" Text="Cerrar Sesión" /></li>
                </ul>
            </header>
            <br />

        <div class="row">
                <h3 align="center">Administración de Usuarios</h3>
            
                <br />
            <br />
            <br />
            </div>
        
        <asp:Button ID="Button2" class="btn btn-dark" runat="server" OnClick="Button2_Click" Text="Registrar Nuevo Usuario" />
        
        <br />
        <br />
       
        <asp:Label ID="Label2" runat="server"></asp:Label>
            
        <br />
        <asp:SqlDataSource ID="DSUsuarios" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT nombre, clave, mail, permisos, codigo FROM usuarios ORDER BY nombre"></asp:SqlDataSource>
        <br />
        <br />
        <br />
        
    </form>
    </div>
</body>
</html>
