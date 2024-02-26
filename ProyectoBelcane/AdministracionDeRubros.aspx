<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionDeRubros.aspx.cs" Inherits="ProyectoBelcane.AdministracionDeRubros" %>

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
            <h3 align="center">Bienvenido a la Administración de Rubros</h3><br />
            
            <br />
            <div class="row">
                <div class="col-md-3"><b>Rubro :</b><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-2"><br /><asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Agregar Rubro" /></div>
                <div class="col-md-4"><br /><asp:Label ID="Label1" runat="server"></asp:Label></div>
            </div>
        <br />
        <br />
            <asp:GridView ID="GridView1" class="table table-striped" runat="server" AutoGenerateColumns="False" DataKeyNames="idRubro" DataSourceID="DSRubros" OnRowEditing="GridView1_RowEditing">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="idRubro" HeaderText="Codigo" InsertVisible="False" ReadOnly="True" SortExpression="idRubro" Visible="False" />
                    <asp:TemplateField HeaderText="Rubro" SortExpression="nombreRubro">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("nombreRubro") %>'></asp:TextBox>
                            <br />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe ingresar el nombre del rubro."></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("nombreRubro") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        <br />
        <br />
        <br />
        </div>
        <asp:SqlDataSource ID="DSRubros" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM rubros WHERE (idRubro = @idRubro)" InsertCommand="INSERT INTO rubros(nombreRubro) VALUES (@nombreRubro)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT idRubro,nombreRubro FROM rubros WHERE (idRubro &lt;&gt; 1) ORDER BY nombreRubro" UpdateCommand="UPDATE rubros SET nombreRubro = @nombreRubro WHERE (idRubro = @idRubro)">
            <DeleteParameters>
                <asp:Parameter Name="idRubro" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nombreRubro" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nombreRubro" />
                <asp:Parameter Name="idRubro" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSExisteRubro" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idRubro, nombreRubro FROM rubros WHERE (nombreRubro = @nombreRubro)">
            <SelectParameters>
                <asp:Parameter Name="nombreRubro" />
            </SelectParameters>
        </asp:SqlDataSource>
        </form>
</body>
</html>