using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics.Eventing.Reader;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class BuscarModificarCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string codigocliente = Request.QueryString["codCli"];
                string codigo1 = "";
                string codigo2 = "";
                DropDownList1.SelectedValue = "30";

                if (codigocliente != "")
                {
                    DSClienteInfo.SelectParameters["dni"].DefaultValue = codigocliente;
                    DSClienteInfo.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro = (SqlDataReader)DSClienteInfo.Select(DataSourceSelectArguments.Empty);
                    if (registro.Read())
                    {
                        Label5.Text = registro["dni"].ToString();
                        TextBox1.Text = registro["nombre"].ToString();
                        TextBox2.Text = registro["apellido"].ToString();
                        TextBox4.Text = registro["telefono"].ToString();
                        TextBox5.Text = registro["correo"].ToString();
                        TextBox8.Text = registro["direccion"].ToString();
                        codigo1 = registro["idLocalidad"].ToString();
                        codigo2 = registro["codigoBarrio"].ToString();
                        DropDownList1.SelectedValue = registro["codigoProvincia"].ToString();
                        DSLocalidad.SelectParameters["codigoProvincia"].DefaultValue = registro["codigoProvincia"].ToString();
                        DSLocalidad.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registro2 = (SqlDataReader)DSLocalidad.Select(DataSourceSelectArguments.Empty);
                        if (registro2.Read())
                        {
                            DropDownList2.SelectedValue = registro["idLocalidad"].ToString();

                            DSBarrio.SelectParameters["codigoLocalidad"].DefaultValue = registro["idLocalidad"].ToString();
                            DSBarrio.DataSourceMode = SqlDataSourceMode.DataReader;
                            SqlDataReader registro3 = (SqlDataReader)DSBarrio.Select(DataSourceSelectArguments.Empty);
                            if (registro3.Read())
                            {
                                DropDownList3.SelectedValue = registro["codigoBarrio"].ToString();

                            }
                            else
                            {
                                Label2.Text = " no esta cargando el dropdown3";
                            }
                        }
                        else
                        {
                            Label1.Text = "no esta cargando el dropdown2";

                        }
                    }
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuscarCliente.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {

            if (TextBox3.Text == "")
            {
                Label4.Text = "Ingresar el DNI del cliente a buscar  ";
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                DropDownList1.SelectedValue = "30";
                DropDownList2.Items.Clear();
                DropDownList3.Items.Clear();
                Label1.Text = "";
                Label2.Text = "";
                Label3.Text = "";
                Label5.Text = "";
            }
            else
            {
                Label4.Text = "";
                DropDownList2.Items.Clear();
                DropDownList3.Items.Clear();
                DSClientes.SelectParameters["dni"].DefaultValue = TextBox3.Text;
                DSClientes.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSClientes.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label5.Text = TextBox3.Text;
                    TextBox1.Text = registro["nombre"].ToString();
                    TextBox2.Text = registro["apellido"].ToString();
                    TextBox4.Text = registro["telefono"].ToString();
                    TextBox5.Text = registro["correo"].ToString();
                    DropDownList1.SelectedValue = registro["codigoProvincia"].ToString();
                    TextBox8.Text = registro["direccion"].ToString();

                    DSLocalidad.SelectParameters["codigoProvincia"].DefaultValue = DropDownList1.SelectedValue;
                    DSLocalidad.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro2 = (SqlDataReader)DSLocalidad.Select(DataSourceSelectArguments.Empty);
                    if (registro2.Read())
                    {
                        DropDownList2.SelectedValue = registro["codigoLocalidad"].ToString();

                        DSBarrio.SelectParameters["codigoLocalidad"].DefaultValue = registro["codigoLocalidad"].ToString();
                        DSBarrio.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registro3 = (SqlDataReader)DSBarrio.Select(DataSourceSelectArguments.Empty);
                        if (registro3.Read())
                        {
                            DropDownList3.SelectedValue = registro["codigoBarrio"].ToString();
                        }
                        else
                        {
                            Label2.Text = " no esta cargando el dropdown3";
                        }
                    }
                    else
                    {
                        Label1.Text = "no esta cargando el dropdown2";
                    }
                }
                else
                {
                    TextBox1.Text = "";
                    TextBox2.Text = "";
                    TextBox4.Text = "";
                    TextBox5.Text = "";
                    TextBox6.Text = "";
                    TextBox7.Text = "";
                    TextBox8.Text = "";
                    DropDownList1.SelectedValue = "30";
                    Label1.Text = "";
                    Label2.Text = "";
                    Label3.Text = "";
                    Label4.Text = "No existe un cliente con el DNI ingresado";
                    Label5.Text = "";
                }
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            string valorTextBox6 = TextBox6.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox6))
            {
                Label1.Text = "Debe ingresar la localidad que desea agregar.";
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
                    Label1.Text = "La localidad que desea agregar , ya existe.";
                    return;
                }
                else
                {
                    DSLocalidad.InsertParameters["nombreLocalidad"].DefaultValue = TextBox6.Text;
                    DSLocalidad.InsertParameters["codigoProvincia"].DefaultValue = DropDownList1.SelectedValue;
                    DSLocalidad.Insert();
                    TextBox6.Text = "";
                    Label1.ForeColor = Color.Black;
                    Label1.Text = "Se agregó la localidad Correctamente";
                }
                
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            string valorTextBox7 = TextBox7.Text.Trim();

            if (string.IsNullOrEmpty(valorTextBox7))
            {
                Label2.Text = "Debe ingresar el barrio que desea agregar.";
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
                    Label2.Text = "El barrio que desea agregar , ya existe.";
                    return;
                }
                else
                {
                    DSBarrio.InsertParameters["nombreBarrio"].DefaultValue = TextBox7.Text;
                    DSBarrio.InsertParameters["codigoLocalidad"].DefaultValue = DropDownList2.SelectedValue;
                    DSBarrio.Insert();
                    TextBox7.Text = "";
                    Label2.ForeColor = Color.Black;
                    Label2.Text = "Se agregó el barrio Correctamente";
                }

            }
        }

        public void BorrarLabelBarrio(object sender, EventArgs e)
        {
            Label2.Text = "";

        }

        protected void Button2_Click(object sender, EventArgs e)//modificar cliente
        {
            Label3.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (Label5.Text == "")
            {
                Label3.Text = "Debe buscar por DNI el cliente que desea modificar";
            }
            else
            {
                if (IsValid)
                {
                    DSClientes.UpdateParameters["dni"].DefaultValue = Label5.Text;
                    DSClientes.UpdateParameters["nombre"].DefaultValue = TextBox1.Text;
                    DSClientes.UpdateParameters["apellido"].DefaultValue = TextBox2.Text;
                    DSClientes.UpdateParameters["telefono"].DefaultValue = TextBox4.Text;
                    DSClientes.UpdateParameters["correo"].DefaultValue = TextBox5.Text;
                    DSClientes.UpdateParameters["direccion"].DefaultValue = TextBox8.Text;
                    DSClientes.UpdateParameters["codigoBarrio"].DefaultValue = DropDownList3.SelectedValue.ToString();
                    int cant = DSClientes.Update();
                    if (cant == 1)
                    {
                        TextBox1.Text = "";
                        TextBox2.Text = "";
                        TextBox3.Text = "";
                        Label5.Text = "";
                        TextBox4.Text = "";
                        TextBox5.Text = "";
                        TextBox6.Text = "";
                        TextBox7.Text = "";
                        TextBox8.Text = "";
                        DropDownList1.SelectedValue = "30";
                        DropDownList2.Items.Clear();
                        DropDownList3.Items.Clear();
                        Label1.Text = "";
                        Label2.Text = "";
                        Label3.Text = "";
                        Label3.ForeColor = Color.Black;
                        Label3.Text = " Los datos fueron modificados satisfactoriamente. ";
                    }
                    else
                    {
                        Label4.Text = "";
                        Label3.Text = "Dni incorrecto ingrese nuevamente";
                    }
                }
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

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("BuscarCliente.aspx");
        }
    }
}