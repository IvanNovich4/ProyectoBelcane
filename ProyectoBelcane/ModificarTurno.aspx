<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarTurno.aspx.cs" Inherits="ProyectoBelcane.ModificarTurno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .container2 {
            width: 80%; /* Ocupar el 70% de la pantalla */
            max-width: 800px; /* Opcional: Limitar el ancho máximo del contenedor */
            margin: 0 auto; /* Centrar horizontalmente el contenedor */
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

            <h3 align="center">Modificar Turno</h3>
            <br />
            <br />
            <div class="container2">
                <div class="row">
                    <div class="col-md-2"><b>Fecha :</b></div>
                    <div class="col-md-4">
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="Date" AutoPostBack="True"></asp:TextBox>
                    </div>
                    <div class="col-md-4"><b>Hora :</b></div>
                    <div class="col-md-2">
                        <asp:TextBox ID="TextBox2" runat="server" class="form-control" TextMode="Time"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2"><b>DNI Cliente:</b></div>
                    <div class="col-md-4">
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-2"><b>Cliente :</b></div>
                    <div class="col-md-4">
                        <asp:Label ID="Label7" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2"><b>Mascota :</b></div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownList4" CssClass="btn btn-dark" Width="100%" runat="server" DataSourceID="DSMascotas" DataTextField="nombreMascota" DataValueField="idMascota" AutoPostBack="True" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2"><b>Raza :</b></div>
                    <div class="col-md-4">
                        <asp:Label ID="Label3" runat="server"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2"><b>Tamaño :</b></div>
                    <div class="col-md-4">
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </div>
                    <div class="col-md-2"><b>Servicio :</b></div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownList2" CssClass="btn btn-dark" runat="server" Width="100%" DataSourceID="DSServicios" DataTextField="nombreServicio" DataValueField="idServicio">
                        </asp:DropDownList>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4"><b>Duración aprox :</b></div>
                    <div class="col-md-2">
                        <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" Width="100%">
                                <asp:ListItem Value="0">Selecc.</asp:ListItem>
                                <asp:ListItem Value="1">1 hs</asp:ListItem>
                                <asp:ListItem Value="1.5">1.5 hs</asp:ListItem>
                                <asp:ListItem Value="2">2 hs</asp:ListItem>
                                <asp:ListItem Value="2.5">2.5 hs</asp:ListItem>
                                <asp:ListItem Value="3">3 hs</asp:ListItem>
                                <asp:ListItem Value="3.5">3.5 hs</asp:ListItem>
                                <asp:ListItem Value="4">4 hs</asp:ListItem>
                                <asp:ListItem Value="4.5">4.5 hs</asp:ListItem>
                                <asp:ListItem Value="5">5 hs</asp:ListItem>
                            </asp:DropDownList>
                    </div>
                    <div class="col-md-4"><b>Importe :</b></div>
                    <div class="col-md-2">
                        <asp:TextBox ID="TextBox4" runat="server" class="form-control" TextMode="Number"></asp:TextBox>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Precio Incorrecto." ForeColor="#FF6600" MaximumValue="25000" MinimumValue="1000" Type="Double"></asp:RangeValidator>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2"><b>Pago :</b></div>
                    <div class="col-md-4">
                        <asp:DropDownList ID="DropDownList3" CssClass="btn btn-dark" Width="100%" runat="server" DataSourceID="DSMedioPago" DataTextField="descripcionMedioPago" DataValueField="codigoMedioPago">
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-2"></div>
                    <div class="col-md-4"></div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2"><b>Observ./Dato :</b></div>
                    <div class="col-md-10">
                        <asp:TextBox ID="TextBox5" class="form-control" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-6">
                        <asp:Button ID="Button2" CssClass="btn btn-dark form-control" runat="server" OnClick="Button2_Click" Text="Modificar Turno" /></div>
                    <div class="col-md-6">
                        <asp:Button ID="Button3" CssClass="btn btn-dark form-control" runat="server" Text="Cancelar Modificación." CausesValidation="False" OnClick="Button3_Click" /></div>
                </div>
                <br />
                <asp:Label ID="Label8" runat="server"></asp:Label>
                <asp:Label ID="Label9" runat="server" Visible="False"></asp:Label>
                <br />
            </div>
        </div>
        <asp:SqlDataSource ID="DSMedioPago" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoMedioPago, descripcionMedioPago FROM mediosdepago WHERE (codigoMedioPago &lt;&gt; 7)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT mascotas.idMascota, mascotas.nombreMascota, mascotas.codigoDueño, ra.nombreRaza, ta.nombreTamaño FROM mascotas INNER JOIN razas AS ra ON ra.codigoRaza = mascotas.codigoRaza INNER JOIN tamaños AS ta ON ta.codigoTamaño = mascotas.codigoTamaño WHERE (mascotas.codigoDueño = @codigoDueño) OR (mascotas.idMascota = 1008) ORDER BY mascotas.idMascota">
            <SelectParameters>
                <asp:Parameter Name="codigoDueño" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="DSServicios" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idServicio, nombreServicio FROM servicios WHERE (idServicio &lt;&gt; 2)"></asp:SqlDataSource>

        <asp:SqlDataSource ID="DSTurnos" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT turnos.fechaTurno, turnos.horario, cli.nombre, cli.apellido, turnos.codigoMedioPago, turnos.codigoDetalleTurno, turnos.codigoCliente, turnos.codigoMascota FROM turnos INNER JOIN clientes AS cli ON turnos.codigoCliente = cli.dni WHERE (turnos.codigoDetalleTurno = @codigoDetalleTurno)" UpdateCommand="UPDATE turnos SET fechaTurno = @fechaTurno, horario = @horario, codigoMedioPago = @codigoMedioPago, codigoMascota = @codigoMascota WHERE (codigoDetalleTurno = @codigoDetalleTurno)">
            <SelectParameters>
                <asp:Parameter Name="codigoDetalleTurno" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="fechaTurno" />
                <asp:Parameter Name="horario" />
                <asp:Parameter Name="codigoMedioPago" />
                <asp:Parameter Name="codigoMascota" />
                <asp:Parameter Name="codigoDetalleTurno" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idDetalleTurno, importeTurno, codigoServicio, observacionTurno, duracionTurno FROM detalleTurno WHERE (idDetalleTurno = @idDetalleTurno)" UpdateCommand="UPDATE detalleTurno SET importeTurno = @importeTurno, codigoServicio = @codigoServicio, observacionTurno = @observacionTurno, duracionTurno = @duracionTurno WHERE (idDetalleTurno = @idDetalleTurno)">
            <SelectParameters>
                <asp:Parameter Name="idDetalleTurno" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="importeTurno" />
                <asp:Parameter Name="codigoServicio" />
                <asp:Parameter Name="observacionTurno" />
                <asp:Parameter Name="duracionTurno" />
                <asp:Parameter Name="idDetalleTurno" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMasc2" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT ta.nombreTamaño, ra.nombreRaza FROM mascotas AS ma INNER JOIN tamaños AS ta ON ta.codigoTamaño = ma.codigoTamaño INNER JOIN razas AS ra ON ra.codigoRaza = ma.codigoRaza WHERE (ma.idMascota = @idMascota)">
            <SelectParameters>
                <asp:Parameter Name="idMascota" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTiempoDisponible" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT t.fechaTurno, SUM(CAST(dt.duracionTurno AS DECIMAL(10 , 1))) AS DuracionTotal FROM turnos AS t INNER JOIN detalleTurno AS dt ON t.numeroTurno = dt.idDetalleTurno WHERE (t.fechaTurno = @fechaTurno) GROUP BY t.fechaTurno">
            <SelectParameters>
                <asp:Parameter Name="fechaTurno" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
