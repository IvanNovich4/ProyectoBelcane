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
    public partial class VerCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionInsumos.aspx");//asd comentario
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            Label5.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;

            Label3.Text = "Detalles de la compra N° "+ Label1.Text + " . ";
            Label4.Text = "Total de la compra : " + Label5.Text + " . ";

            DSDetalle.SelectParameters["idDetalle"].DefaultValue = Label1.Text;
            DSDetalle.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro1 = (SqlDataReader)DSDetalle.Select(DataSourceSelectArguments.Empty);
            registro1.Read();

        }

     
    }
}