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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
                Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Localidad </th><th scope='col'> Provincia </th><th scope='col'> Mascotas </th>";
                while (registros.Read())
                {
                    Label1.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td>{registros["nombreLocalidad"]}</td><td>{registros["nombreProvincia"]}</td><td><a class=\"ver Mascota\" href=\"ConocerMascotas.aspx?codDue={registros["dni"]}\">Ver Mascota/s</a></td>";

                }
                Label1.Text += "</table>";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            Label2.Text = "";
            Label3.Text = "";
            TextBox2.Text = "";
            if (TextBox1.Text == "")
            {
                Label2.Text = "Debe ingresar el DNI del cliente que desea buscar";
                return;
            }
            else
            {
                DSClienteDni.DataSourceMode = SqlDataSourceMode.DataReader;
                DSClienteDni.SelectParameters["dni"].DefaultValue = TextBox1.Text;
                SqlDataReader registros = (SqlDataReader)DSClienteDni.Select(DataSourceSelectArguments.Empty);
                Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Localidad </th><th scope='col'> Provincia </th><th scope='col'> Mascotas </th>";
                if(registros.Read())
                {
                    Label1.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td>{registros["nombreLocalidad"]}</td><td>{registros["nombreProvincia"]}</td><td><a class=\"ver Mascota\" href=\"ConocerMascotas.aspx?codDue={registros["dni"]}\">Ver Mascota/s</a></td>";
                    Label1.Text += "</table>";
                }
                else
                {
                    Label2.Text = "No existe un cliente registado con dicho DNI.";
                    return;
                }
                
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            Label2.Text = "";
            Label3.Text = "";
            DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
            Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Localidad </th><th scope='col'> Provincia </th><th scope='col'> Mascotas </th>";
            while (registros.Read())
            {
                Label1.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td>{registros["nombreLocalidad"]}</td><td>{registros["nombreProvincia"]}</td><td><a class=\"ver Mascota\" href=\"ConocerMascotas.aspx?codDue={registros["dni"]}\">Ver Mascota/s</a></td>";

            }
            Label1.Text += "</table>";
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            Label3.Text = "";
            TextBox1.Text = "";
            string valorTextBox2 = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox2))
            {
                Label3.Text = "Debe ingresar el nombre del clietne a buscar.";
                return;
            }
            else
            {
                DSClienteNom.DataSourceMode = SqlDataSourceMode.DataReader;
                DSClienteNom.SelectParameters["nombre"].DefaultValue = TextBox2.Text;
                SqlDataReader registros = (SqlDataReader)DSClienteNom.Select(DataSourceSelectArguments.Empty);
                Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Localidad </th><th scope='col'> Provincia </th><th scope='col'> Mascotas </th>";
                while (registros.Read())
                {
                    Label1.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td>{registros["nombreLocalidad"]}</td><td>{registros["nombreProvincia"]}</td><td><a class=\"ver Mascota\" href=\"ConocerMascotas.aspx?codDue={registros["dni"]}\">Ver Mascota/s</a></td>";

                }
                Label1.Text += "</table>";

            }
        }
    }
}