using iText.Layout.Element;
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
    public partial class AdministracionComprasInsumos : System.Web.UI.Page
    {


        public void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Attributes["type"] = "number";
            TextBox1.Attributes["step"] = "0.01";

            if (!IsPostBack)
            {
                DSCodDetalle.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSCodDetalle.Select(DataSourceSelectArguments.Empty);
                if (registros.Read())
                {
                    string ultvalor = registros["ultDetalle"].ToString();
                    int codigoDetalle = Int16.Parse(ultvalor);
                    int suma = codigoDetalle + 1;

                    Label3.Text = suma.ToString();
                }


            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DSBorraDetalle.DeleteParameters["idDetalle"].DefaultValue = Label3.Text;
            DSBorraDetalle.Delete();
            Response.Redirect("AdministracionInsumos.aspx");
        }


        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label2.Text = "";
            DSFiltrado.SelectParameters["codigoRubro"].DefaultValue = DropDownList2.SelectedValue;
            DSFiltrado.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSFiltrado.Select(DataSourceSelectArguments.Empty);
            registros.Read();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Label1.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (DropDownList2.SelectedValue == "1")
            {
                Label1.Text = "Debe seleccionar el rubro y luego el insumo que desea agregar a la lista de compra.";
                return;
            }
            if (DropDownList1.SelectedValue == "1")
            {
                Label1.Text = "Debe seleccionar el insumo que desea agregar a la lista de compra.";
                return;
            }
            if (TextBox1.Text == "")
            {
                Label1.Text = "Debe ingresar el precio unitario del Ins./Serv. que desea agregar a la compra. ";
                return;
            }
            if (TextBox2.Text == "")
            {
                Label1.Text = "Debe ingresar la cantidad del Ins./Serv. que desea agregar a la compra. ";
                return;
            }
            int.TryParse(TextBox2.Text, out int valorTextBox2);
            
                if (valorTextBox2 <= 0)
                {
                    Label1.Text = "La cantidad no puede ser menor o igual a cero. Ingrese correctamente la cantidad. ";
                    return;
                }
                
            else
            {
                DSDetCompra.InsertParameters["insumoServicio"].DefaultValue = DropDownList1.SelectedValue;
                DSDetCompra.InsertParameters["codigoRubro"].DefaultValue = DropDownList2.SelectedValue;
                DSDetCompra.InsertParameters["precioUnitario"].DefaultValue = TextBox1.Text;
                DSDetCompra.InsertParameters["cantidad"].DefaultValue = TextBox2.Text;
                DSDetCompra.InsertParameters["idDetalle"].DefaultValue = Label3.Text;
                DSDetCompra.Insert();

                TextBox1.Text = "";
                TextBox2.Text = "";
                DropDownList2.SelectedValue = "1";
                DropDownList1.Items.Clear();
                Label1.ForeColor = Color.Black;
                Label1.Text = "El Insumo/Servicio fué agregado a la lista de compra.";

                DSDetCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
                DSDetCompra.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSDetCompra.Select(DataSourceSelectArguments.Empty);
                registros.Read();

                DSTotalCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
                DSTotalCompra.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSTotalCompra.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Label5.Text = "$" + registro["sumaTotal"].ToString();
                }

            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");

            DSDetCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
            DSDetCompra.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSDetCompra.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {


                /*if (Label5.Text == "")
                {
                    Label2.Text = "No se puede registrar una compra sin un Serv./Ins. cargado.";
                    return;
                }*/
                if (DropDownList3.SelectedValue == "7")
                {
                    Label2.Text = "Debe seleccionar una forma de pago de la compra.";
                    return;
                }
                else
                {
                    DSTotalCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
                    DSTotalCompra.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro = (SqlDataReader)DSTotalCompra.Select(DataSourceSelectArguments.Empty);
                    if (registro.Read())
                    {
                        Label4.Text = registro["sumaTotal"].ToString();
                    }

                    DSCompra.InsertParameters["codigoDetalle"].DefaultValue = Label3.Text;
                    DSCompra.InsertParameters["fecha"].DefaultValue = DateTime.Now.ToString("dd-MM-yyyy");
                    DSCompra.InsertParameters["importeTotalCompra"].DefaultValue = Label4.Text;
                    DSCompra.InsertParameters["codigoPago"].DefaultValue = DropDownList3.SelectedValue;
                    DSCompra.InsertParameters["comentarioCompra"].DefaultValue = TextBox3.Text;
                    DSCompra.InsertParameters["usuarioCompra"].DefaultValue = $"{Session["usuario"]}";
                    if (DSCompra.Insert() > 0)
                    {
                        Label2.ForeColor = Color.Black;
                        Label2.Text = "La compra fué registrada exitosamente";
                        Label1.Text = "";
                        TextBox3.Text = "";
                        DropDownList3.SelectedValue = "7";
                        Label5.Text = "";

                        DSCodDetalle.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registrosx = (SqlDataReader)DSCodDetalle.Select(DataSourceSelectArguments.Empty);
                        if (registrosx.Read())
                        {
                            string ultvalor = registrosx["ultDetalle"].ToString();
                            int codigoDetalle = Int16.Parse(ultvalor);
                            int suma = codigoDetalle + 1;

                            Label3.Text = suma.ToString();
                        }
                        DSDetCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
                        DSDetCompra.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registros3 = (SqlDataReader)DSDetCompra.Select(DataSourceSelectArguments.Empty);
                        registros3.Read();

                    }
                }


            }
            else
            {
                Label2.Text = "No se puede registrar una compra vacía.";
                return;
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            DSBorraDetalle.DeleteParameters["idDetalle"].DefaultValue = Label3.Text;
            DSBorraDetalle.Delete();
            Response.Redirect("AdministracionInsumos.aspx");
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {

            Label1.Text = "";
            DSTotalCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
            DSTotalCompra.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSTotalCompra.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                Label5.Text = "$" + registro["sumaTotal"].ToString();
            }

        }


        protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            Label1.Text = "";
            DSTotalCompra.SelectParameters["idDetalle"].DefaultValue = Label3.Text;
            DSTotalCompra.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSTotalCompra.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                Label5.Text = "$" + registro["sumaTotal"].ToString();
            }
            else
                Label5.Text = "";
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (decimal.TryParse(TextBox1.Text.Replace(",", "."), out decimal valor))
            {
                args.IsValid = (valor > 0);
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}