<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrarMascotas.aspx.cs" Inherits="ProyectoBelcane.RegistrarMascotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        td {
            padding: 5px;
        }

        .auto-style1 {
            width: 256px;
        }

        .auto-style2 {
            width: 175px;
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
            <br />

            <h3 align="center">Registrar Mascotas</h3>

            <br />
            <br />
            <div>
                <div class="row">
                    <div class="col-md-3">
                        <b>N° Documento del Dueño (Registrado):</b>
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control" TextMode="Number" Width="237px"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" OnClick="Button3_Click" Text="Verificar Dueño" Width="200px" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label ID="Label2" runat="server" ForeColor="Black"></asp:Label>
                    </div>
                </div>
            </div>
            <hr />
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col"><b>Nombre de Mascota:</b></div>
                        <div class="col">
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Width="235px"></asp:TextBox></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><b>Edad:</b></div>
                        <div class="col">
                            <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Width="235px"></asp:TextBox></div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><b>Sexo:</b></div>
                        <div class="col">
                            <asp:RadioButton ID="RadioButton5" runat="server" GroupName="2" Text="Hembra" />&nbsp;<asp:RadioButton ID="RadioButton6" runat="server" GroupName="2" Text="Macho" /></div>
                    </div>
                    <br />
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col"><b>Tamaño:</b></div>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" DataSourceID="DSTamaños" DataTextField="nombreTamaño" DataValueField="codigoTamaño" Width="200px">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><b>Tipo de Manto:</b></div>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList2" CssClass="btn btn-dark" runat="server" DataSourceID="DSMantos" DataTextField="nombreManto" DataValueField="codigoManto" Width="200px">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <br />
                    <div class="row">
                        <div class="col"><b>Raza:</b></div>
                        <div class="col">
                            <asp:DropDownList ID="DropDownList3" CssClass="btn btn-dark" runat="server" DataSourceID="DSRazas" DataTextField="nombreRaza" DataValueField="codigoRaza" Width="200px">
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
            </div>
            <hr />

            <div style="white-space: nowrap;">


                <table style="display: inline-block; margin-right: 10px; padding: 20px;">
                    <tr>
                        <td><b>Color:</b>&nbsp;</td>
                        <td>
                            <asp:TextBox ID="TextBox5" CssClass="form-control" runat="server"></asp:TextBox></td>
                        <td>
                            <asp:CheckBox ID="CheckBox1" runat="server" Text="Propio de la raza." /></td>
                    </tr>
                    <tr>
                        <td><b>Castrado:</b>&nbsp;</td>
                        <td>
                            <asp:RadioButton ID="RadioButton7" runat="server" GroupName="3" Text="Si - Castrado" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RadioButton ID="RadioButton8" runat="server" GroupName="3" Text="No - Castrado" /></td>
                    </tr>
                    <tr>
                        <td><b>Alergia Piel:</b>&nbsp;</td>
                        <td>
                            <asp:RadioButton ID="RadioButton9" runat="server" GroupName="4" Text="Es Alergico" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:RadioButton ID="RadioButton10" runat="server" GroupName="4" Text="No es Alergico" /></td>
                    </tr>
                </table>



                <table style="display: inline-block; padding: 20px;">
                    <tr>
                        <td><b>Comentarios/Datos adicionales:</b>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox></td>
                    </tr>
                </table>
            </div>

            <hr />

            <div>
                <asp:Button ID="Button4" runat="server" CssClass="btn btn-dark" Text="Registrar Mascota" OnClick="Button2_Click" />
                &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
            </div>
            <br />
        </div>

        <asp:SqlDataSource ID="DSTamaños" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoTamaño, nombreTamaño FROM tamaños"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMantos" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoManto, nombreManto FROM mantos ORDER BY nombreManto"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRazas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas ORDER BY nombreRaza"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSClientes" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT dni, nombre FROM clientes WHERE (dni = @dni)">
            <SelectParameters>
                <asp:Parameter Name="dni" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="INSERT INTO mascotas(nombreMascota, edadMascota, codigoTamaño, codigoManto, codigoRaza, sexo, castrado, alergia, comportamiento,color, comentarios, codigoDueño) VALUES (@nombreMascota, @edadMascota, @codigoTamaño, @codigoManto, @codigoRaza, @sexo, @castrado, @alergia, @comportamiento,@color,@comentarios, @codigoDueño)" ProviderName="System.Data.SqlClient">
            <InsertParameters>
                <asp:Parameter Name="nombreMascota" />
                <asp:Parameter Name="edadMascota" />
                <asp:Parameter Name="codigoTamaño" />
                <asp:Parameter Name="codigoManto" />
                <asp:Parameter Name="codigoRaza" />
                <asp:Parameter Name="sexo" />
                <asp:Parameter Name="castrado" />
                <asp:Parameter Name="alergia" />
                <asp:Parameter Name="comportamiento" />
                <asp:Parameter Name="color" />
                <asp:Parameter Name="comentarios" />
                <asp:Parameter Name="codigoDueño" />
            </InsertParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
