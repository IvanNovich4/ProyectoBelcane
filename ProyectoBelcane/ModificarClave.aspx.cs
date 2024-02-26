using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ModificarClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Label1.Text = $"Bienvenido :  {Session["usuario"]}";*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text.Length == 0 || TextBox2.Text.Length==0 || TextBox3.Text.Length == 0) 
            {
                Label2.Text = "Debe completar todos los campos";
                return;
            }
            else
            {
                DSUsuario.SelectParameters["nombre"].DefaultValue = $"{ Session["usuario"]}";                
                DSUsuario.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSUsuario.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    if (TextBox1.Text == registro["clave"].ToString() )
                    {
                        if(TextBox2.Text == TextBox3.Text)
                        {
                            DSUsuario.UpdateParameters["nombre"].DefaultValue = $"{Session["usuario"]}";
                            DSUsuario.UpdateParameters["clave"].DefaultValue = TextBox2.Text;                            
                            int cant = DSUsuario.Update();
                            if (cant == 1)
                            {
                                TextBox1.Text = "";
                                TextBox2.Text = "";
                                TextBox3.Text = "";
                                Label2.Text = "La clave se modificó correctamente";
                            }                            
                        }
                        else
                        {
                            
                            TextBox3.Text = "";
                            Label2.Text = "Error de confirmacion de nueva clave , deben ser iguales";
                            return;
                        }                        
                    }
                    else
                    {
                        TextBox1.Text = "";
                        Label2.Text = "Clave actual incorrecta";
                        return;
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DSUsuario.SelectParameters["nombre"].DefaultValue = $"{Session["usuario"]}";
            DSUsuario.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSUsuario.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                if (registro["permisos"].ToString() == "turnos")
                    Response.Redirect("AdministracionTurnos.aspx");
                if (registro["permisos"].ToString() == "insumos")
                    Response.Redirect("AdministracionInsumos.aspx");
                if (registro["permisos"].ToString() == "general")
                    Response.Redirect("AdministracionGeneral.aspx");
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DSUsuario.SelectParameters["nombre"].DefaultValue = $"{Session["usuario"]}";
            DSUsuario.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSUsuario.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                if (registro["permisos"].ToString() == "turnos")
                    Response.Redirect("AdministracionTurnos.aspx");
                if (registro["permisos"].ToString() == "insumos")
                    Response.Redirect("AdministracionInsumos.aspx");
                if (registro["permisos"].ToString() == "general")
                    Response.Redirect("AdministracionGeneral.aspx");
            }
        }
    }
}