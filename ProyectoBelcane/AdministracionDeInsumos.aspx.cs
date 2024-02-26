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
    public partial class AdministracionDeInsumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionInsumos.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            string valorTextBox1 = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox1))
            {
                Label1.Text = "Ingrese el nombre del insumo que desea registrar.";
                return;
            }
            if (TextBox1.Text == "")
            {                
                Label1.Text = "Ingrese el nombre del insumo que desea registrar.";
                return;
            }
            else
            {
                DSExisteInsumo.SelectParameters["nombreInsumo"].DefaultValue = TextBox1.Text;
                DSExisteInsumo.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro2 = (SqlDataReader)DSExisteInsumo.Select(DataSourceSelectArguments.Empty);
                if (registro2.Read())
                {
                    Label1.Text = "El Insumo ya se encuentra registrado";
                    return;
                } 
                if (DropDownList2.SelectedValue == "1")
                {
                    Label1.Text = "Seleccione el rubro del insumo.";
                }
                else
                {
                    DSInsumos.InsertParameters["nombreInsumo"].DefaultValue = TextBox1.Text;
                    DSInsumos.InsertParameters["codigoRubro"].DefaultValue = DropDownList2.SelectedValue;
                    DSInsumos.Insert();
                    Label1.ForeColor = Color.Black;
                    Label1.Text = "El insumo fué registrado exitosamente.";
                    TextBox1.Text = "";
                    DropDownList2.SelectedValue = "1";
                }
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            TextBox1.Text = "";
            Label1.Text = "";
            DropDownList2.SelectedValue = "1";
        }
    }
}