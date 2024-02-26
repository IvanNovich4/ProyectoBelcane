using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Web.UI.DataVisualization.Charting;

namespace ProyectoBelcane
{
    public partial class ConocerTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            decimal cantidadTurnosUno = 0;
            decimal cantidadTurnosDos = 0;
            decimal cantidadTurnosTres = 0;
            if (!IsPostBack)
            {
                string date = DateTime.Now.ToString("dd-MM-yyyy");
                DSTurnosPorDefecto.SelectParameters["fechaDesde"].DefaultValue = date;
                DSTurnosPorDefecto.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSTurnosPorDefecto.Select(DataSourceSelectArguments.Empty);
                Label3.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Dueño </th><th> Mascota </th><th> Raza </th><th> Servicio </th><th> Duración </th><th> Importe - Total </th><th>   Usuario   </th>";
                while (registros.Read())
                {
                    Label3.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombre"]}  {registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td>{registros["importeTurnoConSigno"]}</td><td>{registros["usuario"]}</td>";

                }
                Label3.Text += "</table>";
                DSRegTotDefecto.SelectParameters["fechaDesde"].DefaultValue = date;
                DSRegTotDefecto.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros2 = (SqlDataReader)DSRegTotDefecto.Select(DataSourceSelectArguments.Empty);
                if (registros2.Read())
                {
                    Label1.Text = "Desde la fecha de hoy '" + date + "' en adelante , existen '" + registros2["cantidadTurnos"].ToString() + "' turnos registrados.";
                    Label2.Text = "La sumatoria de los mismos da un total de : " + registros2["sumaTotal"].ToString();
                    Label17.Text = "De los cuales " + registros2["CantidadTurnosMachos"].ToString() + " pertenecen a 'Machos' y " + registros2["CantidadTurnosHembras"].ToString() + " a 'Hembras'.";
                    Label18.Text = "De los cuales " + registros2["CantidadAlergicos"].ToString() + " pertenecen a 'Mascotas Alergicas' y " + registros2["CantidadNoAlergicos"].ToString() + " a 'Mascotas No Alergicas'.";
                }
            }

            DSTresMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 3 meses antes 
            SqlDataReader registros3 = (SqlDataReader)DSTresMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros3.Read())
            {
                Label5.Text = registros3["cantidadTurnosTres"].ToString();
                Label6.Text = registros3["sumaTotalTres"].ToString();
                cantidadTurnosTres = decimal.Parse(Label6.Text);
                Label7.Text = registros3["NombreTresMesAnterior"].ToString();
                Label8.Text = registros3["AnioTresMesAnterior"].ToString();
            }
            DSDosMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 2 meses antes 
            SqlDataReader registros4 = (SqlDataReader)DSDosMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros4.Read())
            {
                Label9.Text = registros4["cantidadTurnosDos"].ToString();
                Label10.Text = registros4["sumaTotalDos"].ToString();
                cantidadTurnosDos = decimal.Parse(Label10.Text);
                Label11.Text = registros4["NombreDosMesAnterior"].ToString();
                Label12.Text = registros4["AnioDosMesAnterior"].ToString();
            }
            DSMesAnterior.DataSourceMode = SqlDataSourceMode.DataReader;//---> 1 meses antes 
            SqlDataReader registros5 = (SqlDataReader)DSMesAnterior.Select(DataSourceSelectArguments.Empty);
            if (registros5.Read())
            {
                Label13.Text = registros5["cantidadTurnosUno"].ToString();
                Label14.Text = registros5["sumaTotalUno"].ToString();
                cantidadTurnosUno = decimal.Parse(Label14.Text);
                Label15.Text = registros5["NombreUnoMesAnterior"].ToString();
                Label16.Text = registros5["AnioUnoMesAnterior"].ToString();
            }
            //-------------------------------------------------------------------------------------------------------------------------------------------------
            decimal[] datos = { cantidadTurnosTres, cantidadTurnosDos, cantidadTurnosUno };
            string[] etiquetas = { Label7.Text, Label11.Text, Label15.Text };

            // Personalizar el título del gráfico
            Chart1.Titles.Add("INGRESOS GENERADOS");

            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas, datos);

            // Personalizar el estilo de las barras
            Chart1.Series["Series1"]["DrawingStyle"] = "Cylinder";

            // Personalizar los ejes
            //Chart1.ChartAreas["ChartArea1"].AxisY.Title = "Dinero generado";
            // Asignar los datos y las etiquetas al control Chart
            Chart1.Series["Series1"].Points.DataBindXY(etiquetas, datos);
        
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            

            if (TextBox1.Text == "")
            {
                Label4.Text = "Debe seleccionar una fecha 'Desde'.";
                return;
            }
            if (TextBox2.Text == "")
            {
                Label4.Text = "Debe seleccionar una fecha 'Hasta'.";
                return;
            }
            DateTime fecha1 = DateTime.Parse(TextBox1.Text);
            DateTime fecha2 = DateTime.Parse(TextBox2.Text);

            string desde = DateTime.ParseExact(TextBox1.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("dd-MM-yyyy");
            string hasta = DateTime.ParseExact(TextBox2.Text, "yyyy-MM-dd", CultureInfo.InvariantCulture).ToString("dd-MM-yyyy");

            if(fecha1 > fecha2) 
            {
                Label4.Text = "La fecha de turnos desde , no puede ser mayor a la fecha de tunos hasta";
                return;
            }

            if (DropDownList1.SelectedValue == "2")
            {
                Label1.Text = "";
                Label2.Text = "";
                Label4.Text = "";
                DSTurnos.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
                DSTurnos.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
                DSTurnos.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSTurnos.Select(DataSourceSelectArguments.Empty);
                Label3.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Dueño </th><th> Mascota </th><th> Raza </th><th> Servicio </th><th> Duración </th><th> Importe - Total </th><th>   Usuario   </th>";
                while (registros.Read())
                {
                    Label3.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombre"]}  {registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td>{registros["importeTurnoConSigno"]}</td><td>{registros["usuario"]}</td>";

                }
                Label3.Text += "</table>";

                DSRegTot.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
                DSRegTot.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
                DSRegTot.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros2 = (SqlDataReader)DSRegTot.Select(DataSourceSelectArguments.Empty);
                if (registros2.Read())
                {
                    Label1.Text = "Desde el '" + desde + "' hasta la fecha '" + hasta + "' existen '" + registros2["cantidadTurnos"].ToString() + "' turnos registrados.";
                    Label2.Text = "La sumatoria de los mismos da un total de : " + registros2["sumaTotal"].ToString();
                    Label17.Text = "De los cuales " + registros2["CantidadTurnosMachos"].ToString() + " pertenecen a 'Machos' y " + registros2["CantidadTurnosHembras"].ToString() + " a 'Hembras'.";
                    Label18.Text = "De los cuales " + registros2["CantidadAlergicos"].ToString() + " pertenecen a 'Mascotas Alergicas' y " + registros2["CantidadNoAlergicos"].ToString() + " a 'Mascotas No Alergicas'.";
                }
            }
            else
            {
                string nombreServicio;
                DSNombreServ.SelectParameters["idServicio"].DefaultValue = DropDownList1.SelectedValue;
                DSNombreServ.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros5 = (SqlDataReader)DSNombreServ.Select(DataSourceSelectArguments.Empty);
                registros5.Read();
                {
                    nombreServicio = registros5["nombreServicio"].ToString();
                }

                Label1.Text = "";
                Label2.Text = "";
                Label4.Text = "";
                DSTurnosFiltrados.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
                DSTurnosFiltrados.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
                DSTurnosFiltrados.SelectParameters["codigoServicio"].DefaultValue = DropDownList1.SelectedValue;
                DSTurnosFiltrados.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros3 = (SqlDataReader)DSTurnosFiltrados.Select(DataSourceSelectArguments.Empty);
                Label3.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Dueño </th><th> Mascota </th><th> Raza </th><th> Servicio </th><th> Duración </th><th> Importe - Total </th><th>   Usuario   </th>";
                while (registros3.Read())
                {
                    Label3.Text += $"<tr><td>{registros3["fecha_formato"]}</td><td>{registros3["horario"]}</td><td>{registros3["nombre"]}  {registros3["apellido"]}</td><td>{registros3["nombreMascota"]}</td><td>{registros3["nombreRaza"]}</td><td>{registros3["nombreServicio"]}</td><td>{registros3["duracionTurnoConTexto"]}</td><td>{registros3["importeTurnoConSigno"]}</td><td>{registros3["usuario"]}</td>";
                }
                Label3.Text += "</table>";

                DSRegTotFiltrado.SelectParameters["fechaDesde"].DefaultValue = TextBox1.Text;
                DSRegTotFiltrado.SelectParameters["fechaHasta"].DefaultValue = TextBox2.Text;
                DSRegTotFiltrado.SelectParameters["idServicio"].DefaultValue = DropDownList1.SelectedValue;
                DSRegTotFiltrado.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros4 = (SqlDataReader)DSRegTotFiltrado.Select(DataSourceSelectArguments.Empty);
                if (registros4.Read())
                {
                    Label1.Text = "Desde el '" + desde + "' hasta el '" + hasta + "' con el servicio '" + nombreServicio + "' existen '" + registros4["cantidadTurnos"].ToString() + "' turnos registrados.";
                    Label2.Text = "La sumatoria de los mismos da un total de : "+registros4["sumaTotal"].ToString();
                    Label17.Text = "De los cuales " + registros4["CantidadTurnosMachos"].ToString() + " pertenecen a 'Machos' y " + registros4["CantidadTurnosHembras"].ToString() + " a 'Hembras'.";
                    Label18.Text = "De los cuales " + registros4["CantidadAlergicos"].ToString() + " pertenecen a 'Mascotas Alergicas' y " + registros4["CantidadNoAlergicos"].ToString() + " a 'Mascotas No Alergicas'.";
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionGeneral.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            DropDownList1.SelectedValue = "2";
            Label1.Text = "";
            Label2.Text = "";
            Label4.Text = "";

            string date = DateTime.Now.ToString("dd-MM-yyyy");
            DSTurnosPorDefecto.SelectParameters["fechaDesde"].DefaultValue = date;
            DSTurnosPorDefecto.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSTurnosPorDefecto.Select(DataSourceSelectArguments.Empty);
            Label3.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Dueño </th><th> Mascota </th><th> Raza </th><th> Servicio </th><th> Duración </th><th> Importe - Total </th><th>   Usuario   </th>";
            while (registros.Read())
            {
                Label3.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombre"]}  {registros["apellido"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombreRaza"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td>{registros["importeTurnoConSigno"]}</td><td>{registros["usuario"]}</td>";
            }
            Label3.Text += "</table>";
            DSRegTotDefecto.SelectParameters["fechaDesde"].DefaultValue = date;
            DSRegTotDefecto.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros2 = (SqlDataReader)DSRegTotDefecto.Select(DataSourceSelectArguments.Empty);
            if (registros2.Read())
            {
                Label1.Text = "Desde la fecha de hoy '" + date + "' en adelante , existen '" + registros2["cantidadTurnos"].ToString() + "' turnos registrados.";
                Label2.Text = "La sumatoria de los mismos da un total de : " + registros2["sumaTotal"].ToString();
                Label17.Text = "De los cuales " + registros2["CantidadTurnosMachos"].ToString() + " pertenecen a 'Machos' y " + registros2["CantidadTurnosHembras"].ToString() + " a 'Hembras'.";
                Label18.Text = "De los cuales " + registros2["CantidadAlergicos"].ToString() + " pertenecen a 'Mascotas Alergicas' y " + registros2["CantidadNoAlergicos"].ToString() + " a 'Mascotas No Alergicas'.";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            DropDownList1.SelectedValue = "2";
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReporteConocerTurnos.aspx");
        }
    }
}