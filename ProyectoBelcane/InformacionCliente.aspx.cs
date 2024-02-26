using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class InformacionCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigocliente = Request.QueryString["codCli"];

                DSCliente.SelectParameters["dni"].DefaultValue = codigocliente;
                DSCliente.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSCliente.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label1.Text = registro["nombre"].ToString()+" "+ registro["apellido"].ToString();
                    Label2.Text = registro["telefono"].ToString();
                    Label3.Text = registro["correo"].ToString();
                    Label4.Text = registro["direccion"].ToString();
                    Label5.Text = registro["dni"].ToString();
                    Label6.Text = registro["nombreBarrio"].ToString();
                    Label7.Text = registro["nombreLocalidad"].ToString();
                    Label8.Text = registro["nombreProvincia"].ToString();                    
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuscarCliente.aspx");
        }
    }
}