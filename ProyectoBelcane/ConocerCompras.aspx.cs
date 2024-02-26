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
    public partial class ConocerCompras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            decimal cantidadComprasUno=0, cantidadComprasDos=0, cantidadComprasTres = 0;
            if (!IsPostBack)
            {
                DateTime primerDiaDelMes = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                string primerdia = primerDiaDelMes.ToString("dd-MM-yyyy");
                string today = DateTime.Now.ToString("dd-MM-yyyy");
                DSCompras.SelectParameters["fechaDesde"].DefaultValue = primerdia;
                DSCompras.SelectParameters["fechaHasta"].DefaultValue = today;
                DSCompras.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSCompras.Select(DataSourceSelectArguments.Empty);
                if (registros.Read())
                {
                    DSTotalCompras.SelectParameters["fechaDesde"].DefaultValue = primerdia;
                    DSTotalCompras.SelectParameters["fechaHasta"].DefaultValue = today;
                    DSTotalCompras.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registros2 = (SqlDataReader)DSTotalCompras.Select(DataSourceSelectArguments.Empty);
                    if (registros2.Read())
                    {
                        Label9.Text = "Desde el día "+ primerDiaDelMes.ToString("dd-MM-yyyy") + " hasta hoy existe/n : " + registros2["cantidadCompras"].ToString() + "  compra/s registradas ,las mismas dan un total de : " + registros2["sumaTotal"].ToString() + ".";
                    }
                }
                else
                {
                    Label9.Text = "Desde el día " + primerDiaDelMes.ToString("dd-MM-yyyy") + " hasta la fecha no se encuentran compras registradas";
                }
            }

            DSTresMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 3 meses antes 
            SqlDataReader registros3 = (SqlDataReader)DSTresMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros3.Read())
            {
                Label12.Text = registros3["cantidadComprasTres"].ToString();
                Label13.Text = registros3["TotalMes"].ToString();
                cantidadComprasTres = decimal.Parse(Label13.Text);
                Label14.Text = registros3["Mes"].ToString();
                Label15.Text = registros3["Año"].ToString();
            }
            DSDosMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 2 meses antes 
            SqlDataReader registros4 = (SqlDataReader)DSDosMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros4.Read())
            {
                Label16.Text = registros4["cantidadComprasDos"].ToString();
                Label17.Text = registros4["TotalMes"].ToString();
                cantidadComprasDos = decimal.Parse(Label17.Text);
                Label18.Text = registros4["Mes"].ToString();
                Label19.Text = registros4["Año"].ToString();
            }
            DSMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 1 meses antes 
            SqlDataReader registros5 = (SqlDataReader)DSMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros5.Read())
            {
                Label20.Text = registros5["cantidadComprasUno"].ToString();
                Label21.Text = registros5["TotalMes"].ToString();
                cantidadComprasUno = decimal.Parse(Label21.Text);
                Label22.Text = registros5["Mes"].ToString();
                Label23.Text = registros5["Año"].ToString();
            }
            //-------------------------------------------------------------------------------------------------------------------------------------------------
            decimal[] datos = { cantidadComprasTres, cantidadComprasDos, cantidadComprasUno };
            string[] etiquetas = { Label14.Text, Label18.Text, Label22.Text };

            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas, datos);

            // Personalizar el estilo de las barras
            Chart1.Series["Series1"]["DrawingStyle"] = "Cylinder";

            // Personalizar el título del gráfico
            Chart1.Titles.Add("GASTOS EN COMPRAS");

            // Personalizar los ejes
            //Chart1.ChartAreas["ChartArea1"].AxisX.Title = "Meses";
            //Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Total Compras";
            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas, datos);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Label5.Text = "";
            Label9.Text = "";
            
            if (TextBox1.Text == "")
            { 
                Label5.Text = "Debe seleccionar la fecha del inicio de la busqueda -'Desde' ";
                return;
            }
            if (TextBox2.Text == "")
            {
                Label5.Text = "Debe seleccionar la fecha limite de la busqueda -'Hasta' ";
                return;
            }
            DateTime fecha1 = DateTime.Parse(TextBox1.Text);
            DateTime fecha2 = DateTime.Parse(TextBox2.Text);
            if (fecha1 > DateTime.Now) {
                Label5.Text = "La fecha 'Desde' , no puede ser mayor a la fecha actual";
                return; }
            if (fecha2 > DateTime.Now)
            {
                Label5.Text = "La fecha 'Hasta' , no puede ser mayor a la fecha actual";
                return;
            }
            if (fecha2 < fecha1)
            {
                Label5.Text ="La fecha hasta , no puede ser menor a la fecha 'Desde'.";
                return;
            }    
            DSCompras.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
            DSCompras.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
            DSCompras.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSCompras.Select(DataSourceSelectArguments.Empty);
            if (registros.Read())
            {
                DSTotalCompras.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
                DSTotalCompras.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
                DSTotalCompras.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros2 = (SqlDataReader)DSTotalCompras.Select(DataSourceSelectArguments.Empty);
                if (registros2.Read())
                {
                    Label9.Text = "En el rango de fechas seleccionadas existe/n : " + registros2["cantidadCompras"].ToString() + "  compra/s registradas ,las mismas dan un total de : " + registros2["sumaTotal"].ToString()+".";
                    GridView2.DataBind();
                }
            }
            else
            {
                Label9.Text = "No se no se encuentran compras registradas en el rango de fechas seleccionadas.";
                GridView2.DataBind();
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label6.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            Label7.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            Label10.Text = GridView1.Rows[GridView1.SelectedIndex].Cells[3].Text;

            Label8.Text = "Detalles de la compra N° " + Label6.Text + " . ";
            Label11.Text = "Total de la compra : " + Label10.Text + " . ";
            /*DSCodigo.SelectParameters["idCompra"].DefaultValue = Label1.Text;
            DSCodigo.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSCodigo.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                Label2.Text = registro["codigoDetalle"].ToString();
            }*/

            DSDetalle.SelectParameters["idDetalle"].DefaultValue = Label7.Text;
            DSDetalle.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro1 = (SqlDataReader)DSDetalle.Select(DataSourceSelectArguments.Empty);
            registro1.Read();

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteConocerCompras.aspx");
        }
    }
}