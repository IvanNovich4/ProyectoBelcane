using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ConocerMascotas : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string codigodueño = Request.QueryString["codDue"];
                DSMascDue.SelectParameters["codigoDueño"].DefaultValue = codigodueño;

                DSDueño.SelectParameters["codigoDueño"].DefaultValue = codigodueño;
                DSDueño.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSDueño.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label14.Text = registro["nombre"].ToString() + " " + registro["apellido"].ToString();
                }
                Label4.Text = "";
                Label5.Text = "";
                Label6.Text = "";
                Label7.Text = "";
                Label8.Text = "";
                Label9.Text = "";
                Label10.Text = "";
                Label11.Text = "";
                Label12.Text = "";
                Label13.Text = "";
                                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MascotasPorCliente.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label2.Text = "Mascota seleccionada : " + GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            DSMascotaSelec.SelectParameters["idMascota"].DefaultValue = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text.ToString();
           
            DSMascotaSelec.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSMascotaSelec.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                Label4.Text = "Edad : " + registros["edadMascota"].ToString();
                Label5.Text = "Sexo : " + registros["sexo"].ToString();
                Label6.Text = "Tamaño : " + registros["nombreTamaño"].ToString();
                Label7.Text = "Manto : " + registros["nombreManto"].ToString();
                Label8.Text = "Raza : " + registros["nombreRaza"].ToString();
                Label9.Text = "Color : " + registros["color"].ToString();
                Label10.Text = "Es Castrado : " + registros["castrado"].ToString();
                Label11.Text = "Presenta Alergia : " + registros["alergia"].ToString();
                Label12.Text = "Comportamiento : " + registros["comportamiento"].ToString();
                Label13.Text = "Otros Datos / Comentarios : " + registros["comentarios"].ToString();
            }

        }
    }
}