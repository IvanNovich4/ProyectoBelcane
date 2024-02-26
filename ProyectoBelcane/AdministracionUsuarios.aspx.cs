using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Label1.Text = $"Bienvenido : {Session["usuario"]}";

            DSUsuarios.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSUsuarios.Select(DataSourceSelectArguments.Empty);
            Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre</th><th>Mail</th><th>Permisos</th><th>Modificar</th><th>Eliminar</th>";
            while (registros.Read())
            {
               Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["mail"]}</td><td>{registros["permisos"]}</td><td><a class=\"Modificar Usuario\" href=\"ModificarUsuario.aspx?nombre={registros["nombre"]}\">Modificar</a></td><td><a class=\"Eliminar Usuario\" href=\"EliminarUsuario.aspx?codigo={registros["codigo"]}\">Borrar</a></td>";
                    
            }
            Label2.Text += "</table>";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
               
        /*protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("AltaUsuario.aspx");
        }*/

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AltaUsuario.aspx");
        }
    }
}