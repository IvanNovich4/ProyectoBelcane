<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OlvideClave.aspx.cs" Inherits="ProyectoBelcane.OlvideClave" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Belcane</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .form-wrapper {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .container h3 {
            text-align: center;
        }

        .container h5 {
            font-weight: bold;
        }

        .container input[type="text"],
        .container input[type="email"] {
            width: 100%;
            padding: 5px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .container .btn-dark {
            width: 100%;
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

        .container a:hover {
            text-decoration: none;
        }

        .red-label {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-wrapper">
            <h3>Recuperación de usuario</h3>
            <br/>
            <form id="form1" runat="server">
                <div>
                    <h5>Ingresar Usuario:</h5>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <br />

                    <h5>Ingresar Mail de Usuario:</h5>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Email"></asp:TextBox>
                    <br />
                    <asp:Label ID="Label1" runat="server" CssClass="red-label"></asp:Label>
                    <br />
                    <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Text="Recuperar Cuenta" OnClick="Button2_Click" />
                    <br />
                    <hr />
                    <asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Volver al Inicio" />  
                    <asp:SqlDataSource ID="DSUsuarios" runat="server" ConnectionString="Data Source=ivanoski;Initial Catalog=bd1;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT clave, permisos FROM usuarios WHERE (nombre = @nombre) AND (mail = @mail)" UpdateCommand="UPDATE usuarios SET clave = @clave WHERE (nombre = @nombre)">
                        <SelectParameters>
                            <asp:Parameter Name="nombre" />
                            <asp:Parameter Name="mail" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="clave" />
                            <asp:Parameter Name="nombre" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>   
            </form>
        </div>
    </div>
</body>
</html>