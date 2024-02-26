using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")
                Label1.Text = "Debe completar todos los campos ";
            else
            {
                DSUsuarios.SelectParameters["nombre"].DefaultValue = TextBox1.Text;
                DSUsuarios.SelectParameters["clave"].DefaultValue = TextBox2.Text;
                DSUsuarios.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSUsuarios.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    if (registro["permisos"].ToString() == "administrador")
                    {
                        Session["usuario"] = TextBox1.Text;//Tomo los datos del TxtBx1 y los guardo en "usuario" de la variable Session
                        Response.Redirect("AdministracionUsuarios.aspx");
                    }
                    if (registro["permisos"].ToString() == "turnos")
                    {
                        Session["usuario"] = TextBox1.Text;
                        Response.Redirect("AdministracionTurnos.aspx");
                    }
                    if (registro["permisos"].ToString() == "insumos")
                    {
                        Session["usuario"] = TextBox1.Text;
                        Response.Redirect("AdministracionInsumos.aspx");
                    }
                    if (registro["permisos"].ToString() == "general")
                    {
                        Session["usuario"] = TextBox1.Text;
                        Response.Redirect("AdministracionGeneral.aspx");
                    }

                }
                else
                    Label1.Text = "Nombre de usuario o clave incorrecta";

            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}