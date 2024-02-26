<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionMascotas.aspx.cs" Inherits="ProyectoBelcane.AdministracionMascotas" %>

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
                        <asp:Button ID="Button2" CssClass="btn btn-outline-dark" runat="server" Text="Retornar" OnClick="Button2_Click" CausesValidation="False" /></li>
                    &nbsp;&nbsp;
 
                </ul>
            </header>
            <br />

                <h3 align="center">Bienvenido a la administracion de mascotas</h3>
            <div class="row">
                <br />
                <br />
            </div>
            <div class="row">
                <div class="col">
                    <div class="row">
                <div class="col"><b>Raza :</b><br /><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col"><br /><asp:Button ID="Button1" class="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Agregar Raza" Width="155px" /></div>
            </div>
                    <div>
            <asp:Label ID="Label1" runat="server"></asp:Label>
                        <br />
                        <asp:GridView class="table table-striped" ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="codigoRaza" DataSourceID="DSRazas">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:TemplateField HeaderText="Raza" SortExpression="nombreRaza">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombreRaza") %>'></asp:TextBox>
                                        <br />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe cargar un nombre de raza."></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombreRaza") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br />
                        <br />
                    </div>
                    <asp:SqlDataSource ID="DSRazas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" InsertCommand="insert into razas(nombreRaza) values (@nombreRaza)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas WHERE (codigoRaza &lt;&gt; 1) ORDER BY nombreRaza" DeleteCommand="DELETE FROM razas WHERE (codigoRaza=@codigoRaza)" UpdateCommand="UPDATE razas SET nombreRaza = @nombreRaza WHERE (codigoRaza = @codigoRaza)">
                        <DeleteParameters>
                            <asp:Parameter Name="codigoRaza" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="nombreRaza" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="nombreRaza" />
                            <asp:Parameter Name="codigoRaza" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="DSRazas2" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas WHERE (nombreRaza = @nombreRaza)">
                        <SelectParameters>
                            <asp:Parameter Name="nombreRaza" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="col">
                    <div class="row">
                <div class="col"><b>Tamaño :</b><br /><asp:TextBox ID="TextBox2" class="form-control" runat="server"></asp:TextBox></div>
                <div class="col"><br /><asp:Button class="btn btn-dark" ID="Button3" runat="server" OnClick="Button3_Click" Text="Agregar Tamaño" Width="155px" /></div>
            </div>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />
                    <asp:GridView class="table table-striped" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="codigoTamaño" DataSourceID="DSTamaños">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Tamaños " SortExpression="nombreTamaño">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombreTamaño") %>'></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe agregar un tamaño."></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombreTamaño") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <div class="row">
                    <div class="col"><b>Manto :</b><br /><asp:TextBox ID="TextBox3" CssClass="form-control" runat="server"></asp:TextBox></div>
                    <div class="col"><br /><asp:Button ID="Button4" class="btn btn-dark" runat="server" OnClick="Button4_Click" Text="Agregar Manto" Width="155px" /></div>
                    </div>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                    <br />
                    <asp:GridView class="table table-striped" ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="codigoManto" DataSourceID="DSMantos">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Tipos de Mantos" SortExpression="nombreManto">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombreManto") %>'></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe cargar un manto."></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombreManto") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

            </div>
        </div>
        <asp:SqlDataSource ID="DSMantos" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM mantos WHERE (codigoManto = @codigoManto)" InsertCommand="INSERT INTO mantos(nombreManto) VALUES (@nombreManto)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoManto, nombreManto FROM mantos WHERE (codigoManto &lt;&gt; 1) ORDER BY nombreManto" UpdateCommand="UPDATE mantos SET nombreManto = @nombreManto WHERE (codigoManto = @codigoManto)">
            <DeleteParameters>
                <asp:Parameter Name="codigoManto" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombreManto" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreManto" />
                <asp:Parameter Name="codigoManto" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTamaños" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM tamaños WHERE (codigoTamaño = @codigoTamaño)" InsertCommand="INSERT INTO tamaños(nombreTamaño) VALUES (@nombreTamaño)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoTamaño, nombreTamaño FROM tamaños WHERE (codigoTamaño &lt;&gt; 1)" UpdateCommand="UPDATE tamaños SET nombreTamaño = @nombreTamaño WHERE (codigoTamaño = @codigoTamaño)">
            <DeleteParameters>
                <asp:Parameter Name="codigoTamaño" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombreTamaño" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreTamaño" />
                <asp:Parameter Name="codigoTamaño" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSMantos2" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoManto, nombreManto FROM mantos WHERE (nombreManto = @nombreManto)">
            <SelectParameters>
                <asp:Parameter Name="nombreManto" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTamaños2" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoTamaño, nombreTamaño FROM tamaños WHERE (nombreTamaño = @nombreTamaño)">
            <SelectParameters>
                <asp:Parameter Name="nombreTamaño" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
