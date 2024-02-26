using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Drawing;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class GeneralConocerMascotas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int alergicos = 0,noalergicos = 0,medular = 0,cortical = 0,peloduro = 0,machos = 0,hembras=0,castrados=0,nocastrados=0;

            DSMascotas.SelectParameters["CodigoRaza"].DefaultValue = "1";//--> Carga el GV
            if (!IsPostBack)
            {
                DropDownList1.SelectedValue = "1";
            }
            

            DSTotalAlergSexoManto.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros1 = (SqlDataReader)DSTotalAlergSexoManto.Select(DataSourceSelectArguments.Empty);
            if (registros1.Read())
            {
                Label1.Text = registros1["TotalMascotas"].ToString();
                Label2.Text = registros1["CantidadAlergicos"].ToString();
                alergicos = int.Parse(Label2.Text);
                Label3.Text = registros1["CantidadNoAlergicos"].ToString();
                noalergicos = int.Parse(Label3.Text);
                Label4.Text = registros1["Medular"].ToString();
                medular = int.Parse(Label4.Text);
                Label5.Text = registros1["Cortical"].ToString();
                cortical = int.Parse(Label5.Text);
                Label6.Text = registros1["PeloDuro"].ToString();
                peloduro = int.Parse(Label6.Text);
                Label7.Text = registros1["CantidadMachos"].ToString();
                machos = int.Parse(Label7.Text);
                Label8.Text = registros1["CantidadHembras"].ToString();
                hembras = int.Parse(Label8.Text);
                Label18.Text = registros1["CantidadCastrados"].ToString();
                castrados = int.Parse(Label18.Text);
                Label19.Text = registros1["CantidadNoCastrados"].ToString();
                nocastrados = int.Parse(Label19.Text);
            }
            //------------------ GRAFICO ALERGICOS
            int[] datos1 = { alergicos, noalergicos };
            string[] etiquetas1 = { "Alergicas", "No Alergicas" };

            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas1, datos1);
            // Personalizar el título del gráfico
            Chart1.Titles.Add("ALERGICOS");
            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas1, datos1);

            //------------------ GRAFICO MANTOS
            int[] datos2 = { medular,cortical, peloduro };
            string[] etiquetas2 = { "Medular", "Cortical ", "Pelo Duro" };

            // Asignar los datos y las etiquetas al control Chart
            Chart2.Series["Series1"].Points.DataBindXY(etiquetas2, datos2);
            // Personalizar el título del gráfico
            Chart2.Titles.Add("MANTOS");
            // Asignar los datos y las etiquetas al control Chart
            Chart2.Series["Series1"].Points.DataBindXY(etiquetas2, datos2);

            


            //------------------ GRAFICO SEXO
            int[] datos3 = { machos,hembras };
            string[] etiquetas3 = { "Machos","Hembras" };

            // Asignar los datos y las etiquetas al control Chart
            Chart3.Series["Series1"].Points.DataBindXY(etiquetas3, datos3);
            // Personalizar el título del gráfico
            Chart3.Titles.Add("SEXOS");
            // Asignar los datos y las etiquetas al control Chart
            Chart3.Series["Series1"].Points.DataBindXY(etiquetas3, datos3);

            //------------------ GRAFICO CASTRADOS
            int[] datos4 = { castrados,nocastrados };
            string[] etiquetas4 = { "Castrados","No Castrados" };

            // Asignar los datos y las etiquetas al control Chart
            Chart4.Series["Series1"].Points.DataBindXY(etiquetas4, datos4);
            // Personalizar el título del gráfico
            Chart4.Titles.Add("CASTRADOS");
            
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }
             //GridView1.DataSourceID = null;---> con esta linea le quito la referencia del SQLDS al gridview
             //GridView1.DataBind();--->lo actualizo , al no tener referencia porque se la acabo de quitar , queda en blanco.
        

        protected void Button3_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "1";
            DSMascotas.SelectParameters["CodigoRaza"].DefaultValue = "1";
            GridView1.DataBind();

            Label21.Text = "";
            Label9.Text = "";
            Label10.Text = "";
            Label20.Text = "";
            Label11.Text = "";
            Label12.Text = "";
            Label13.Text = "";
            Label14.Text = "";
            Label15.Text = "";
            Label16.Text = "";
            Label17.Text = "";
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int machos = 0, hembras = 0, alergicos = 0, noalergicos = 0;
            Label21.Text = "";

            if (DropDownList1.SelectedValue == "1")
            {
                DSMascotas.SelectParameters["CodigoRaza"].DefaultValue = "1";
                return;
            }
            else
            {
                DSFiltradoPorRaza.SelectParameters["CodigoRaza"].DefaultValue = DropDownList1.SelectedValue;
                DSFiltradoPorRaza.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSFiltradoPorRaza.Select(DataSourceSelectArguments.Empty);
                registros.Read();

                    if (registros["TotalMascotas"].ToString() != "0")
                    {
                        DSMascotas.SelectParameters["CodigoRaza"].DefaultValue = DropDownList1.SelectedValue;
                        Label9.Text = registros["TotalMascotas"].ToString();
                        Label10.Text = registros["CantidadAlergicos"].ToString();
                    alergicos = int.Parse(Label10.Text);
                    Label20.Text = registros["CantidadNoAlergicos"].ToString();
                    noalergicos = int.Parse(Label20.Text);
                    Label11.Text = registros["Medular"].ToString();
                        Label12.Text = registros["Cortical"].ToString();
                        Label13.Text = registros["PeloDuro"].ToString();
                        Label14.Text = registros["CantidadMachos"].ToString();
                    machos = int.Parse(Label14.Text);
                        Label15.Text = registros["CantidadHembras"].ToString();
                    hembras = int.Parse(Label15.Text);
                    Label16.Text = registros["CantidadCastrados"].ToString();
                        Label17.Text = registros["CantidadNoCastrados"].ToString();

                    //------------------ GRAFICO ALERGICOS
                    int[] datos5 = { alergicos, noalergicos };
                    string[] etiquetas5 = { "Alergicas", "No Alergicas" };

                    // Asignar los datos y las etiquetas al control Chart
                    Chart5.Series["Series1"].Points.DataBindXY(etiquetas5, datos5);
                    // Personalizar el estilo de las barras
                    Chart5.Series["Series1"]["DrawingStyle"] = "Cylinder";
                    // Personalizar el título del gráfico
                    Chart5.Titles.Add("ALERGICOS");
                    // Asignar los datos y las etiquetas al control Chart
                    Chart5.Series["Series1"].Points.DataBindXY(etiquetas5, datos5);


                    //------------------ GRAFICO SEXO
                    int[] datos6 = { machos, hembras };
                    string[] etiquetas6 = { "Machos", "Hembras" };

                    // Asignar los datos y las etiquetas al control Chart
                    Chart6.Series["Series1"].Points.DataBindXY(etiquetas6, datos6);
                    // Personalizar el estilo de las barras
                    Chart6.Series["Series1"]["DrawingStyle"] = "Cylinder";
                    // Personalizar el título del gráfico
                    Chart6.Titles.Add("SEXOS");
                    // Asignar los datos y las etiquetas al control Chart
                    Chart6.Series["Series1"].Points.DataBindXY(etiquetas6, datos6);
                }
                    else
                    {
                        Label21.Text = "No existen mascotas registradas para la raza seleccionada.";
                        DSMascotas.SelectParameters["CodigoRaza"].DefaultValue = "1";
                        GridView1.DataBind();
                        
                        Label9.Text = "";
                        Label10.Text = "";
                        Label20.Text = "";
                        Label11.Text = "";
                        Label12.Text = "";
                        Label13.Text = "";
                        Label14.Text = "";
                        Label15.Text = "";
                        Label16.Text = "";
                        Label17.Text = "";
                
                    }
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteConocerMascotas.aspx");
        }
    }
}