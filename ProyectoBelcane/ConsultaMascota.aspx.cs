using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ConsultaMascota : System.Web.UI.Page
    {
        //String busqueda = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = "1";
                DSMascotas1.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSMascotas1.Select(DataSourceSelectArguments.Empty);
                Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre Dueño</th><th>Apellido</th><th>Nombre de Mascota</th><th>Raza</th><th>Color</th><th>Manto</th><th>Tamaño</th><th> Ver Mascota </th><th>Eliminar Mascota</th>";
                while (registros.Read())
                {
                    Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["color"]}</td><td>{registros["nombreManto"]}</td><td>{registros["nombreTamaño"]}</td><td><a class=\"Datos Mascota\" href=\"ConsultaDatosMascota.aspx?codMasc={registros["idMascota"]}\"> Ver / Editar </a></td><td><a class=\"Eliminar Mascota\" href=\"EliminarMascota.aspx?codMasc={registros["idMascota"]}\">Eliminar</a></td>";

                }
                Label2.Text += "</table>";
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedValue == "1")
            {
                string valorTextBox1 = TextBox1.Text.Trim();

                if (string.IsNullOrEmpty(valorTextBox1))
                {
                    Label1.Text = "Debe completar el nombre de la mascota y/o seleccionar la raza de la mascota.";
                    return;
                }
                else // opcion 1 -- > si solamente se carga el nombre de la mascota y no se indica raza
                {
                    Label1.Text = "";
                    DSMascotas.SelectParameters["nombreMascota"].DefaultValue = TextBox1.Text;
                    DSMascotas.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registros = (SqlDataReader)DSMascotas.Select(DataSourceSelectArguments.Empty);
                    Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre Dueño</th><th>Apellido</th><th>Nombre de Mascota</th><th>Raza</th><th>Color</th><th>Manto</th><th>Tamaño</th><th> Ver Mascota </th><th>Eliminar Mascota</th>";
                    while (registros.Read())
                    {
                        Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["color"]}</td><td>{registros["nombreManto"]}</td><td>{registros["nombreTamaño"]}</td><td><a class=\"Datos Mascota\" href=\"ConsultaDatosMascota.aspx?codMasc={registros["idMascota"]}\"> Ver / Editar </a></td><td><a class=\"Eliminar Mascota\" href=\"EliminarMascota.aspx?codMasc={registros["idMascota"]}\">Eliminar</a></td>";

                    }
                    Label2.Text += "</table>";
                }
            }
            else
            {
                if (TextBox1.Text != "") // opcion 2 si se selecciona una raza y se escribe un nombre
                {
                    Label1.Text = "";
                    DSMascNomRaz.SelectParameters["nombreMascota"].DefaultValue = TextBox1.Text;
                    DSMascNomRaz.SelectParameters["codigoRaza"].DefaultValue = DropDownList1.SelectedValue;
                    DSMascNomRaz.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registros = (SqlDataReader)DSMascNomRaz.Select(DataSourceSelectArguments.Empty);
                    Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre Dueño</th><th>Apellido</th><th>Nombre de Mascota</th><th>Raza</th><th>Color</th><th>Manto</th><th>Tamaño</th><th> Ver Mascota </th><th>Eliminar Mascota</th>";
                    while (registros.Read())
                    {
                        Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["color"]}</td><td>{registros["nombreManto"]}</td><td>{registros["nombreTamaño"]}</td><td><a class=\"Datos Mascota\" href=\"ConsultaDatosMascota.aspx?codMasc={registros["idMascota"]}\"> Ver / Editar </a></td><td><a class=\"Eliminar Mascota\" href=\"EliminarMascota.aspx?codMasc={registros["idMascota"]}\">Eliminar</a></td>";

                    }
                    Label2.Text += "</table>";
                }
                else // opcion 3 si se selecciona raza pero no un nombre 
                {
                    Label1.Text = "";
                    DSMascotasPorRaza.DataSourceMode = SqlDataSourceMode.DataReader;
                    DSMascotasPorRaza.SelectParameters["codigoRaza"].DefaultValue = DropDownList1.SelectedValue;
                    SqlDataReader registros = (SqlDataReader)DSMascotasPorRaza.Select(DataSourceSelectArguments.Empty);
                    Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre Dueño</th><th>Apellido</th><th>Nombre de Mascota</th><th>Raza</th><th>Color</th><th>Manto</th><th>Tamaño</th><th> Ver Mascota </th><th>Eliminar Mascota</th>";
                    while (registros.Read())
                    {
                        Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["color"]}</td><td>{registros["nombreManto"]}</td><td>{registros["nombreTamaño"]}</td><td><a class=\"Datos Mascota\" href=\"ConsultaDatosMascota.aspx?codMasc={registros["idMascota"]}\"> Ver / Editar </a></td><td><a class=\"Eliminar Mascota\" href=\"EliminarMascota.aspx?codMasc={registros["idMascota"]}\">Eliminar</a></td>";

                    }
                    Label2.Text += "</table>";
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "1";
            Label1.Text = "";
            TextBox1.Text = "";
            DSMascotas1.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSMascotas1.Select(DataSourceSelectArguments.Empty);
            Label2.Text = "<table class=\"table table-striped\"><tr><th>Nombre Dueño</th><th>Apellido</th><th>Nombre de Mascota</th><th>Raza</th><th>Color</th><th>Manto</th><th>Tamaño</th><th> Ver Mascota </th><th>Eliminar Mascota</th>";
            while (registros.Read())
            {
                Label2.Text += $"<tr><td>{registros["nombre"]}</td><td>{registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["color"]}</td><td>{registros["nombreManto"]}</td><td>{registros["nombreTamaño"]}</td><td><a class=\"Datos Mascota\" href=\"ConsultaDatosMascota.aspx?codMasc={registros["idMascota"]}\"> Ver / Editar </a></td><td><a class=\"Eliminar Mascota\" href=\"EliminarMascota.aspx?codMasc={registros["idMascota"]}\">Eliminar</a></td>";

            }
            Label2.Text += "</table>";
        }


        protected void Button4_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "1";
        }
    }
}