<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GeneralConocerMascotas.aspx.cs" Inherits="ProyectoBelcane.GeneralConocerMascotas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"/>
<style>
  .container1 {
    display: flex;
    width: 100%;
  }
  
  .columna {
    flex: 1;
    padding: 10px;
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

        <h3 align="center"> Conocer Mascotas </h3>
            <br />
            <br />
            <div class="row">
                <div class="col-md-2"><b>Total de Mascotas :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label1" runat="server"></asp:Label></b></div>
                <div class="col-md-9" align="right"><asp:Button ID="Button5" CssClass="btn btn-dark" runat="server" Text="Generar Informe Completo de Mascotas" OnClick="Button5_Click" /></div>
            </div><br />
            <div class="row">
                <div class="col-md-2"><b>Alergicas :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label2" runat="server"></asp:Label></b></div>
                <div class="col-md-2"><b>No Alergicas :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label3" runat="server"></asp:Label></b></div>
            </div><br />
            <div class="row">
                <div class="col-md-2"><b>Con Manto Medular :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label4" runat="server"></asp:Label></b></div>
                <div class="col-md-2"><b>con Cortical :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label5" runat="server"></asp:Label></b></div>
                <div class="col-md-2"><b>Pelo Duro :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label6" runat="server"></asp:Label></b></div>
            </div><br />
            <div class="row">
                <div class="col-md-2"><b>Machos :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label7" runat="server"></asp:Label></b></div>
                <div class="col-md-2"><b>Hembras :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label8" runat="server"></asp:Label></b></div>
            </div><br />
            <div class="row">
                <div class="col-md-2"><b>Castrados :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label18" runat="server"></asp:Label></b></div>
                <div class="col-md-2"><b>Sin Castrar :</b></div>
                <div class="col-md-1"><b><asp:Label ID="Label19" runat="server"></asp:Label></b></div>
            </div><br />
            <div class="row">
                <div class="col-md-3"><asp:Chart ID="Chart1" runat="server" Height="125px" Width="175px" Palette="Pastel">
      <Series>
          <asp:Series ChartType="Doughnut" Name="Series1" Legend="Legend1" LabelForeColor="Transparent">
          </asp:Series>
      </Series>
      <ChartAreas>
          <asp:ChartArea Name="ChartArea1">
          </asp:ChartArea>
      </ChartAreas>
      <Legends>
          <asp:Legend Name="Legend1">
          </asp:Legend>
      </Legends>
      </asp:Chart></div>
                <div class="col-md-3"><asp:Chart ID="Chart2" runat="server" Height="125px" Width="175px" Palette="Pastel">
      <Series>
          <asp:Series ChartType="Doughnut" Name="Series1" Legend="Legend1" LabelForeColor="Transparent">
          </asp:Series>
      </Series>
      <ChartAreas>
          <asp:ChartArea Name="ChartArea1">
          </asp:ChartArea>
      </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
      </asp:Chart></div>
                <div class="col-md-3"><asp:Chart ID="Chart3" runat="server" Height="125px" Width="175px" Palette="Pastel">
      <Series>
          <asp:Series ChartType="Doughnut" Name="Series1" Legend="Legend1" LabelForeColor="Transparent">
          </asp:Series>
      </Series>
      <ChartAreas>
          <asp:ChartArea Name="ChartArea1">
          </asp:ChartArea>
      </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
      </asp:Chart></div>
                <div class="col-md-3"><asp:Chart ID="Chart4" runat="server" Height="125px" Width="175px" Palette="Pastel">
      <Series>
          <asp:Series ChartType="Doughnut" Name="Series1" Legend="Legend1" LabelForeColor="Transparent">
          </asp:Series>
      </Series>
      <ChartAreas>
          <asp:ChartArea Name="ChartArea1">
          </asp:ChartArea>
      </ChartAreas>
                <Legends>
                    <asp:Legend Name="Legend1">
                    </asp:Legend>
                </Legends>
      </asp:Chart></div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2"><b>Buscar por Raza :</b></div>
                <div class="col-md-2"><asp:DropDownList ID="DropDownList1" CssClass="btn btn-dark" runat="server" DataSourceID="DSRazas" DataTextField="nombreRaza" DataValueField="codigoRaza" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList></div>
                <div class="col-md-2"><asp:Button ID="Button3" CssClass="btn btn-dark" runat="server" Text="Ver Todas las Mascotas" OnClick="Button3_Click" /></div>
                <div class="col-md-6"><asp:Label ID="Label21" runat="server"></asp:Label></div>
            </div><br />
            <div class="row">
                <div class="col-md-6">
                    <div class="row">
                <div class="col-md-3"><b>Masc. filtradas:</b></div>
                <div class="col-md-1"><asp:Label ID="Label9" runat="server"></asp:Label></div>
            </div>
                    <div class="row">
                <div class="col-md-3"><b>Son Alergicas:</b></div>
                <div class="col-md-1"><asp:Label ID="Label10" runat="server"></asp:Label></div>
                <div class="col-md-3"><b>No Alergicas:</b></div>
                <div class="col-md-1"><asp:Label ID="Label20" runat="server"></asp:Label></div>
            </div>
                <div class="row">
                <div class="col-md-3"><b>Manto Medular:</b></div>
                <div class="col-md-1"><asp:Label ID="Label11" runat="server"></asp:Label></div>
                <div class="col-md-3"><b>Cortical:</b></div>
                <div class="col-md-1"><asp:Label ID="Label12" runat="server"></asp:Label></div>
                <div class="col-md-2"><b>Pelo Duro:</b></div>
                <div class="col-md-1"><asp:Label ID="Label13" runat="server"></asp:Label></div>
            </div>
                <div class="row">
                <div class="col-md-3"><b>Machos:</b></div>
                <div class="col-md-1"><asp:Label ID="Label14" runat="server"></asp:Label></div>
                <div class="col-md-3"><b>Hembras:</b></div>
                <div class="col-md-1"><asp:Label ID="Label15" runat="server"></asp:Label></div>
            </div>
                <div class="row">
                <div class="col-md-3"><b>Castrados:</b></div>
                <div class="col-md-1"><asp:Label ID="Label16" runat="server"></asp:Label></div>
                <div class="col-md-3"><b>No Castrados:</b></div>
                <div class="col-md-1"><asp:Label ID="Label17" runat="server"></asp:Label></div>
            </div>
                </div>
                <div class="col-md-6">
                    <div class="row">
                        <div class="col-md-6"><asp:Chart ID="Chart5" runat="server" Height="125px" Width="175px" Palette="Pastel">
              <Series>
                  <asp:Series ChartType="Doughnut" Name="Series1" LabelForeColor="Transparent" Legend="Legend1">
                  </asp:Series>
              </Series>
              <ChartAreas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </ChartAreas>
              <Legends>
                  <asp:Legend Name="Legend1">
                  </asp:Legend>
              </Legends>
          </asp:Chart></div>
                        <div class="col-md-6">          
          <asp:Chart ID="Chart6" runat="server" Height="125px" Width="175px" Palette="Pastel">
              <Series>
                  <asp:Series ChartType="Doughnut" Name="Series1" LabelForeColor="Transparent" Legend="Legend1">
                  </asp:Series>
              </Series>
              <ChartAreas>
                  <asp:ChartArea Name="ChartArea1">
                  </asp:ChartArea>
              </ChartAreas>
              <Legends>
                  <asp:Legend Name="Legend1">
                  </asp:Legend>
              </Legends>
          </asp:Chart>
        </div>
                    </div>
                </div>
            </div>
        <br />
        <asp:GridView ID="GridView1" Class="table table-striped" runat="server" AutoGenerateColumns="False" DataSourceID="DSMascotas">
            <Columns>
                <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="Nombre" />
                <asp:BoundField DataField="Raza" HeaderText="Raza" SortExpression="Raza" />
                <asp:BoundField DataField="Edad" HeaderText="Edad" SortExpression="Edad" />
                <asp:BoundField DataField="Tamaño" HeaderText="Tamaño" SortExpression="Tamaño" />
                <asp:BoundField DataField="Alergico" HeaderText="Alergico" SortExpression="Alergico" />
                <asp:BoundField DataField="Manto" HeaderText="Manto" SortExpression="Manto" />
            </Columns>
        </asp:GridView>
        </div> 
       </div>
    </div>
        
        <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT ma.nombreMascota AS Nombre, ra.nombreRaza AS Raza, ma.edadMascota AS Edad, ta.nombreTamaño AS Tamaño, ma.alergia AS Alergico, pe.nombreManto AS Manto FROM mascotas AS ma INNER JOIN razas AS ra ON ma.codigoRaza = ra.codigoRaza INNER JOIN tamaños AS ta ON ma.codigoTamaño = ta.codigoTamaño INNER JOIN mantos AS pe ON ma.codigoManto = pe.codigoManto WHERE (@CodigoRaza = 1) OR (ma.codigoRaza = @CodigoRaza)">
            <SelectParameters>
                <asp:Parameter Name="CodigoRaza" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        <asp:SqlDataSource ID="DSRazas" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT codigoRaza, nombreRaza FROM razas ORDER BY nombreRaza"></asp:SqlDataSource>
        <asp:SqlDataSource ID="DSTotalAlergSexoManto" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TotalMascotas, SUM(CASE WHEN ma.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadMachos, SUM(CASE WHEN ma.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadHembras, SUM(CASE WHEN ma.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN ma.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos, SUM(CASE WHEN ma.codigoManto = 2 THEN 1 ELSE 0 END) AS Medular, SUM(CASE WHEN ma.codigoManto = 3 THEN 1 ELSE 0 END) AS Cortical, SUM(CASE WHEN ma.codigoManto = 11 THEN 1 ELSE 0 END) AS PeloDuro, SUM(CASE WHEN ma.castrado = 'Es Castrado' THEN 1 ELSE 0 END) AS CantidadCastrados, SUM(CASE WHEN ma.castrado = 'No Castrado' THEN 1 ELSE 0 END) AS CantidadNoCastrados FROM mascotas AS ma INNER JOIN mantos AS m ON ma.codigoManto = m.codigoManto"></asp:SqlDataSource>
        
        <asp:SqlDataSource ID="DSCantidadMascotas" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS totalMascotas FROM mascotas AS ma INNER JOIN razas AS ra ON ma.codigoRaza = ra.codigoRaza INNER JOIN tamaños AS ta ON ma.codigoTamaño = ta.codigoTamaño INNER JOIN mantos AS pe ON ma.codigoManto = pe.codigoManto WHERE (@CodigoRaza = 1) OR (ma.codigoRaza = @CodigoRaza)">
            <SelectParameters>
                <asp:Parameter Name="CodigoRaza" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSFiltradoPorRaza" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>" SelectCommand="SELECT COUNT(*) AS TotalMascotas, SUM(CASE WHEN ma.sexo = 'Macho' THEN 1 ELSE 0 END) AS CantidadMachos, SUM(CASE WHEN ma.sexo = 'Hembra' THEN 1 ELSE 0 END) AS CantidadHembras, SUM(CASE WHEN ma.alergia = 'Es Alergico' THEN 1 ELSE 0 END) AS CantidadAlergicos, SUM(CASE WHEN ma.alergia = 'No es Alergico' THEN 1 ELSE 0 END) AS CantidadNoAlergicos, SUM(CASE WHEN ma.codigoManto = 2 THEN 1 ELSE 0 END) AS Medular, SUM(CASE WHEN ma.codigoManto = 3 THEN 1 ELSE 0 END) AS Cortical, SUM(CASE WHEN ma.codigoManto = 11 THEN 1 ELSE 0 END) AS PeloDuro, SUM(CASE WHEN ma.castrado = 'Es Castrado' THEN 1 ELSE 0 END) AS CantidadCastrados, SUM(CASE WHEN ma.castrado = 'No Castrado' THEN 1 ELSE 0 END) AS CantidadNoCastrados FROM mascotas AS ma INNER JOIN mantos AS m ON ma.codigoManto = m.codigoManto WHERE (@CodigoRaza = 1) OR (ma.codigoRaza = @CodigoRaza)">
            <SelectParameters>
                <asp:Parameter Name="CodigoRaza" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
