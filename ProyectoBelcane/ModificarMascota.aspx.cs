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
    public partial class ModificarMascota : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string codigomascota = Request.QueryString["idMasc"];

                DSMascota.SelectParameters["idMascota"].DefaultValue = codigomascota;
                DSMascota.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSMascota.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    TextBox1.Text = registro["nombreMascota"].ToString();
                    TextBox2.Text = registro["edadMascota"].ToString();
                    Label3.Text = registro["nombre"].ToString();
                    Label4.Text = registro["apellido"].ToString();
                    TextBox5.Text = registro["dni"].ToString();
                    if (registro["sexo"].ToString() == "Hembra")
                    {
                        RadioButton5.Checked = true;
                    }
                    else
                    {
                        RadioButton6.Checked = true;
                    }
                    DropDownList1.SelectedValue = registro["codigoTamaño"].ToString();
                    DropDownList2.SelectedValue = registro["codigoManto"].ToString();
                    DropDownList3.SelectedValue = registro["codigoRaza"].ToString();
                    string pigmento = registro["color"].ToString();
                    if (pigmento == "Propio de la raza.")
                        CheckBox1.Checked = true;
                    else
                        TextBox3.Text = pigmento.ToString();
                    if (registro["castrado"].ToString()=="Es Castrado")
                    {
                        RadioButton1.Checked = true;
                    }
                    else 
                    {
                        RadioButton2.Checked = true;
                    }
                    if (registro["alergia"].ToString() == "Es Alergico")
                    {
                        RadioButton3.Checked = true;
                    }
                    else
                    {
                        RadioButton4.Checked = true;
                    }
                    if (registro["comportamiento"].ToString() == "A evaluar")
                    {
                        DropDownList4.SelectedValue = "A evaluar";
                    }
                    else
                    {
                        if (registro["comportamiento"].ToString() == "Malo")
                        {
                            DropDownList4.SelectedValue = "Malo";
                        }
                        else
                        {
                            if (registro["comportamiento"].ToString() == "Bueno")
                            {
                                DropDownList4.SelectedValue = "Bueno";
                            }
                            else
                            {
                                if (registro["comportamiento"].ToString() == "Muy Bueno")
                                {
                                    DropDownList4.SelectedValue = "Muy Bueno";
                                }
                                else
                                {
                                    DropDownList4.SelectedValue = "Excelente";
                                }

                            }

                        }

                    }
                    TextBox4.Text = registro["comentarios"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String codigoM = Request.QueryString["idMasc"];
            Response.Redirect("ConsultaDatosMascota.aspx?codMasc="+codigoM);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");

            Label5.Text = "";
            if (TextBox5.Text == "")
            {       
                Label2.Text = "Debe ingresar DNI del dueño de la mascota.";
                return;
            }
            string valorTextBox1 = TextBox1.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox1))
            {
                Label2.Text = "Debe completar el nombre de la mascota.";
                return;
            }
            string valorTextBox2 = TextBox2.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox2))
            {
                Label2.Text = "Debe ingresarla edad de la mascota.";
                return;
            }
            if (TextBox1.Text == "")
            {
                Label2.Text = "El campo 'Nombre Mascota' no puede estar vacío";
                return;
            }
            if (TextBox2.Text == "")
            {
                Label2.Text = "El campo 'Edad' no puede estar vacío";
                return;
            }
            if (TextBox3.Text == "" && !CheckBox1.Checked)
            {
                Label2.Text = "Debe asignar un color a la mascota.";
                return;
            }
            if (DropDownList3.SelectedValue=="41" && CheckBox1.Checked)
            {
                Label2.Text = "No se puede seleccionar color ' propio de la raza ' a mascotas Mestizas.";
                return;
            }
            String castrado = "";
            String pigmento = "";
            String alergia = "";
            String comportamiento = "";
            String sexo = "";
            DSMascota.UpdateParameters["idMascota"].DefaultValue = Request.QueryString["idMasc"];
            DSMascota.UpdateParameters["nombreMascota"].DefaultValue = TextBox1.Text;
            DSMascota.UpdateParameters["edadMascota"].DefaultValue = TextBox2.Text;
            if (RadioButton5.Checked) { sexo = "Hembra"; }
            if (RadioButton6.Checked) { sexo = "Macho"; }
            DSMascota.UpdateParameters["sexo"].DefaultValue = sexo.ToString();
            DSMascota.UpdateParameters["codigoTamaño"].DefaultValue = DropDownList1.SelectedValue;
            DSMascota.UpdateParameters["codigoManto"].DefaultValue = DropDownList2.SelectedValue;
            DSMascota.UpdateParameters["codigoRaza"].DefaultValue = DropDownList3.SelectedValue;
            if (TextBox3.Text != "" && CheckBox1.Checked)
            {
                Label2.Text = "No puede cargar ambas opciones. (Propio de la raza es cuando la raza posee solo un color.) ";
                return;
            }
            else
            {
                if (TextBox3.Text == "" && CheckBox1.Checked)
                    pigmento = "Propio de la raza.";
                else
                    pigmento = TextBox3.Text;
            }
            
            DSMascota.UpdateParameters["color"].DefaultValue = pigmento.ToString();
            if (RadioButton1.Checked) { castrado = "Es Castrado"; }
            if (RadioButton2.Checked) { castrado = "No Castrado"; }
            DSMascota.UpdateParameters["castrado"].DefaultValue = castrado.ToString();
            if (RadioButton3.Checked) { alergia = "Es Alergico"; }
            if (RadioButton4.Checked) { alergia = "No es Alergico"; }
            DSMascota.UpdateParameters["alergia"].DefaultValue = alergia.ToString();
            if (DropDownList4.SelectedValue=="A evaluar") { comportamiento = "A evaluar"; }
            if (DropDownList4.SelectedValue == "Malo") { comportamiento = "Malo"; }
            if (DropDownList4.SelectedValue == "Bueno") { comportamiento = "Bueno"; }
            if (DropDownList4.SelectedValue == "Muy Bueno") { comportamiento = "Muy Bueno"; }
            if (DropDownList4.SelectedValue == "Excelente") { comportamiento = "Excelente"; }
            DSMascota.UpdateParameters["comportamiento"].DefaultValue = comportamiento.ToString();
            DSMascota.UpdateParameters["comentarios"].DefaultValue = TextBox4.Text;

            DSDueño.SelectParameters["dni"].DefaultValue = TextBox5.Text;
            DSDueño.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSDueño.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                DSMascota.UpdateParameters["codigoDueño"].DefaultValue = TextBox5.Text;
                int cant = DSMascota.Update();
                if (cant == 1)
                {
                    Label2.ForeColor = Color.Black;
                    Label2.Text = " Los datos de la mascota " + TextBox1.Text + " fueron actualizados satisfactoriamente. ";
                }
            }
            else
            {
                Label2.Text = "Cliente inexistente , para realizar el cambio de dueño el cliente debe estar registrado.";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label5.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (TextBox5.Text != "")
            {
                DSDueño.SelectParameters["dni"].DefaultValue = TextBox5.Text;
                DSDueño.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSDueño.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label2.Text = "";
                    Label5.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00B300");
                    Label5.Text = "Cliente verificado , puede asignar como dueño de la mascota a " + registro["nombre"].ToString() + ".";
                }
                else
                {
                    Label2.Text = "";
                    Label5.Text = "Cliente inexistente , para realizar el cambio de dueño el cliente debe estar registrado.";
                }
            }
            else
            {
                Label2.Text = "";
                Label5.Text = "Debe ingresar el DNI del dueño de la mascota.";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            String codigoM = Request.QueryString["idMasc"];
            Response.Redirect("ConsultaDatosMascota.aspx?codMasc=" + codigoM);
        }
    }
}