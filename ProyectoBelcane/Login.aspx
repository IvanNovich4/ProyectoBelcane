<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoBelcane.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Belcane</title>
    <link href="estilos/estilos.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-top: 5%;
            max-width: 400px; /* Ancho máximo del contenedor */
            margin-left: auto; /* Centrar el contenedor horizontalmente */
            margin-right: auto; /* Centrar el contenedor horizontalmente */
        }

        .container .logo-img {
            margin-bottom: 20px;
        }

        .form-wrapper {
            width: 100%; /* Ancho del formulario al 100% del contenedor */
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .container h2 {
            text-align: center;
        }

        .container h5 {
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .container .btn-dark {
            width: 200px;
            padding: 10px;
            background-color: black;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .container .btn-dark:hover {
            background-color: #23272b;
        }

        .container a {
            display: block;
            text-align: center;
            margin-bottom: 10px;
            color: #007bff;
        }

        .container .no-user {
            margin-top: 20px;
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 5px;
        }

        .container .label-center {
            text-align: center !important;
            color: red;
        }

        .container a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="form-wrapper">
                <img src="imagenes/BELCANE2.png" alt="Logo BelCane" class="logo-img" />
                <br />
                <h5>Nombre de Usuario:</h5>
                <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                <br />
                <h5>Clave:</h5>
                <asp:TextBox ID="TextBox2" minlength="8" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <asp:Label ID="Label1" runat="server" CssClass="label-center"></asp:Label>
                <br />
                <div class="d-flex justify-content-between">
                    <a href="OlvideClave.aspx" class="align-self-center">Olvidé mi clave</a>
                    <div class="align-self-center">
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-dark" OnClick="Button1_Click" Text="Ingresar" />
                    </div>
                </div>

                <a href="SinUsuario.aspx" class="no-user">No tengo usuario</a>

                <asp:SqlDataSource ID="DSUsuarios" runat="server" ConnectionString="Data Source=IVANOSKI;Initial Catalog=bd1;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT nombre, permisos FROM usuarios WHERE (nombre = @nombre) AND (clave = @clave)">
                    <SelectParameters>
                        <asp:Parameter Name="nombre" />
                        <asp:Parameter Name="clave" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>