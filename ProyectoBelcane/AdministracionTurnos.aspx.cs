using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarClave.aspx");
            /* DSUsuario.SelectParameters["nombre"].DefaultValue = $"{ Session["usuario"]}";                  
             DSUsuario.DataSourceMode = SqlDataSourceMode.DataReader;
             SqlDataReader registro = (SqlDataReader)DSUsuario.Select(DataSourceSelectArguments.Empty);
             if(registro.Read())
                 Response.Redirect("ModificarClave.aspx");    */
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionClientes.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarMascotas.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultaMascota.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("MascotasPorCliente.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuscarCliente.aspx");
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionCalendario.aspx");
        }
    }
}