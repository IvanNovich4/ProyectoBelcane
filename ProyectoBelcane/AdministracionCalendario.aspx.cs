using Microsoft.Extensions.Options;
using ProyectoBelcane.DataSetMascotasTableAdapters;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AdministracionCalendario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)                    estas dos lineas son para ocultar el calendario al iniciar la pagina
            //    Calendar1.Visible = false;
            if (!IsPostBack)
            {
                string date = DateTime.Now.ToString("dd-MM-yyyy");
                DSTurno.SelectParameters["fechaActual"].DefaultValue = date;
                DSTurno.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSTurno.Select(DataSourceSelectArguments.Empty);
                Label6.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Mascota </th><th> Dueño </th><th> Servicio </th><th> Duración </th><th> Modificar </th><th> Eliminar </th>";
                while (registros.Read())
                {
                    Label6.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombre"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td><a href=\"ModificarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Modificar </a></td><td><a href=\"EliminarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Borrar </a></td>";

                }
                Label6.Text += "</table>";
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionTurnos.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //Calendar1.Visible =!Calendar1.Visible; esta linea es para mostrar el calendario , debe estar tambien con las lineas del page load 
            Calendar1.SelectedDates.Clear();

            Label7.Text = "";
            TextBox8.Text = "";

            string date = DateTime.Now.ToString("dd-MM-yyyy");
            DSTurno.SelectParameters["fechaActual"].DefaultValue = date;
            DSTurno.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registros = (SqlDataReader)DSTurno.Select(DataSourceSelectArguments.Empty);
            Label6.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Mascota </th><th> Dueño </th><th> Servicio </th><th> Duración </th><th> Modificar </th><th> Eliminar </th>";
            while (registros.Read())
            {
                Label6.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombre"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td><a href=\"ModificarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Modificar </a></td><td><a href=\"EliminarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Borrar </a></td>";

            }
            Label6.Text += "</table>";
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)//ejecuta el metodo del click en el calendario
        {

            //Label1.Text = "";
            //TextBox1.Text = Calendar1.SelectedDate.ToString();//pasa los datos de un solo dia al que hacemos click ( CON la hora )
            //TextBox2.Text = Calendar1.SelectedDate.ToShortDateString();//pasa los datos solamente del dia (SIN la hora)
            // para recorrer todas las fechas seleccionadas 

            /*foreach (DateTime d in Calendar1.SelectedDates)
            {
                Response.Write(d.ToShortDateString()+"</br>");
                Label1.Text += d.ToShortDateString()+"</br>";
            }*/
            Label6.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Mascota </th><th> Dueño </th><th> Servicio </th><th> Duración </th><th> Modificar </th><th> Eliminar </th>";
            foreach (DateTime d in Calendar1.SelectedDates)
            {
                string cadena = d.ToString("yyyy-MM-dd");

                DSTurno2.SelectParameters["fechaTurno"].DefaultValue = cadena.ToString();
                DSTurno2.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSTurno2.Select(DataSourceSelectArguments.Empty);
                while (registros.Read())
                    Label6.Text += $"<tr><td>{registros["fecha"]}</td><td>{registros["horario"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombre"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td><a href=\"ModificarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Modificar </a></td><td><a href=\"EliminarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Borrar </a></td>";

            }
            Label6.Text += "</table>";
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)// parametro "e" es la informacion de la celda que nosotros estamos procesando en ese momento ,se lleva a cabo para todas las celdas del calendario
        {//hace un registro de cada dia dibujado en el calendario
            //if (e.Day.IsToday)//verifica si el dia es hoy y si es , da "true" y el dia de hoy lo muestra como "hoy"
            //{
            //    e.Cell.BackColor = System.Drawing.Color.Green;
            //}
            //if (e.Day.IsWeekend)//verifica si el dia seleccionado es fin de semana , si es ,da "true" y ese día no se va a poder seleccionar
            //{
            //    e.Day.IsSelectable=false;
            //}

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Label2.Text = "";
            this.Label2.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (TextBox3.Text != "")
            {
                DSCliente.SelectParameters["dni"].DefaultValue = TextBox3.Text;
                DSCliente.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSCliente.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    TextBox6.Text = registro["nombre"].ToString() + " " + registro["apellido"].ToString();
                    DSMascotas.SelectParameters["codigoDueño"].DefaultValue = TextBox3.Text;
                    DSMascotas.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro2 = (SqlDataReader)DSMascotas.Select(DataSourceSelectArguments.Empty);
                    registro2.Read();

                }
                else
                {
                    TextBox6.Text = "";
                    DropDownList1.Items.Clear();
                    Label2.Text = "El DNI ingresado no pertenece a ningun cliente registrado";
                }
            }
            else
            {
                TextBox6.Text = "";
                DropDownList1.Items.Clear();
                Label2.Text = "Debe ingresar el DNI del cliente";
            }
        }


        protected void MostrarRaza(object sender, EventArgs e)
        {

            DSRaza.SelectParameters["idMascota"].DefaultValue = DropDownList1.SelectedValue;
            DSRaza.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro = (SqlDataReader)DSRaza.Select(DataSourceSelectArguments.Empty);
            if (registro.Read())
            {
                Label3.Text = registro["nombreRaza"].ToString();
                Label4.Text = registro["nombreTamaño"].ToString();
            }
            else
            {
                Label3.Text = "";
                Label4.Text = "";
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            String cadena = "";
            //Registrar el detalle de turno , luego de ejecutar el insert , se debe preguntar si se inserto una fila , luego recuperar el ultimo registro insertado , sacar el id
            //y con ese id , registrar el turno insertando en el codigoDetalleTurno el id que acabamos de recuperar de la consulta del ultimo registro en la tabla detallesTurno
            if (IsValid) //retorna verdadero si los dos controles de tipo RequiredFieldValidator se verifican verdaderos
            {
                this.Label5.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
                string fechaIngresada = TextBox1.Text;//--------------------------------------------------> Valida la fecha no puede ser menor o igual a la actual
                DateTime fecha = DateTime.Parse(fechaIngresada);

                DateTime fechaActual = DateTime.Today;

                if (DateTime.Compare(fecha, fechaActual) <= 0)
                {
                    // La fecha ingresada es igual o menor a la fecha actual
                    Label5.Text = "La fecha del turno no puede ser igual o anterior a la actual.";
                    return; // Detener la validación
                }

                string tiempoIngresado1 = TextBox2.Text;//------------------------------------------------------> Valida rango horario del turno
                TimeSpan tiempo1 = TimeSpan.Parse(tiempoIngresado1);

                TimeSpan limiteInferior = new TimeSpan(8, 0, 0); // 08:00
                TimeSpan limiteSuperior = new TimeSpan(17, 0, 0); // 17:00

                if (TimeSpan.Compare(tiempo1, limiteInferior) < 0 || TimeSpan.Compare(tiempo1, limiteSuperior) > 0)
                {
                    // El tiempo ingresado está fuera del rango permitido
                    Label5.Text = "El turno debe registrarse entre las 08:00hs y las 17:00hs.";
                    return; // Detener la validación
                }

                /*string tiempoIngresado = TextBox7.Text;//------------------------------------------------------> Valida duracion del turno
                TimeSpan tiempo = TimeSpan.Parse(tiempoIngresado);

                TimeSpan tiempoMinimo = TimeSpan.FromHours(1);

                if (TimeSpan.Compare(tiempo, tiempoMinimo) < 0)
                {
                    // El tiempo ingresado es menor a 1 hora
                    Label5.Text = "La duración del servicio minima, no puede ser menor a 1 hora.";
                    return; // Detener la validación
                }*/
                if (DropDownList4.SelectedValue == "0")
                {
                    Label5.Text = "Debe seleccionar tiempo aprox.";
                    return;
                }
                if (DropDownList1.SelectedValue == "1008")
                {
                    Label5.Text = "Debe seleccionar una mascota .";
                    return;
                }

                if (DropDownList2.SelectedValue == "2")
                {
                    Label5.Text = "Debe seleccionar un servicio .";
                    return;
                }

                if (DropDownList3.SelectedValue == "7")
                {
                    Label5.Text = "Debe seleccionar un medio de pago .";
                    return;
                }
                else
                {
                    DSTiempoDisponible.SelectParameters["fechaTurno"].DefaultValue = TextBox1.Text;
                    DSTiempoDisponible.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro7 = (SqlDataReader)DSTiempoDisponible.Select(DataSourceSelectArguments.Empty);

                    if (registro7.Read())
                    {
                        string tiempoocupado = registro7["DuracionTotal"].ToString();
                        decimal tiempo = decimal.Parse(tiempoocupado);
                        decimal resta = 10 - tiempo;

                        string tiempoturno = DropDownList4.SelectedValue;
                        decimal duracionturno = decimal.Parse(tiempoturno);

                        if(duracionturno > resta)
                        {
                            Label5.Text = "La duracion del turno es mayor al tiempo disponible de ese dia. A esa fecha le quedan "+resta+" hs disponibles." ;
                            return;
                        }
                    }

                    //---------------
                    DSDetalleTurno.InsertParameters["importeTurno"].DefaultValue = TextBox4.Text;
                    DSDetalleTurno.InsertParameters["codigoServicio"].DefaultValue = DropDownList2.SelectedValue;
                    DSDetalleTurno.InsertParameters["observacionTurno"].DefaultValue = TextBox5.Text;
                    DSDetalleTurno.InsertParameters["duracionTurno"].DefaultValue = DropDownList4.SelectedValue;
                    //DSDetalleTurno.InsertParameters["duracionTurno"].DefaultValue = TextBox7.Text;
                    if (DSDetalleTurno.Insert() > 0)
                    {
                        DSUltReg.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registro = (SqlDataReader)DSUltReg.Select(DataSourceSelectArguments.Empty);
                        if (registro.Read())
                        {
                            cadena = registro["Expr1"].ToString();

                            string date = DateTime.Now.ToString("yyyy-MM-dd");
                            DSTurno.SelectParameters["fechaActual"].DefaultValue = date;
                            DSTurno.InsertParameters["fechaTurno"].DefaultValue = TextBox1.Text;
                            DSTurno.InsertParameters["horario"].DefaultValue = TextBox2.Text;
                            DSTurno.InsertParameters["codigoMedioPago"].DefaultValue = DropDownList3.SelectedValue;
                            DSTurno.InsertParameters["codigoDetalleTurno"].DefaultValue = cadena;
                            DSTurno.InsertParameters["codigoCliente"].DefaultValue = TextBox3.Text;
                            DSTurno.InsertParameters["codigoMascota"].DefaultValue = DropDownList1.SelectedValue;
                            DSTurno.InsertParameters["usuario"].DefaultValue = $"{Session["usuario"]}";
                            DSTurno.Insert();
                            Label5.ForeColor = System.Drawing.ColorTranslator.FromHtml("#00B300");
                            Label5.Text = "El turno fué registrado exitosamente.";

                            TextBox1.Text = "";
                            TextBox2.Text = "";
                            TextBox3.Text = "";
                            TextBox4.Text = "";
                            TextBox5.Text = "";
                            TextBox6.Text = "";
                            DropDownList1.Items.Clear();
                            DropDownList2.SelectedValue = "2";
                            DropDownList3.SelectedValue = "7";
                            DropDownList4.SelectedValue = "0";
                            Label3.Text = "";
                            Label4.Text = "";
                            Label2.Text = "";

                            Calendar1.SelectedDates.Clear();

                            DSTurno.DataSourceMode = SqlDataSourceMode.DataReader;
                            SqlDataReader registros = (SqlDataReader)DSTurno.Select(DataSourceSelectArguments.Empty);
                            Label6.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Mascota </th><th> Dueño </th><th> Servicio </th><th> Duración </th><th> Modificar </th><th> Eliminar </th>";
                            while (registros.Read())
                            {
                                Label6.Text += $"<tr><td>{registros["fecha_formato"]}</td><td>{registros["horario"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombre"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td><a href=\"ModificarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Modificar </a></td><td><a href=\"EliminarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Borrar </a></td>";

                            }
                            Label6.Text += "</table>";

                        }

                    }

                }

            }

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (TextBox8.Text != "")
            {
                Calendar1.SelectedDates.Clear();

                Label5.Text = "";
                Label7.Text = "";

                DSTurnDni.SelectParameters["codigoCliente"].DefaultValue = TextBox8.Text;
                DSTurnDni.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registros = (SqlDataReader)DSTurnDni.Select(DataSourceSelectArguments.Empty);
                Label6.Text = "<table class=\"table table-striped\"><tr><th> Fecha </th><th> Hora </th><th> Mascota </th><th> Dueño </th><th> Servicio </th><th> Duración </th><th> Modificar </th><th> Eliminar </th>";
                while (registros.Read())
                    Label6.Text += $"<tr><td>{registros["fecha"]}</td><td>{registros["horario"]}</td><td>{registros["nombreMascota"]}</td><td>{registros["nombre"]}</td><td>{registros["nombreServicio"]}</td><td>{registros["duracionTurnoConTexto"]}</td><td><a href=\"ModificarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Modificar </a></td><td><a href=\"EliminarTurno.aspx?codTurno={registros["codigoDetalleTurno"]}\"> Borrar </a></td>";

                Label6.Text += "</table>";

            }
            else
            {
                Label5.Text = "";
                Label7.Text = "Debe ingresar un DNI.";
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";
            TextBox6.Text = "";
            DropDownList1.Items.Clear();
            DropDownList2.SelectedValue = "2";
            DropDownList3.SelectedValue = "7";
            DropDownList4.SelectedValue = "0";
            Label2.Text = "";
            Label3.Text = "";
            Label4.Text = "";
            Label5.Text = "";
            Label7.Text = "";

        }

    }
}