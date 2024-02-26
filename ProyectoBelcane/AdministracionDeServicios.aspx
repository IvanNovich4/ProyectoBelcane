<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionDeServicios.aspx.cs" Inherits="ProyectoBelcane.AdministracionDeServicios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
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

            <h3 align="center">Bienvenido a la Administración de Servicios</h3><br />
            
            <br />
            <div class="row">
                <div class="col-md-3"><b>Servicio</b> <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-2"><br /><asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Agregar Servicio" /></div>
                <div class="col-md-4"><br /><asp:Label ID="Label1" runat="server"></asp:Label></div>
            </div>
        <br />
            <br />
            <asp:GridView ID="GridView1" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="idServicio" DataSourceID="DSServicios" OnRowEditing="GridView1_RowEditing">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="idServicio" HeaderText="Cod Serv." InsertVisible="False" ReadOnly="True" SortExpression="idServicio" Visible="False" />
                    <asp:TemplateField HeaderText="Servicio" SortExpression="nombreServicio">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombreServicio") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe cargar el nombre del servicio."></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombreServicio") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <br />
        <br />
        </div>
        <asp:SqlDataSource ID="DSServicios" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM servicios WHERE (idServicio = @idServicio)" InsertCommand="INSERT INTO servicios(nombreServicio) VALUES (@nombreServicio)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idServicio, nombreServicio FROM servicios WHERE (idServicio &lt;&gt; 2) ORDER BY nombreServicio" UpdateCommand="UPDATE servicios SET nombreServicio = @nombreServicio WHERE (idServicio = @idServicio)">
            <InsertParameters>
                <asp:Parameter Name="nombreServicio" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSExisteServicio" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idServicio, nombreServicio FROM servicios WHERE (nombreServicio = @nombreServicio)">
            <SelectParameters>
                <asp:Parameter Name="nombreServicio" />
            </SelectParameters>
        </asp:SqlDataSource>
        </form>
</body>
</html>