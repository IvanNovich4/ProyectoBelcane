<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SinUsuario.aspx.cs" Inherits="ProyectoBelcane.SinUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Belcane</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .content {
            width: 300px;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            border-radius: 10px;
        }

        .content h3 {
            text-align: center;
        }

        .content .btn-dark {
            width: 100%;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="content">
            <h3>Por favor comuníquese con el administrador para poder gestionar un usuario</h3>
            <br />
            <form id="form1" runat="server">
                <div>
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-dark" OnClick="Button1_Click" Text="Volver al Inicio" />
                </div>
            </form>
        </div>
    </div>
</body>
</html>