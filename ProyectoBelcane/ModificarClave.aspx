<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarClave.aspx.cs" Inherits="ProyectoBelcane.ModificarClave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <style>
        .form-container {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="password"],
        .form-group select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-actions {
            text-align: left;
        }

        .form-actions button {
            margin-left: 10px;
        }
    </style>
</head>
<body>
    <div class ="container">
    <form id="form1" runat="server">

        <header style="display: flex; justify-content: center; align-items: center; padding: 20px; border-bottom: 1px solid #ccc;">
                <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                    <img src="imagenes/BELCANE2.png" width="70px" />
                    <span class="fs-4">BELCANE</span>
                </a>

                <ul class="nav nav-pills ml-auto">
                    <li class="nav-item">
                        <asp:Button ID="Button4" CssClass="btn btn-outline-dark" runat="server" Text="Retornar" OnClick="Button3_Click" CausesValidation="False" /></li>
                    &nbsp;&nbsp;
 
                </ul>
            </header>
            <br />

        <div>
            <h3 align="center">Modificación de clave</h3>
            
              </div>
            <br />
            <div class="form-container">
            <div class="form-group">
                <label for="txtNombre">Ingresar Clave Actual:</label><asp:TextBox ID="TextBox1" minlength="8" runat="server" TextMode="Password"></asp:TextBox>
                &nbsp;</div>
            
            <div class="form-group">
                <label for="txtClave">Ingresar Nueva Clave:</label><asp:TextBox ID="TextBox2" minlength="8" runat="server" TextMode="Password"></asp:TextBox>
                &nbsp;</div>
            
            <div class="form-group">
                <label for="txtMail">Confirmar Nueva Clave:</label><asp:TextBox ID="TextBox3" minlength="8" runat="server" TextMode="Password"></asp:TextBox>
                &nbsp;</div>
            
            <div class="form-actions">
                <asp:Button ID="Button1" CssClass="btn btn-dark" Width="50%" runat="server" OnClick="Button1_Click" Text="Confirmar" />
                <asp:Button ID="Button2" CssClass="btn btn-dark" width="49%" runat="server" OnClick="Button2_Click" Text="Cancelar" />
                <br />
                <asp:Label ID="Label2" runat="server"></asp:Label>
            </div>
        </div>
            
&nbsp;
            
        </div>
        <asp:SqlDataSource ID="DSUsuario" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT clave, mail, permisos FROM usuarios WHERE (nombre = @nombre)" UpdateCommand="UPDATE usuarios SET clave = @clave WHERE (nombre = @nombre)">
            <SelectParameters>
                <asp:Parameter Name="nombre" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="clave" />
                <asp:Parameter Name="nombre" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
        </div>
</body>
</html>
