using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionClientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = "30";
            }


        }

        public void BuscarLocalidad(object sender, EventArgs e)
        {
            DropDownList3.Items.Clear();
            DSLocalidad.SelectParameters["codigoProvincia"].DefaultValue = DropDownList1.SelectedValue;
            DSLocalidad.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSLocalidad.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())//---> aca se carga el dopdown
            {
                //Label1.Text = "el codigoprovincia es " + DropDownList1.SelectedValue;// si existe 
            }
            else
            {
                //Label1.Text = "el codigoprovincia es " + DropDownList1.SelectedValue;// si no existe localidad de x provincia 
            }
        }

        public void BuscarBarrio(object sender, EventArgs e)
        {
            Label1.Text = "";
            DSBarrio.SelectParameters["codigoLocalidad"].DefaultValue = DropDownList2.SelectedValue;
            DSBarrio.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSBarrio.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                //Label2.Text = "el codigolocalidad es " + DropDownList2.SelectedValue;
            }
            else
            {
                //Label2.Text = "el codigolocalidad es " + DropDownList2.SelectedValue;

            }

        }

        public void BorrarLabelBarrio(object sender, EventArgs e)
        {
            Label2.Text = "";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string valorTextBox6 = TextBox6.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox6))
            {
                Label1.Text = "Debe ingresar la localidad que desea agregar.";
                return;
            }
            if (TextBox6.Text == "")
            {
                Label1.Text = "Debe ingresar la localidad que desea agregar ";
                return;
            }
            else
            {
                if (DropDownList1.SelectedValue == "30"||DropDownList1.SelectedValue == "")
                {
                    Label1.Text = "Debe seleccionar una provincia.";
                    return;
                }
                else
                {
                    DSExisteLocalidad.SelectParameters["nombreLocalidad"].DefaultValue = TextBox6.Text;
                    DSExisteLocalidad.SelectParameters["codigoProvincia"].DefaultValue = DropDownList1.SelectedValue;
                    DSExisteLocalidad.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro = (SqlDataReader)DSExisteLocalidad.Select(DataSourceSelectArguments.Empty);
                    if (registro.Read())
                    {
                        Label1.Text = "La localidad, ya existe.";
                        return;
                    }
                    else
                    {
                        DSLocalidad.InsertParameters["nombreLocalidad"].DefaultValue = TextBox6.Text;
                        DSLocalidad.InsertParameters["codigoProvincia"].DefaultValue = DropDownList1.SelectedValue;
                        DSLocalidad.Insert();
                        TextBox6.Text = "";
                        Label1.Text = "Se agregó la localidad";
                    }
                }

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string valorTextBox7 = TextBox7.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox7))
            {
                Label2.Text = "Debe ingresar el barrio";
                return;
            }
            if (TextBox7.Text == "")
                Label2.Text = "Debe ingresar el barrio";
            else
            {
                if (DropDownList2.SelectedValue == "1"|| DropDownList2.SelectedValue == "")
                {
                    Label2.Text = "Debe seleccionar una localidad.";
                    return;
                }
                else
                {
                    DSExisteBarrio.SelectParameters["nombreBarrio"].DefaultValue = TextBox7.Text;
                    DSExisteBarrio.SelectParameters["codigoLocalidad"].DefaultValue = DropDownList2.SelectedValue;
                    DSExisteBarrio.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro = (SqlDataReader)DSExisteBarrio.Select(DataSourceSelectArguments.Empty);
                    if (registro.Read())
                    {
                        Label2.Text = "El barrio, ya existe.";
                        return;
                    }
                    else
                    {
                        DSBarrio.InsertParameters["nombreBarrio"].DefaultValue = TextBox7.Text;
                        DSBarrio.InsertParameters["codigoLocalidad"].DefaultValue = DropDownList2.SelectedValue;
                        DSBarrio.Insert();
                        TextBox7.Text = "";
                        Label2.Text = "Se agregó el barrio";
                    }
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DSCliente.InsertParameters["dni"].DefaultValue = TextBox3.Text;
                DSCliente.InsertParameters["nombre"].DefaultValue = TextBox1.Text;
                DSCliente.InsertParameters["apellido"].DefaultValue = TextBox2.Text;
                DSCliente.InsertParameters["telefono"].DefaultValue = TextBox4.Text;
                DSCliente.InsertParameters["correo"].DefaultValue = TextBox5.Text;
                DSCliente.InsertParameters["direccion"].DefaultValue = TextBox8.Text;
                DSCliente.InsertParameters["codigoBarrio"].DefaultValue = DropDownList3.SelectedValue;
                DSCliente.Insert();
                Label3.Text = "El cliente " + TextBox1.Text + " se registró satisfactoriamente.";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox8.Text = "";
                DropDownList1.SelectedValue = "30";
                DropDownList2.Items.Clear();
                DropDownList3.Items.Clear();
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (DropDownList1.SelectedValue != "30")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (DropDownList2.SelectedValue != "1")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (DropDownList3.SelectedValue != "5")
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator4_ServerValidate(object source, ServerValidateEventArgs args)
        {

            DSCliente.SelectParameters["dni"].DefaultValue = TextBox3.Text;
            DSCliente.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSCliente.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {

        }
    }
}