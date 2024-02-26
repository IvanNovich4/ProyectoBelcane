using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class BuscarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
            Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> DNI </th><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Correo </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Ver Cliente </th><th scope='col'>Modificar </th>";
            while (registros.Read())
            {
                Label1.Text += $"<tr><td>{registros["dni"]}</td><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["correo"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td><a class=\"ver cliente\" href=\"InformacionCliente.aspx?codCli={registros["dni"]}\">Ver</a></td><td><a class=\"modificar cliente\" href=\"BuscarModificarCliente.aspx?codCli={registros["dni"]}\">Modificar</a></td>";

            }
            Label1.Text += "</table>";
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
                DSClientesDni.SelectParameters["dni"].DefaultValue = TextBox1.Text;
                DSClientesDni.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSClientesDni.Select(DataSourceSelectArguments.Empty);
                Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> DNI </th><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Correo </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Ver Cliente </th><th scope='col'>Modificar </th>";
                if (registros.Read())
                {
                    Label1.Text += $"<tr><td>{registros["dni"]}</td><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["correo"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td><a class=\"ver cliente\" href=\"InformacionCliente.aspx?codCli={registros["dni"]}\">Ver</a></td><td><a class=\"modificar cliente\" href=\"BuscarModificarCliente.aspx?codCli={registros["dni"]}\">Modificar</a></td>";
                    Label1.Text += "</table>";
                }
                else
                {
                    Label2.Text = "No existe un cliente registrado con dicho DNI.";
                    return;
                }
                

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            Label3.Text = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
            Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> DNI </th><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Correo </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Ver Cliente </th><th scope='col'>Modificar </th>";
            while (registros.Read())
            {
                Label1.Text += $"<tr><td>{registros["dni"]}</td><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["correo"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td><a class=\"ver cliente\" href=\"InformacionCliente.aspx?codCli={registros["dni"]}\">Ver</a></td><td><a class=\"modificar cliente\" href=\"BuscarModificarCliente.aspx?codCli={registros["dni"]}\">Modificar</a></td>";

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
                Label3.Text = "Debe ingresar el Nombre del cliente a buscar.";
                return;
            }
            else
            {
                DSClientesNom.SelectParameters["nombre"].DefaultValue = TextBox2.Text;
                DSClientesNom.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSClientesNom.Select(DataSourceSelectArguments.Empty);
                Label1.Text = "<table class=\"table table-hover table-striped\"><tr><th scope='col'> DNI </th><th scope='col'> Nombre </th><th scope='col'> Apellido </th><th scope='col'> Teléfono </th><th scope='col'> Correo </th><th scope='col'> Dirección </th><th scope='col'> Barrio </th><th scope='col'> Ver Cliente </th><th scope='col'>Modificar </th>";
                while (registros.Read())
                {
                    Label1.Text += $"<tr><td>{registros["dni"]}</td><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["telefono"]}</td><td>{registros["correo"]}</td><td>{registros["direccion"]}</td><td>{registros["nombreBarrio"]}</td><td><a class=\"ver cliente\" href=\"InformacionCliente.aspx?codCli={registros["dni"]}\">Ver</a></td><td><a class=\"modificar cliente\" href=\"BuscarModificarCliente.aspx?codCli={registros["dni"]}\">Modificar</a></td>";

                }
                Label1.Text += "</table>";

            }
        }
    }
}