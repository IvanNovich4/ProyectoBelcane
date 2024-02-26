<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdministracionComprasInsumos.aspx.cs" Inherits="ProyectoBelcane.AdministracionComprasInsumos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous" />
    <style>
        .gridview-container {
            height: 300px; /* Ajusta esta altura según tus necesidades */
            overflow-y: auto;
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

            <h3 align="center">Registrar Nueva Compra de Insumos</h3>
            <br />
            <div class="row align-items-center">
                <div class="Container">

                    <br />
                    <div class="row">
                <div class="col-md-2"><b>Seleccione Rubro :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" CssClass="btn btn-dark" DataSourceID="DSRubros" DataTextField="nombreRubro" DataValueField="idRubro" Width="100%" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList></div>
                <div class="col-md-2"><b>Insumo/Servicio :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList1" runat="server" CssClass="btn btn-dark" DataSourceID="DSFiltrado" Width="100%" DataTextField="nombreInsumo" DataValueField="idInsumo">
        </asp:DropDownList></div>
            </div>
                    <br />
                    <div class="row">
                <div class="col-md-2"><b>Precio Unitario :</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" Width="130px" TextMode="Number"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Precio Invalido." ValidationExpression="^[0-9]+(\.[0-9]{1,2})?$"></asp:RegularExpressionValidator>
                </div>
                <div class="col-md-1"><b> Cantidad :</b></div>
                <div class="col-md-2"><asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Width="130px" TextMode="Number"></asp:TextBox></div>
                <div class="col-md-2"><asp:Button ID="Button2" CssClass="btn btn-dark" runat="server" Text="Agregar a la Lista" OnClick="Button2_Click" /></div>
                <div class="col-md-3"><asp:Label ID="Label1" runat="server"></asp:Label></div>
               </div>
                    <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="El precio no puede ser menor o igual a cero." MaximumValue="9999999" MinimumValue="1"></asp:RangeValidator>
            <br />
                

                <div class="row">

                    <div class="gridview-container">
                    <asp:GridView ID="GridView1" runat="server" class="table table-striped" AutoGenerateColumns="False" DataKeyNames="idUnicoDetalle" DataSourceID="DSDetCompra" OnRowUpdated="GridView1_RowUpdated" OnRowDeleted="GridView1_RowDeleted">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                            <asp:BoundField DataField="idUnicoDetalle" HeaderText="Cod." InsertVisible="False" ReadOnly="True" SortExpression="idUnicoDetalle" />
                            <asp:TemplateField HeaderText="Cant." SortExpression="cantidad">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("cantidad") %>' TextMode="Number" Width="47px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Ingrese una cantidad."></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="Requiere un valor entero." MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("cantidad") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="nombreInsumo" HeaderText="Ins / Serv" SortExpression="nombreInsumo" ReadOnly="True" />
                            <asp:BoundField DataField="nombreRubro" HeaderText="Rubro" SortExpression="nombreRubro" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Prec Un." SortExpression="precioUnidad">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("precioUnitario") %>' TextMode="Number" Width="92px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="Requiere un Precio"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="El precio no puede ser cero." MaximumValue="9999999" MinimumValue="1" Type="Double"></asp:RangeValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("precioUnitario", "{0:c}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="totalPorProducto" HeaderText="Total Un." SortExpression="totalPorProducto" ReadOnly="True" DataFormatString="{0:c}" />
                        </Columns>
                    </asp:GridView>
                        </div>
                    </div>


                    <br />

                </div>
                <div class="row">
                <div class="col-md-2"><b>Total de la Compra : </b></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"></div>
                <div class="col"><b><asp:Label ID="Label5" runat="server"></asp:Label></b></div>
            </div>
                
                <br />
                &nbsp;<asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>

                <br />
                <div class="row">
                <div class="col-md-3"><b>Como se abona la compra :</b></div>
                <div class="col-md-3"><asp:DropDownList ID="DropDownList3" CssClass="btn btn-dark" runat="server" DataSourceID="DSPago" DataTextField="descripcionMedioPago" DataValueField="codigoMedioPago">
        </asp:DropDownList></div>
            </div>
                <br />
                <br />
                <div class="row">
                <div class="col-md-6"><b>Dato/Comentario :</b><br /><asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" TextMode="MultiLine" Width="100%"></asp:TextBox></div>
            </div>
                <br />
                <br />
                <br />
                <br />
                <div class="row">
                <div class="col-md-2"><asp:Button ID="Button4" CssClass="btn btn-dark" runat="server" Text="Confirmar Compra" OnClick="Button4_Click" Width="175px" /></div>
                <div class="col-md-2"><asp:Button ID="Button5" CssClass="btn btn-dark" runat="server" OnClick="Button5_Click" Text="Cancelar Compra" CausesValidation="False" Width="175px" /></div>
                <div class="col-md-6"><asp:Label ID="Label2" runat="server"></asp:Label></div>
            </div>  
            </div>


        </div>
        <asp:SqlDataSource ID="DSDetCompra" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" InsertCommand="INSERT INTO detalleCompra(insumoServicio, precioUnitario,codigoRubro, cantidad, idDetalle) VALUES (@insumoServicio, @precioUnitario, @codigoRubro,@cantidad, @idDetalle)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT det.idUnicoDetalle, det.cantidad, ins.nombreInsumo, ru.nombreRubro, FORMAT(det.precioUnitario, 'C', 'es-AR') AS precioUnitario, FORMAT(det.totalPorProducto, 'C', 'es-AR') AS totalPorProducto FROM detalleCompra AS det INNER JOIN insumos AS ins ON ins.idInsumo = det.insumoServicio INNER JOIN rubros AS ru ON ru.idRubro = det.codigoRubro WHERE (det.idDetalle = @idDetalle)" DeleteCommand="DELETE FROM detalleCompra WHERE (idUnicoDetalle = @idUnicoDetalle)" UpdateCommand="UPDATE detalleCompra SET cantidad = @cantidad, precioUnitario = @precioUnitario WHERE (idUnicoDetalle = @idUnicoDetalle)">
            <DeleteParameters>
                <asp:Parameter Name="idUnicoDetalle" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="insumoServicio" />
                <asp:Parameter Name="precioUnitario" />
                <asp:Parameter Name="codigoRubro" />
                <asp:Parameter Name="cantidad" />
                <asp:Parameter Name="idDetalle" />
            </InsertParameters>
            <SelectParameters>
                <asp:Parameter Name="idDetalle" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="cantidad" />
                <asp:Parameter Name="precioUnitario" />
                <asp:Parameter Name="idUnicoDetalle" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSCompra" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" InsertCommand="INSERT INTO compras(codigoDetalle, fecha, importeTotalCompra, codigoPago,comentarioCompra,usuarioCompra) VALUES (@codigoDetalle, @fecha, @importeTotalCompra, @codigoPago,@comentarioCompra,@usuarioCompra)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>">
            <InsertParameters>
                <asp:Parameter Name="codigoDetalle" />
                <asp:Parameter Name="fecha" />
                <asp:Parameter Name="importeTotalCompra" />
                <asp:Parameter Name="codigoPago" />
                <asp:Parameter Name="comentarioCompra" />
                <asp:Parameter Name="usuarioCompra" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSCodDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT MAX(idDetalle) AS ultDetalle FROM detalleCompra"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSRubros" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idRubro, nombreRubro FROM rubros"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSFiltrado" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT idInsumo, nombreInsumo, codigoRubro FROM insumos WHERE (codigoRubro = @codigoRubro) OR (idInsumo = 1) ORDER BY idInsumo">
            <SelectParameters>
                <asp:Parameter Name="codigoRubro" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSPago" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoMedioPago, descripcionMedioPago FROM mediosdepago"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTotalCompra" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT SUM(totalPorProducto) AS sumaTotal FROM detalleCompra WHERE (idDetalle = @idDetalle)">
            <SelectParameters>
                <asp:Parameter Name="idDetalle" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSBorraDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" DeleteCommand="DELETE FROM detalleCompra WHERE (idDetalle = @idDetalle)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="idDetalle" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
