<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionMediosDePago.aspx.cs" Inherits="ProyectoBelcane.AdministracionMediosDePago" %>

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

            <h3 align="center">Bienvenido a la Administración de Medios de Pago</h3><br />
           <br />
            <div class="row">
                <div class="col-md-3"><b>Medio de Pago :</b><br /><asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox></div>
                <div class="col-md-3"><br /><asp:Button ID="Button1" CssClass="btn btn-dark" runat="server" OnClick="Button1_Click" Text="Agregar Medio De Pago" /></div>
                <div class="col-md-5"><br /><asp:Label ID="Label1" runat="server"></asp:Label></div>
            </div>
        
        <br />
        <asp:GridView class="table table-striped" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="codigoMedioPago" DataSourceID="DSPagos" OnRowEditing="GridView1_RowEditing">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:TemplateField HeaderText="Medios de Pagos Vigentes" SortExpression="descripcionMedioPago">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("descripcionMedioPago") %>'></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Debe cargar un nombre."></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("descripcionMedioPago") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="DSPagos" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM mediosdepago WHERE (codigoMedioPago = @codigoMedioPago)" InsertCommand="INSERT INTO mediosdepago(descripcionMedioPago) VALUES (@descripcionMedioPago)" ProviderName="System.Data.SqlClient" SelectCommand="SELECT codigoMedioPago, descripcionMedioPago FROM mediosdepago WHERE (codigoMedioPago &lt;&gt; 7)" UpdateCommand="UPDATE mediosdepago SET descripcionMedioPago = @descripcionMedioPago WHERE (codigoMedioPago = @codigoMedioPago)">
            <DeleteParameters>
                <asp:Parameter Name="codigoMedioPago" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="descripcionMedioPago" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="descripcionMedioPago" />
                <asp:Parameter Name="codigoMedioPago" />
            </UpdateParameters>
        </asp:SqlDataSource>
        </div>
   
        <asp:SqlDataSource ID="DSExisteMedioPago" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" SelectCommand="select codigoMedioPago , descripcionMedioPago from mediosdepago where (descripcionMedioPago = @descripcionMedioPago)">
            <SelectParameters>
                <asp:Parameter Name="descripcionMedioPago" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
    </body>
</html>
