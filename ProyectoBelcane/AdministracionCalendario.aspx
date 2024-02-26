<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionCalendario.aspx.cs" Inherits="ProyectoBelcane.AdministracionCalendario"  %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .gridview-container {
            height: 400px; /* Ajusta esta altura según tus necesidades */
            overflow-y: auto;
        }

        .colgeneral {
            width: 25%; /* Ajusta el valor según tus necesidades */
            height: 30px;
            float: left;
        }

        .col4 {
            width: 19%; /* Ajusta el valor según tus necesidades */
            height: 30px;
            float: left;
        }

        .columna1 {
            width: 38%; /* Ajusta el valor según tus necesidades */
            height: 545px;
            float: left;
        }

        .columna2 {
            width: 61%; /* Ajusta el valor según tus necesidades */
            height: 510px;
            float: left;
        }


        .colu {
            /*width: 200px; /* Ajusta el valor según tus necesidades */
            height: 510px;
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
            </div>
        <div class="container">
            <br />
            <h3 align="center">Administración de Turnos</h3>
            <br />
            <br />
            <div class="row">
                <div class="columna1">


                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="373px" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" SelectionMode="DayWeekMonth" Width="450px">
                        <DayHeaderStyle BackColor="#FFFFCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" BackColor="#9966FF" BorderColor="#9999FF" />
                        <OtherMonthDayStyle ForeColor="#808080" BackColor="#CCCCFF" />
                        <SelectedDayStyle BackColor="#9999FF" Font-Bold="True" ForeColor="White" />
                        <SelectorStyle BackColor="#9966FF" />
                        <TitleStyle BackColor="#9966FF" BorderColor="Black" Font-Bold="True" />
                        <TodayDayStyle BackColor="#9966FF" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                    <br />
                    <div class="row">
                        <div class="col-md-6">
                            <asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Width="100%" OnClick="Button2_Click" Text="Ver todos los Turnos." CausesValidation="False" />
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-6"><b>DNI Cliente :</b><asp:TextBox ID="TextBox8" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox><asp:Label ID="Label7" runat="server" ForeColor="#FF6600"></asp:Label></div>
                        <div class="col-md-6">
                            <br />
                            <asp:Button ID="Button6" CssClass="btn btn-dark" runat="server" OnClick="Button6_Click" Text="Buscar Turnos" CausesValidation="False" />
                        </div>
                    </div>

                    <br />
                    <br />

                </div>
                <div class="columna2">
                    <div class="row">
                        <div class="col-md-3"><b>Fecha Turno :</b></div>
                        <div class="col-md-4">
                            <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="Date" oninput="fechaSeleccionada(this.value)"></asp:TextBox>
                        </div>
                        <div class="col-md-3"><b>Hora :</b></div>
                        <div class="col-md-2">
                            <asp:TextBox ID="TextBox2" runat="server" class="form-control" Type="Time" min="08:00" max="18:00"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"></div>
                        <div class="col-md-4">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Seleccionar Fecha.</asp:RequiredFieldValidator>
                        </div>
                        <div class="col-md-2"></div>
                        <div class="col-md-3">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Seleccionar Hora.</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"><b>DNI Cliente:</b></div>
                        <div class="col-md-4">
                            <asp:TextBox ID="TextBox3" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Verificar Cliente" CausesValidation="False" />
                        </div>
                        <div class="col-md-3">
                            <asp:Label ID="Label2" runat="server"></asp:Label>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3"><b>Nombre Cliente :</b></div>
                        <div class="col-md-4">
                            <asp:TextBox ID="TextBox6" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                        </div>
                        <div class="col-md-5">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe cargar el cliente.</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3"><b>Selecc. Mascota:</b></div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-dark" DataSourceID="DSMascotas" DataTextField="nombreMascota" DataValueField="idMascota" OnSelectedIndexChanged="MostrarRaza" AutoPostBack="True" Width="100%">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-2"><b>Raza :</b><asp:Label ID="Label3" runat="server"></asp:Label></div>
                        <div class="col-md-3"><b>Tamaño :</b><asp:Label ID="Label4" runat="server"></asp:Label></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-3"><b>Servicio :</b></div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="DropDownList2" CssClass="btn btn-dark" runat="server" DataSourceID="DSServicios" DataTextField="nombreServicio" DataValueField="idServicio" Width="100%">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3"><b>Duración Aprox :</b></div>
                        <div class="col-md-2">
                            <asp:DropDownList ID="DropDownList4" CssClass="btn btn-dark" runat="server" Width="100%">
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
                    </div>
                    <br />
                    <div class="row">
                        <div class="col-md-8"></div>
                        <div class="col-md-4">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3"><b>Medio de Pago :</b></div>
                        <div class="col-md-4">
                            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="btn btn-dark" DataSourceID="DSMedioPago" DataTextField="descripcionMedioPago" DataValueField="codigoMedioPago" Width="100%">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-3"><b>Importe :</b></div>
                        <div class="col-md-2">
                            <asp:TextBox ID="TextBox4" class="form-control" runat="server" TextMode="Number"></asp:TextBox>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4"></div>
                        <div class="col-md-8" align="right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe cargar el importe del turno.</asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Importe del Turno Incorrecto." ForeColor="#FF6600" MaximumValue="35000" MinimumValue="1000" Type="Double"></asp:RangeValidator>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"><b>Observ/Dato :</b></div>
                        <div class="col-md-10">
                            <asp:TextBox ID="TextBox5" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div class="row">
                        <div class="col-md-3">
                            <asp:Button ID="Button5" runat="server" CssClass="btn btn-dark" OnClick="Button5_Click" Text="Registrar Turno" Width="160px" />
                        </div>
                        <div class="col-md-3">
                            <asp:Button ID="Button3" runat="server" CssClass="btn btn-dark" Text="Cancelar Registro" CausesValidation="False" OnClick="Button3_Click" Width="160px" />
                        </div>
                        <div class="col-md-6"><asp:Label ID="Label5" runat="server"></asp:Label></div>
                            
                   </div>

                </div>
                <br />
                <br />
                </div>
                <div class="row">
                    <div class="gridview-container">
                        <asp:Label ID="Label6" runat="server"></asp:Label>
                    </div>
                </div>
                


            </div>
            <asp:SqlDataSource ID="DSMedioPago" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoMedioPago, descripcionMedioPago FROM mediosdepago ORDER BY codigoMedioPago"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSServicios" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idServicio, nombreServicio FROM servicios ORDER BY idServicio"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idMascota, nombreMascota, codigoDueño FROM mascotas WHERE (codigoDueño = @codigoDueño) OR (idMascota = 1008) ORDER BY idMascota">
                <SelectParameters>
                    <asp:Parameter Name="codigoDueño" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSCliente" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT dni, nombre, apellido FROM clientes WHERE (dni = @dni)">
                <SelectParameters>
                    <asp:Parameter Name="dni" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSRaza" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT mas.idMascota, mas.codigoRaza, mas.codigoTamaño, ta.nombreTamaño, ra.nombreRaza FROM mascotas AS mas INNER JOIN razas AS ra ON mas.codigoRaza = ra.codigoRaza INNER JOIN tamaños AS ta ON mas.codigoTamaño = ta.codigoTamaño WHERE (mas.idMascota = @idMascota)">
                <SelectParameters>
                    <asp:Parameter Name="idMascota" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTurno" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" InsertCommand="INSERT INTO turnos(fechaTurno, horario, codigoMedioPago, codigoDetalleTurno, codigoCliente, codigoMascota,usuario) VALUES (@fechaTurno, @horario, @codigoMedioPago, @codigoDetalleTurno, @codigoCliente, @codigoMascota,@usuario)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT tu.codigoDetalleTurno, format(tu.fechaTurno, 'dd-MM-yyyy') AS fecha_formato, tu.horario, mas.nombreMascota, cli.nombre, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio WHERE (tu.fechaTurno &gt;= @fechaActual) ORDER BY tu.fechaTurno, tu.horario">
                <InsertParameters>
                    <asp:Parameter Name="fechaTurno" />
                    <asp:Parameter Name="horario" />
                    <asp:Parameter Name="codigoMedioPago" />
                    <asp:Parameter Name="codigoDetalleTurno" />
                    <asp:Parameter Name="codigoCliente" />
                    <asp:Parameter Name="codigoMascota" />
                    <asp:Parameter Name="usuario" />
                </InsertParameters>
                <SelectParameters>
                    <asp:Parameter Name="fechaActual" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTurno2" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT tu.codigoDetalleTurno, format(tu.fechaTurno, 'dd-MM-yyyy') AS fecha, tu.horario, mas.nombreMascota, cli.nombre, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio WHERE (tu.fechaTurno = @fechaTurno) ORDER BY tu.horario">
                <SelectParameters>
                    <asp:Parameter Name="fechaTurno" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSDetalleTurno" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" InsertCommand="INSERT INTO detalleTurno(importeTurno, codigoServicio, observacionTurno, duracionTurno) VALUES (@importeTurno, @codigoServicio, @observacionTurno, @duracionTurno)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>">
                <InsertParameters>
                    <asp:Parameter Name="importeTurno" />
                    <asp:Parameter Name="codigoServicio" />
                    <asp:Parameter Name="observacionTurno" />
                    <asp:Parameter Name="duracionTurno" />
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="DSUltReg" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT MAX(idDetalleTurno) AS Expr1 FROM detalleTurno"></asp:SqlDataSource>
            <asp:SqlDataSource ID="DSTurnDni" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT tu.codigoDetalleTurno, format(tu.fechaTurno, 'dd-MM-yyyy') AS fecha, tu.horario, mas.nombreMascota, cli.nombre, ser.nombreServicio, { fn CONCAT(det.duracionTurno, ' hs') } AS duracionTurnoConTexto FROM turnos AS tu INNER JOIN mascotas AS mas ON tu.codigoMascota = mas.idMascota INNER JOIN clientes AS cli ON tu.codigoCliente = cli.dni INNER JOIN detalleTurno AS det ON tu.codigoDetalleTurno = det.idDetalleTurno INNER JOIN servicios AS ser ON det.codigoServicio = ser.idServicio WHERE (tu.codigoCliente = @codigoCliente) ORDER BY tu.fechaTurno DESC, tu.horario">
                <SelectParameters>
                    <asp:Parameter Name="codigoCliente" />
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
