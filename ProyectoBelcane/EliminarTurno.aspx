<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EliminarTurno.aspx.cs" Inherits="ProyectoBelcane.EliminarTurno" %>

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
        <asp:SqlDataSource ID="DSTurno" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" DeleteCommand="DELETE FROM turnos WHERE (codigoDetalleTurno = @codigoDetalleTurno)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="codigoDetalleTurno" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="DSDetalle" runat="server" ConnectionString="<%$ ConnectionStrings:bd1ConnectionString %>" DeleteCommand="DELETE FROM detalleTurno WHERE (idDetalleTurno = @idDetalleTurno)" ProviderName="<%$ ConnectionStrings:bd1ConnectionString.ProviderName %>">
            <DeleteParameters>
                <asp:Parameter Name="idDetalleTurno" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
