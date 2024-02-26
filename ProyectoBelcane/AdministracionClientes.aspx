<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionClientes.aspx.cs" Inherits="ProyectoBelcane.AdministracionClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .form-container {
            max-width: 800px;
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

            .form-group textbox {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form-group .form-control {
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

        .two-column-container {
            display: flex;
            justify-content: space-between;
            
        }

            .two-column-container .form-group {
                flex-basis: 48%;
                .two-column-container2
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

            <h3 align="center">Registrar Nuevo Cliente</h3>

            <div class="form-container">
                <div class="two-column-container">
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar el Nombre.</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtClave">Apellido:</label><asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar el Apellido.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="two-column-container">
                    <div class="form-group">
                        <label for="txtMail">DNI:</label><asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="Number" MaxLength="8"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar el DNI.</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtMail">Teléfono:</label><asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar un teléfono.</asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label for="txtMail">Correo:</label><asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar un correo.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group" height:"90px">
                    <label for="txtMail">Provincia:</label><asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-dark" DataSourceID="DSProvincia" OnSelectedIndexChanged="BuscarLocalidad" DataTextField="nombreProvincia" DataValueField="idProvincia" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="#FF6600">Debe seleccionar una provincia.</asp:CustomValidator>
                </div>


                <div class="two-column-container">
                    <div class="form-group">
                        <label for="txtMail">Localidad:</label><asp:DropDownList ID="DropDownList2" runat="server" CssClass="btn btn-dark" DataSourceID="DSLocalidad" OnSelectedIndexChanged="BuscarBarrio" DataTextField="nombreLocalidad" DataValueField="idLocalidad" AutoPostBack="True">
                        </asp:DropDownList><asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator2_ServerValidate" ForeColor="#FF6600">Debe seleccionar una Localidad.</asp:CustomValidator>
                        <br />
                    </div>

                    <div class="form-group">
                        <label for="txtMail">Agregar Localidad:</label><asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" Width="100%" Text="Agregar Localidad" OnClick="Button3_Click" CausesValidation="False" />
                        <br />
                        <asp:Label ID="Label1" runat="server"></asp:Label>
                    </div>
                </div>

                <div class="two-column-container">
                    <div class="form-group">
                        <label for="txtMail">Barrio:</label>
                        <asp:DropDownList ID="DropDownList3" CssClass="btn btn-dark" runat="server" DataSourceID="DSBarrio" OnSelectedIndexChanged="BorrarLabelBarrio" DataTextField="nombreBarrio" DataValueField="idBarrio" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="DropDownList3" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator3_ServerValidate" ForeColor="#FF6600">Debe seleccionar un Barrio.</asp:CustomValidator>
                    </div>

                    <div class="form-group">
                        <label for="txtMail">Agregar Barrio:</label><asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" Width="100%" Text="Agregar Barrio" OnClick="Button4_Click" CausesValidation="False" />
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                        <br />
                    </div>
                </div>

                <div class="form-group">
                    <label for="txtMail">Dirección:</label>
                    <asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar la Dirección.</asp:RequiredFieldValidator>
                </div>

                <div class="form-actions">
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="CustomValidator" OnServerValidate="CustomValidator4_ServerValidate" ForeColor="#FF6600">Ya existe un cliente registrado con dicho DNI.</asp:CustomValidator>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    &nbsp;<br />
                    <asp:Button ID="Button2" CssClass="btn btn-dark" Width="50%" runat="server" Text="Registrar Cliente" OnClick="Button2_Click" />
                    <asp:Button ID="Button5" CssClass="btn btn-dark" Width="49%" runat="server" Text="Cancelar Registro" CausesValidation="False" OnClick="Button5_Click" />
                    
                </div>
            </div>
            </div>

            <asp:SqlDataSource ID="DSProvincia" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idProvincia, nombreProvincia FROM provincia"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSLocalidad" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="INSERT INTO localidad(nombreLocalidad, codigoProvincia) VALUES (@nombreLocalidad, @codigoProvincia)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idLocalidad, nombreLocalidad, codigoProvincia FROM localidad WHERE (codigoProvincia = @codigoProvincia) OR (codigoProvincia = 0) ORDER BY codigoProvincia">
                <InsertParameters>
                    <asp:Parameter Name="nombreLocalidad" />
                    <asp:Parameter Name="codigoProvincia" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="codigoProvincia" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSBarrio" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="INSERT INTO barrios(nombreBarrio, codigoLocalidad) VALUES (@nombreBarrio, @codigoLocalidad)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idBarrio, nombreBarrio, codigoLocalidad FROM barrios WHERE (codigoLocalidad = @codigoLocalidad) OR (codigoLocalidad = 0) ORDER BY codigoLocalidad">
                <InsertParameters>
                    <asp:Parameter Name="nombreBarrio" />
                    <asp:Parameter Name="codigoLocalidad" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="codigoLocalidad" DefaultValue="" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSCliente" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="INSERT INTO clientes(dni, nombre, apellido, telefono, correo, direccion, codigoBarrio) VALUES (@dni, @nombre, @apellido, @telefono, @correo, @direccion, @codigoBarrio)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT dni, nombre FROM clientes WHERE (dni = @dni)">
                <InsertParameters>
                    <asp:Parameter Name="dni" />
                    <asp:Parameter Name="nombre" />
                    <asp:Parameter Name="apellido" />
                    <asp:Parameter Name="telefono" />
                    <asp:Parameter Name="correo" />
                    <asp:Parameter Name="direccion" />
                    <asp:Parameter Name="codigoBarrio" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="dni" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSExisteLocalidad" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idLocalidad, nombreLocalidad, codigoProvincia FROM localidad WHERE (nombreLocalidad = @nombreLocalidad) AND (codigoProvincia = @codigoProvincia)">
                <SelectParameters>
                    <asp:Parameter Name="nombreLocalidad" />
                    <asp:Parameter Name="codigoProvincia" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSExisteBarrio" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idBarrio, nombreBarrio, codigoLocalidad FROM barrios WHERE (nombreBarrio = @nombreBarrio) AND (codigoLocalidad = @codigoLocalidad)">
                <SelectParameters>
                    <asp:Parameter Name="nombreBarrio" />
                    <asp:Parameter Name="codigoLocalidad" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
