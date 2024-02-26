using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.WebControls;
using Color = System.Drawing.Color;

namespace ProyectoBelcane
{
    public partial class AdministracionMediosDePago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            Label1.Text = "";
            string valorTextBox1 = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox1))
            {
                Label1.Text = "Debe ingresar el medio de pago.";
                return;
            }
            if (TextBox1.Text.Length == 0)
            {
                Label1.Text = "Debe ingresar el medio de pago.";
                return;
            }  
            else
            {
                DSExisteMedioPago.SelectParameters["descripcionMedioPago"].DefaultValue = TextBox1.Text;
                DSExisteMedioPago.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro2 = (SqlDataReader)DSExisteMedioPago.Select(DataSourceSelectArguments.Empty);
                if (registro2.Read())
                {
                    Label1.Text = "El medio de pago "+TextBox1.Text+" ya se encuentra registrado";
                    TextBox1.Text = "";
                    return;
                }
                else
                {
                    DSPagos.InsertParameters["descripcionMedioPago"].DefaultValue = TextBox1.Text;
                    DSPagos.Insert();
                    Label1.ForeColor = Color.Black;
                    Label1.Text = "El medio de pago fué registrado exitosamente.";
                    TextBox1.Text = "";
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TextBox1.Text = "";
            Label1.Text = "";
        }
    }
}