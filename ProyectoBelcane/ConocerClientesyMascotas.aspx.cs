using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ConocerClientesyMascotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DSTotCli.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSTotCli.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
                {
                    Label1.Text = registros["totalClientes"].ToString();
                    Label2.Text = registros["cantidad_mascotas"].ToString();
                }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label3.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[0].Text;
            Label4.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            Label5.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[2].Text;

            Label11.Text = "DNI : " + Label3.Text + " . ";
            Label8.Text = "Información del cliente : " + Label4.Text + " " + Label5.Text + " . ";
            /*DSCodigo.SelectParameters["idCompra"].DefaultValue = Label1.Text;
            DSCodigo.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSCodigo.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                Label2.Text = registro["codigoDetalle"].ToString();
            }*/

            DSDetCliente.SelectParameters["dni"].DefaultValue = Label3.Text;
            DSDetCliente.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro1 = (SqlDataReader)DSDetCliente.Select(DataSourceSelectArguments.Empty);
            registro1.Read();
        }
    }
}