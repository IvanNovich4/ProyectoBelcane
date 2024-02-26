using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ConsultaDatosMascota : System.Web.UI.Page
    {
        
        private void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigomascota = Request.QueryString["codMasc"];

                DSMascota.SelectParameters["idMascota"].DefaultValue = codigomascota;
                DSMascota.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSMascota.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label1.Text = registro["nombreMascota"].ToString();
                    Label2.Text = registro["edadMascota"].ToString();
                    Label3.Text = registro["sexo"].ToString();
                    Label4.Text = registro["nombreTamaño"].ToString();
                    Label5.Text = registro["nombreManto"].ToString();
                    Label6.Text = registro["nombreRaza"].ToString();
                    Label7.Text = registro["color"].ToString();
                    Label8.Text = registro["castrado"].ToString();
                    Label9.Text = registro["alergia"].ToString();
                    Label10.Text = registro["comportamiento"].ToString();
                    Label11.Text = registro["comentarios"].ToString();
                    Label12.Text = registro["nombre"].ToString();
                    Label13.Text = registro["apellido"].ToString();
                    Label14.Text = registro["dni"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultaMascota.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String codigoM = Request.QueryString["codMasc"];            
            Response.Redirect("ModificarMascota.aspx?idMasc="+codigoM);
        }
    }
}