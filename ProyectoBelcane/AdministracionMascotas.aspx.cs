using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionMascotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string valorTextBox1 = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox1))
            {
                Label1.Text = "Debe ingresar una raza";
                Label2.Text = "";
                Label3.Text = "";
                return;
            }
            if (TextBox1.Text.Length == 0)
            {
                Label1.Text = "Debe ingresar una raza";
                Label2.Text = "";
                Label3.Text = "";
            }
            else
            {
                DSRazas2.SelectParameters["nombreRaza"].DefaultValue = TextBox1.Text;
                DSRazas2.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSRazas2.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label1.Text = "La raza " + TextBox1.Text + " ya se encuentra registrada".ToString();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label2.Text = "";
                    Label3.Text = "";
                }
                else
                {
                    DSRazas.InsertParameters["nombreRaza"].DefaultValue = TextBox1.Text;
                    DSRazas.Insert();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label1.Text = "La raza se registró correctamente";
                    Label2.Text = "";
                    Label3.Text = "";
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string valorTextBox3 = TextBox3.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox3))
            {
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "Debe ingresar un manto";
                return;
            }
            if (TextBox3.Text.Length == 0)
            {
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "Debe ingresar un manto";
            }
            else
            {
                DSMantos2.SelectParameters["nombreManto"].DefaultValue = TextBox3.Text;
                DSMantos2.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSMantos2.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label3.Text = "El manto " + TextBox3.Text + " ya se encuentra registrado".ToString();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label1.Text = "";
                    Label2.Text = "";
                }
                else
                {
                    DSMantos.InsertParameters["nombreManto"].DefaultValue = TextBox3.Text;
                    DSMantos.Insert();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label1.Text = "";
                    Label2.Text = "";
                    Label3.Text = "Se registró correctamente el tipo de manto";
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string valorTextBox2 = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox2))
            {
                Label1.Text = "";
                Label2.Text = "Debe ingresar un tamaño de mascota";
                Label3.Text = "";
                return;
            }
            if (TextBox2.Text.Length == 0)
            {
                Label1.Text = "";
                Label2.Text = "Debe ingresar un tamaño de mascota";
                Label3.Text = "";
            }
            else
            {
                DSTamaños2.SelectParameters["nombreTamaño"].DefaultValue = TextBox2.Text;
                DSTamaños2.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSTamaños2.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label2.Text = "El tamaño " + TextBox2.Text + " ya se encuentra registrado".ToString();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label1.Text = "";
                    Label3.Text = "";
                }
                else
                {
                    DSTamaños.InsertParameters["nombreTamaño"].DefaultValue = TextBox2.Text;
                    DSTamaños.Insert();
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    Label1.Text = "";
                    Label2.Text = "El tamaño se registró correctamente ";
                    Label3.Text = "";
                }
                
            }
        }

    }
}