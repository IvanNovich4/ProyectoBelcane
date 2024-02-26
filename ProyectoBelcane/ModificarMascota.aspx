<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificarMascota.aspx.cs" Inherits="ProyectoBelcane.ModificarMascota" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
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

            <h3 align="center">Editar Información de la Mascota</h3>
            <br />
            <br />
            <br />
            <div class="row">
                <div class="col-md-1">
                    <b>Mascota :</b>   
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-1">
                    <b>Tamaño :</b>
                </div>
                <div class="col-md-3">
                    <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" DataSourceID="DSTamaño" DataTextField="nombreTamaño" DataValueField="codigoTamaño" Width="250px">
                    </asp:DropDownList>
                </div>
                <div class="col-md-1">
                    <b>Color :</b>
                </div>
                <div class="col-md-2">
                    <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
                <div class="col-md-2">
                    <asp:CheckBox ID="CheckBox1" runat="server" Text="Propio de la raza." />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-1"><b>Edad :</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" ></asp:TextBox></div>
                <div class="col-md-1"><b>Manto :</b></div>
                <div class="col"><asp:DropDownList ID="DropDownList2" CssClass="btn btn-dark" runat="server" DataSourceID="DSManto" DataTextField="nombreManto" DataValueField="codigoManto" Width="250px">
         </asp:DropDownList></div>
                <div class="col-md-1"><b>Castrado :</b></div>
                <div class="col-md-4"><asp:RadioButton ID="RadioButton1" runat="server" GroupName="1" Text="Si - Castrado" />
                &nbsp;<asp:RadioButton ID="RadioButton2" runat="server" GroupName="1" Text="No - Castrado" /></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-1"><b>Sexo :</b></div>
                <div class="col-md-2"> <asp:RadioButton ID="RadioButton5" runat="server" GroupName="3" Text="Hembra" />
                &nbsp;
        <asp:RadioButton ID="RadioButton6" runat="server" GroupName="3" Text="Macho" /></div>
                <div class="col-md-1"><b>Raza :</b></div>
                <div class="col"><asp:DropDownList ID="DropDownList3" CssClass="btn btn-dark" runat="server" DataSourceID="DSRaza" DataTextField="nombreRaza" DataValueField="codigoRaza" Width="250px">
                    </asp:DropDownList></div>
                <div class="col-md-1"><b>Alergia :</b></div>
                <div class="col-md-4"><asp:RadioButton ID="RadioButton3" runat="server" GroupName="2" Text="Es Alergico" />
                &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="2" Text="No es Alergico" /></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-1"><b>Comport. :</b></div>
                <div class="col-md-2"><asp:DropDownList ID="DropDownList4" CssClass="btn btn-dark" runat="server" Width="100%" >
            <asp:ListItem>A evaluar</asp:ListItem>
            <asp:ListItem>Malo</asp:ListItem>
            <asp:ListItem>Bueno</asp:ListItem>
            <asp:ListItem>Muy Bueno</asp:ListItem>
            <asp:ListItem>Excelente</asp:ListItem>
        </asp:DropDownList></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-7"></div>
                <b>Comentarios / Otros Datos de Interés :</b><br />
                <asp:TextBox ID="TextBox4" class="form-control" runat="server" Height="61px" TextMode="MultiLine"></asp:TextBox>
            </div>
            <br />
            <div class="row">
                <div class="col-md-1"> <b>Dueño :</b></div>
                <div class="col-md-2"> <asp:Label ID="Label3" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label4" runat="server"></asp:Label></div>
                <div class="col-md-1"><b>DNI :</b></div>
                <div class="col-md-3"><asp:TextBox ID="TextBox5" CssClass="form-control" runat="server" TextMode="Number" Width="250px"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Verificar Nuevo Dueño" /></div>
                <div class="col-md-3"><asp:Label ID="Label5" runat="server"></asp:Label></div>
            </div>
            <br />
            <br />
            <div class="row">
                <div class="col-md-2"><asp:Button ID="Button2" runat="server" CssClass="btn btn-dark" OnClick="Button2_Click" Text="Modificar Datos" Width="175px" /></div>
                <div class="col-md-2"><asp:Button ID="Button4" runat="server" CssClass="btn btn-dark" OnClick="Button4_Click" Text="Cancelar" Width="175px" /></div>
                <div class="col-md-8"><asp:Label ID="Label2" runat="server"></asp:Label></div>
            </div>
        </div>

        
        <asp:SqlDataSource ID="DSMascota" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT m.idMascota, m.nombreMascota, m.edadMascota, m.sexo, t.codigoTamaño, ntos.codigoManto, r.codigoRaza, m.color, m.castrado, m.alergia, m.comportamiento, m.comentarios, c.dni, c.nombre, c.apellido FROM mascotas AS m INNER JOIN tamaños AS t ON m.codigoTamaño = t.codigoTamaño INNER JOIN mantos AS ntos ON m.codigoManto = ntos.codigoManto INNER JOIN razas AS r ON m.codigoRaza = r.codigoRaza INNER JOIN clientes AS c ON m.codigoDueño = c.dni WHERE (m.idMascota = @idMascota)" UpdateCommand="UPDATE mascotas SET nombreMascota = @nombreMascota, edadMascota = @edadMascota, codigoTamaño = @codigoTamaño, sexo=@sexo, codigoManto = @codigoManto, codigoRaza = @codigoRaza, color = @color, castrado = @castrado, alergia = @alergia, comportamiento = @comportamiento, comentarios = @comentarios, codigoDueño=@codigoDueño WHERE (idMascota = @idMascota)">
            <SelectParameters>
                <asp:Parameter Name="idMascota" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreMascota" />
                <asp:Parameter Name="edadMascota" />
                <asp:Parameter Name="codigoTamaño" />
                <asp:Parameter Name="sexo" />
                <asp:Parameter Name="codigoManto" />
                <asp:Parameter Name="codigoRaza" />
                <asp:Parameter Name="color" />
                <asp:Parameter Name="castrado" />
                <asp:Parameter Name="alergia" />
                <asp:Parameter Name="comportamiento" />
                <asp:Parameter Name="comentarios" />
                <asp:Parameter Name="codigoDueño" />
                <asp:Parameter Name="idMascota" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTamaño" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoTamaño, nombreTamaño FROM tamaños WHERE (codigoTamaño &lt;&gt; 1)"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRaza" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas WHERE (codigoRaza &lt;&gt; 1) ORDER BY nombreRaza"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSManto" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoManto, nombreManto FROM mantos WHERE (codigoManto &lt;&gt; 1) ORDER BY nombreManto"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDueño" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT dni, nombre, apellido FROM clientes WHERE (dni = @dni)">
            <SelectParameters>
                <asp:Parameter Name="dni" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
