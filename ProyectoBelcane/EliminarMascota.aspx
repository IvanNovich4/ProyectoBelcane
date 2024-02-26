<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarMascota.aspx.cs" Inherits="ProyectoBelcane.EliminarMascota" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:SqlDataSource ID="DSMascotas" runat="server" ConnectionString="Data Source=ivanoski;Min Pool Size=0;Max Pool Size=10024;Pooling=true;Initial Catalog=bd1;Integrated Security=SSPI" DeleteCommand="DELETE FROM mascotas WHERE (idMascota = @idMascota)" ProviderName="System.Data.SqlClient">
            <DeleteParameters>
                <asp:Parameter Name="idMascota" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
