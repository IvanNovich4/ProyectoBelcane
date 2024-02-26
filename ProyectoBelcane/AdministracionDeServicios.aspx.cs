using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionDeServicios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            Label1.Text = "";
            string valorTextBox1 = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox1))
            {
                Label1.Text = "Debe ingresar el servicio que desea registrar.";
                return;
            }
            if (TextBox1.Text == "")
            {
                Label1.Text = "Debe ingresar el servicio que desea registrar. ";
                return;
            }
            else
            {
                DSExisteServicio.SelectParameters["nombreServicio"].DefaultValue = TextBox1.Text;
                DSExisteServicio.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro2 = (SqlDataReader)DSExisteServicio.Select(DataSourceSelectArguments.Empty);
                if (registro2.Read())
                {
                    TextBox1.Text = "";
                    Label1.Text = "El servicio ya se encuentra registrado";
                    return;
                }
                else
                {
                    DSServicios.InsertParameters["nombreServicio"].DefaultValue = TextBox1.Text;
                    DSServicios.Insert();
                    Label1.ForeColor = Color.Black;
                    Label1.Text = "El servicio fué registrado exitosamente.";
                    TextBox1.Text = "";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionInsumos.aspx");
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TextBox1.Text = "";
            Label1.Text = "";
        }
    }
}