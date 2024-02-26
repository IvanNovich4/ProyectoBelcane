using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class RegistrarMascotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList2.SelectedValue = "1";
                DropDownList3.SelectedValue = "1";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (TextBox4.Text != "")
            {
                DSClientes.SelectParameters["dni"].DefaultValue = TextBox4.Text;
                DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00B300");
                    Label2.Text = "Puede proceder a registrar la mascota de " + registro["nombre"].ToString();
                }
                else
                {
                    Label2.Text = "El DNI ingresado no pertenece a ningun cliente registrado";
                }
            }
            else
            {
                Label2.Text = "Debe ingresar el DNI del dueño de la mascota que desea registrar"; 
            }
        }

        protected void Button2_Click(object sender, EventArgs e)//--> Insert Registrar Mascota
        {
            Label2.Text = "";
            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (TextBox4.Text != "")
            {
                DSClientes.SelectParameters["dni"].DefaultValue = TextBox4.Text;
                DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    string valorTextBox1 = TextBox1.Text.Trim();

                    if (string.IsNullOrEmpty(valorTextBox1))
                    {
                        Label1.Text = "Debe completar el nombre de la mascota.";
                        return;
                    }
                    string valorTextBox2 = TextBox2.Text.Trim();

                    if (string.IsNullOrEmpty(valorTextBox2))
                    {
                        Label1.Text = "Debe ingresarla edad de la mascota.";
                        return;
                    }
                    if (TextBox1.Text == "")//DropDownList3.SelectedValue == "1"|| RadioButton7.Checked == false&&RadioButton8.Checked == false|| RadioButton9.Checked == false && RadioButton10.Checked == false)
                    {
                        Label1.Text = "Debe completar el nombre de la mascota";
                        return;
                    }
                    if (TextBox2.Text == "")
                    {
                        Label1.Text = "Debe ingresar la edad de la mascota";
                        return;
                    }
                    if (RadioButton5.Checked == false && RadioButton6.Checked == false)
                    {
                        Label1.Text = "Debe indicar el sexo de la mascota.";
                        return;
                    }
                    if (DropDownList1.SelectedValue == "1")
                    {
                        Label1.Text = "Debe seleccionar el tamaño de la mascota";
                        return;
                    }
                    if (DropDownList2.SelectedValue == "1")
                    {
                        Label1.Text = "Debe seleccionar el tipo de manto de la mascota";
                        return;
                    }
                    if (DropDownList3.SelectedValue == "1")
                    {
                        Label1.Text = "Debe seleccionar una raza para la mascota";
                        return;
                    }
                    if (TextBox5.Text == "" && !CheckBox1.Checked)
                    {
                        Label1.Text = "Debe asignar un color a la mascota.";
                        return;
                    }
                    if (DropDownList3.SelectedValue == "41" && CheckBox1.Checked)
                    {
                        Label1.Text = "Las mascotas Mestizas no tienen color propio de raza , debe especificar el color.";
                        return;
                    }
                    if (RadioButton7.Checked == false && RadioButton8.Checked == false)
                    {
                        Label1.Text = "Debe indicar si la mascota es castrada.";
                        return;
                    }
                    if (RadioButton9.Checked == false && RadioButton10.Checked == false)
                    {
                        Label1.Text = "Debe indicar si la mascota es alergica.";
                        return;
                    }
                    

                    String sexo = "";
                    String castrado = "";
                    String alergia = "";
                    String pigmento = "";
                    String comportamientoInicial = "A evaluar";
                    DSMascotas.InsertParameters["nombreMascota"].DefaultValue = TextBox1.Text;
                    DSMascotas.InsertParameters["edadMascota"].DefaultValue = TextBox2.Text;
                    DSMascotas.InsertParameters["codigoTamaño"].DefaultValue = DropDownList1.SelectedValue;
                    DSMascotas.InsertParameters["codigoManto"].DefaultValue = DropDownList2.SelectedValue;
                    DSMascotas.InsertParameters["codigoRaza"].DefaultValue = DropDownList3.SelectedValue;
                    if (RadioButton5.Checked) { sexo = "Hembra"; }
                    if (RadioButton6.Checked) { sexo = "Macho"; }
                    DSMascotas.InsertParameters["sexo"].DefaultValue = sexo.ToString();
                    if (RadioButton7.Checked) { castrado = "Es Castrado"; }
                    if (RadioButton8.Checked) { castrado = "No Castrado"; }
                    DSMascotas.InsertParameters["castrado"].DefaultValue = castrado.ToString();
                    if (RadioButton9.Checked) { alergia = "Es Alergico"; }
                    if (RadioButton10.Checked) { alergia = "No es Alergico"; }
                    DSMascotas.InsertParameters["alergia"].DefaultValue = alergia.ToString();
                    DSMascotas.InsertParameters["comportamiento"].DefaultValue = comportamientoInicial;
                    DSMascotas.InsertParameters["comentarios"].DefaultValue = TextBox3.Text;
                    DSMascotas.InsertParameters["codigoDueño"].DefaultValue = TextBox4.Text;
                    if (TextBox5.Text != "" && CheckBox1.Checked)
                    {
                        Label1.Text = "No puede cargar ambas opciones. (Propio de la raza es cuando la raza posee solo un color.) ";
                        return;
                    }
                    else
                    {
                        if (TextBox5.Text == "" && CheckBox1.Checked)
                            pigmento = "Propio de la raza.";
                        else
                            pigmento = TextBox5.Text;
                    }
                    DSMascotas.InsertParameters["color"].DefaultValue = pigmento.ToString();
                    DSMascotas.Insert();
                    Label1.ForeColor = Color.Black;
                    Label1.Text = "Se registró la mascota " + TextBox1.Text + " correctamente. ";
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox3.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    Label2.Text = "";
                    DropDownList1.SelectedValue = "1";
                    DropDownList2.SelectedValue = "1";
                    DropDownList3.SelectedValue = "1";
                    RadioButton5.Checked = false;
                    RadioButton6.Checked = false;
                    RadioButton7.Checked = false;
                    RadioButton8.Checked = false;
                    RadioButton9.Checked = false;
                    RadioButton10.Checked = false;
                    CheckBox1.Checked = false;
                    sexo = "";
                    castrado = "";
                    alergia = "";
                    comportamientoInicial = "";
                }
                else
                {
                    Label1.Text = "No se puede registrar la mascota " + TextBox1.Text + " sin su dueño registrado. Por favor verifique dueño. ";
                }
            }
            else 
            {
                Label2.Text = "";
                Label1.Text = "Ingrese DNI del dueño para registrar la mascota. "; 
            }
        }
    }
}