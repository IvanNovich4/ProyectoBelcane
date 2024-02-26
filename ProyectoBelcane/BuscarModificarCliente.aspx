<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BuscarModificarCliente.aspx.cs" Inherits="ProyectoBelcane.BuscarModificarCliente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
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

          <h3 align="center">Busqueda / Modificación de Clientes</h3>
        <br />
            <br />
           <div class="row">
                <div class="col-md-2"><b>Ingrese DNI del cliente :</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="Button5" CssClass="btn btn-dark" Width="100%" runat="server" Text="Buscar Cliente" OnClick="Button5_Click" CausesValidation="False" /></div>
                <div class="col-md-4"><asp:Label ID="Label4" runat="server" ForeColor="#FF6600"></asp:Label></div>                
            </div>
           <br />
           <br />
           <div class="row">
                <div class="col-md-1"><b>DNI :</b></div>
                <div class="col-md-2"><asp:Label ID="Label5" runat="server"></asp:Label></div>
                <div class="col"></div>             
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Nombre :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar un nombre.</asp:RequiredFieldValidator></div>             
               <div class="col-md-1"><b>Apellido :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox2" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar un apellido.</asp:RequiredFieldValidator></div>             
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Telefono :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox4" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe cargar un numero de Teléfono.</asp:RequiredFieldValidator></div>             
               <div class="col-md-1"><b>Correo :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar un correo.</asp:RequiredFieldValidator></div>                
            </div>
           <br />
            <div class="row">
                
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Provincia :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList1" Width="100%" runat="server" CssClass="btn btn-dark" AutoPostBack="True" OnSelectedIndexChanged="BuscarLocalidad" DataSourceID="DSProvincias" DataTextField="nombreProvincia" DataValueField="idProvincia">
                </asp:DropDownList><asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="CustomValidator" ForeColor="#FF6600" OnServerValidate="CustomValidator1_ServerValidate">Debe seleccionar una Provincia.</asp:CustomValidator></div>                               
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Localidad :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList2" Width="100%" runat="server" CssClass="btn btn-dark" AutoPostBack="True" OnSelectedIndexChanged="BuscarBarrio" DataSourceID="DSLocalidad" DataTextField="nombreLocalidad" DataValueField="idLocalidad">
                </asp:DropDownList><asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="DropDownList2" ErrorMessage="CustomValidator" ForeColor="#FF6600" OnServerValidate="CustomValidator2_ServerValidate">Debe seleccionar una Localidad.</asp:CustomValidator></div>
                <div class="col-md-1">Agre Loc.</div>
                <div class="col-md-3"><asp:TextBox ID="TextBox6" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="Button3" CssClass="btn btn-dark" Width="100%" runat="server" Text="Agregar Localidad" OnClick="Button3_Click"  /></div>
                <div class="col"><asp:Label ID="Label1" runat="server"></asp:Label></div>                 
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Barrio :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList3" Width="100%" CssClass="btn btn-dark" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BorrarLabelBarrio" DataSourceID="DSBarrio" DataTextField="nombreBarrio" DataValueField="idBarrio">
                </asp:DropDownList><asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="DropDownList3" ErrorMessage="CustomValidator" ForeColor="#FF6600" OnServerValidate="CustomValidator3_ServerValidate">Debe seleccionar un Barrio.</asp:CustomValidator></div>
                <div class="col-md-1">Agre Barrio</div>
                <div class="col-md-3"><asp:TextBox ID="TextBox7" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="Button4" CssClass="btn btn-dark" Width="100%" runat="server" Text="Agregar Barrio" OnClick="Button4_Click"  /></div>
                <div class="col"><asp:Label ID="Label2" runat="server"></asp:Label></div>
            </div>
           <br />
           <div class="row">
                <div class="col-md-1"><b>Dirección :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox8" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col"><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox8" ErrorMessage="RequiredFieldValidator" ForeColor="#FF6600">Debe ingresar una dirección.</asp:RequiredFieldValidator></div>              
            </div>
           <br />
           <br />
           <div class="row">
                <div class="col-md-3"><asp:Button ID="Button2" CssClass="btn btn-dark" Width="100%" runat="server" Text="Modificar Cliente" OnClick="Button2_Click"  /></div>
                <div class="col-md-3"><asp:Button ID="Button6" CssClass="btn btn-dark" Width="100%" runat="server" Text="Cancelar Modificación." OnClick="Button6_Click" CausesValidation="False"  /></div>
                <div class="col"><asp:Label ID="Label3" runat="server"></asp:Label></div>                
            </div>
        
          </div>
        <asp:SqlDataSource ID="DSClientes" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.nombre, c.apellido, c.telefono, c.correo, c.direccion, c.codigoBarrio, b.codigoLocalidad, l.codigoProvincia FROM clientes AS c INNER JOIN barrios AS b ON c.codigoBarrio = b.idBarrio INNER JOIN localidad AS l ON l.idLocalidad = b.codigoLocalidad WHERE (c.dni = @dni)" UpdateCommand="UPDATE clientes SET nombre = @nombre, apellido = @apellido, telefono = @telefono, correo = @correo, direccion = @direccion, codigoBarrio = @codigoBarrio WHERE (dni = @dni)">
            <SelectParameters>
                <asp:Parameter Name="dni" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombre" />
                <asp:Parameter Name="apellido" />
                <asp:Parameter Name="telefono" />
                <asp:Parameter Name="correo" />
                <asp:Parameter Name="direccion" />
                <asp:Parameter Name="codigoBarrio" />
                <asp:Parameter Name="dni" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSProvincias" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idProvincia, nombreProvincia FROM provincia"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSLocalidad" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="INSERT INTO localidad(nombreLocalidad, codigoProvincia) VALUES (@nombreLocalidad, @codigoProvincia)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idLocalidad, nombreLocalidad, codigoProvincia FROM localidad WHERE (codigoProvincia = @codigoProvincia) OR (codigoProvincia = 0)">
            <InsertParameters>
                <asp:Parameter Name="nombreLocalidad" />
                <asp:Parameter Name="codigoProvincia" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="codigoProvincia" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSBarrio" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idBarrio, nombreBarrio, codigoLocalidad FROM barrios WHERE (codigoLocalidad = @codigoLocalidad) OR (codigoLocalidad = 0) ORDER BY codigoLocalidad" InsertCommand="INSERT INTO barrios(nombreBarrio, codigoLocalidad) VALUES (@nombreBarrio, @codigoLocalidad)">
            <InsertParameters>
                <asp:Parameter Name="nombreBarrio" />
                <asp:Parameter Name="codigoLocalidad" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="codigoLocalidad" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSClienteInfo" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT c.dni, c.nombre, c.apellido, c.telefono, c.correo, c.direccion, c.codigoBarrio, l.idLocalidad, l.codigoProvincia FROM clientes AS c INNER JOIN barrios AS b ON c.codigoBarrio = b.idBarrio INNER JOIN localidad AS l ON l.idLocalidad = b.codigoLocalidad INNER JOIN provincia AS p ON l.codigoProvincia = p.idProvincia WHERE (c.dni = @dni)">
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
