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
    public partial class ModificarTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string cadena = Request.QueryString["codTurno"];
                string cliente = "";

                DSDetalle.SelectParameters["idDetalleTurno"].DefaultValue = cadena;
                DSDetalle.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSDetalle.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    TextBox4.Text = registro["importeTurno"].ToString();
                    DropDownList2.SelectedValue = registro["codigoServicio"].ToString();
                    TextBox5.Text = registro["observacionTurno"].ToString();
                    DropDownList1.SelectedValue = registro["duracionTurno"].ToString();
                    Label9.Text= registro["duracionTurno"].ToString();

                    DSTurnos.SelectParameters["codigoDetalleTurno"].DefaultValue = cadena;
                    DSTurnos.DataSourceMode = SqlDataSourceMode.DataReader;
                    SqlDataReader registro1 = (SqlDataReader)DSTurnos.Select(DataSourceSelectArguments.Empty);
                    if (registro1.Read())
                    {
                        cliente = registro1["codigoCliente"].ToString();
                        TextBox1.Text = Convert.ToDateTime(registro1["fechaTurno"]).ToString("yyyy-MM-dd");                        
                        TextBox2.Text = registro1["horario"].ToString();
                        Label7.Text = registro1["nombre"].ToString()+" "+ registro1["apellido"].ToString();

                        DSMascotas.SelectParameters["codigoDueño"].DefaultValue = cliente;
                        DSMascotas.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registro2 = (SqlDataReader)DSMascotas.Select(DataSourceSelectArguments.Empty);
                        registro2.Read();

                        Label6.Text = cliente;

                        DropDownList4.SelectedValue = registro1["codigoMascota"].ToString();
                        DropDownList3.SelectedValue = registro1["codigoMedioPago"].ToString();

                        DSMasc2.SelectParameters["idMascota"].DefaultValue = registro1["codigoMascota"].ToString();
                        DSMasc2.DataSourceMode = SqlDataSourceMode.DataReader;
                        SqlDataReader registro3 = (SqlDataReader)DSMasc2.Select(DataSourceSelectArguments.Empty);
                        registro3.Read();

                        Label3.Text = registro3["nombreRaza"].ToString();
                        Label4.Text = registro3["nombreTamaño"].ToString();

                    }
                }

            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionCalendario.aspx");
        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            DSMasc2.SelectParameters["idMascota"].DefaultValue = DropDownList4.SelectedValue;
            DSMasc2.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro3 = (SqlDataReader)DSMasc2.Select(DataSourceSelectArguments.Empty);
            registro3.Read();

            Label3.Text = registro3["nombreRaza"].ToString();
            Label4.Text = registro3["nombreTamaño"].ToString();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string cadena = Request.QueryString["codTurno"];
            this.Label8.ForeColor = System.Drawing.ColorTranslator.FromHtml("#FF6600");
            if (TextBox1.Text == "")
            {
                Label8.Text = "Debe Seleccionar una fecha";
                return;
            }
            if (DropDownList2.SelectedValue == "2")
            {
                Label8.Text = "Debe Seleccionar un Servicio";
                return;
            }  
            if(DropDownList1.SelectedValue == "0")
            {
                Label8.Text = "Debe cargar una duración aprox.";
                return;
            }
            if (TextBox4.Text == "")
            {
                Label8.Text = "Debe asignarle un importe al turno.";
                return;
            }
            if (DropDownList3.SelectedValue == "7")
            {
                Label8.Text = "Debe Seleccionar un medio de pago.";
                return;
            }
            string fechaIngresada = TextBox1.Text;//--------------------------------------------------> Valida la fecha no puede ser menor o igual a la actual
            DateTime fecha = DateTime.Parse(fechaIngresada);

            DateTime fechaActual = DateTime.Today;

            if (DateTime.Compare(fecha, fechaActual) <= 0)
            {
                // La fecha ingresada es igual o menor a la fecha actual
                Label8.Text = "La fecha del Turno debe ser mayor a la fecha actual.";
                return; // Detener la validación
            }

            string tiempoIngresado1 = TextBox2.Text;//------------------------------------------------------> Valida rango horario del turno
            TimeSpan tiempo1 = TimeSpan.Parse(tiempoIngresado1);

            TimeSpan limiteInferior = new TimeSpan(8, 0, 0); // 08:00
            TimeSpan limiteSuperior = new TimeSpan(17, 0, 0); // 18:00

            if (TimeSpan.Compare(tiempo1, limiteInferior) < 0 || TimeSpan.Compare(tiempo1, limiteSuperior) > 0)
            {
                // El tiempo ingresado está fuera del rango permitido
                Label8.Text = "El turno debe registrarse entre las 08:00hs y las 17:00hs.";
                return; // Detener la validación
            }

            DSTiempoDisponible.SelectParameters["fechaTurno"].DefaultValue = TextBox1.Text;
            DSTiempoDisponible.DataSourceMode = SqlDataSourceMode.DataReader;
            SqlDataReader registro7 = (SqlDataReader)DSTiempoDisponible.Select(DataSourceSelectArguments.Empty);

            if (registro7.Read())
            {
                string tiempoocupado = registro7["DuracionTotal"].ToString();//recupero tiempo ocupado de dia
                decimal tiempo = decimal.Parse(tiempoocupado);
                decimal resta = 10 - tiempo;//tiempo sobrante o disponible

                string tiempoturno = DropDownList1.SelectedValue;//nuevo tiempo que quiero asignar al turno
                decimal nuevaduracionturno = decimal.Parse(tiempoturno);

                string tiempoanterior = Label9.Text;//duracion del turno anterior
                decimal duracionanterior = decimal.Parse(tiempoanterior);

                decimal calculo = tiempo - duracionanterior;
                
                decimal suma = calculo + nuevaduracionturno;
                
                if (suma>10)
                {
                    Label8.Text = "La nueva duracion del turno es mayor al tiempo disponible de ese dia. A esa fecha le quedan " + resta + " hs disponibles.";
                    return;
                }
            }

            DSTurnos.UpdateParameters["codigoDetalleTurno"].DefaultValue = cadena;
            DSTurnos.UpdateParameters["fechaTurno"].DefaultValue = TextBox1.Text;
            DSTurnos.UpdateParameters["horario"].DefaultValue = TextBox2.Text;
            DSTurnos.UpdateParameters["codigoMedioPago"].DefaultValue = DropDownList3.SelectedValue;
            DSTurnos.UpdateParameters["codigoMascota"].DefaultValue = DropDownList4.SelectedValue;
            if (DSTurnos.Update() > 0)
            {
                DSDetalle.UpdateParameters["idDetalleTurno"].DefaultValue = cadena;
                DSDetalle.UpdateParameters["importeTurno"].DefaultValue = TextBox4.Text;
                DSDetalle.UpdateParameters["codigoServicio"].DefaultValue = DropDownList2.SelectedValue;
                DSDetalle.UpdateParameters["observacionTurno"].DefaultValue = TextBox5.Text;
                DSDetalle.UpdateParameters["duracionTurno"].DefaultValue = DropDownList1.SelectedValue;
                if (DSDetalle.Update() > 0)
                {
                    Label8.ForeColor = Color.Black;
                    Label8.Text = "Se modificó el turno correctamente";
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionCalendario.aspx");
        }
    }
}