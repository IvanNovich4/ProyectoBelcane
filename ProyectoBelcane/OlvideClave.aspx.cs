using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class OlvideClave : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "")
                Label1.Text = "Debe completar todos los campos ";
            else
            {
                DSUsuarios.SelectParameters["nombre"].DefaultValue = TextBox1.Text;
                DSUsuarios.SelectParameters["mail"].DefaultValue = TextBox2.Text;
                DSUsuarios.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSUsuarios.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    Random r = new Random();
                    int aleatorio = r.Next(10000000, 99999999);

                    DSUsuarios.UpdateParameters["nombre"].DefaultValue = TextBox1.Text;
                    DSUsuarios.UpdateParameters["clave"].DefaultValue = aleatorio.ToString();
                    DSUsuarios.Update();

                    try
                    {
                        MailMessage mail = new MailMessage();
                        mail.To.Add(TextBox2.Text.ToString());
                        mail.From = new MailAddress("belcane.peluqueria.canina@hotmail.com");
                        mail.Subject = "Recuperacion de Contraseña - Peluquería BelCane".ToString();
                        mail.Body = "Debe usar "+aleatorio+ " como clave de ingreso a la cuenta.<br><br> Una vez ingresado, realice el cambio de la misma".ToString();
                        SmtpClient smtp = new SmtpClient();
                        smtp.Host = "smtp.office365.com";
                        smtp.Port = 587;
                        smtp.UseDefaultCredentials = false;
                        smtp.Credentials = new System.Net.NetworkCredential("belcane.peluqueria.canina@hotmail.com","123Belcane123");
                        smtp.EnableSsl = true;

                        smtp.Send(mail);
                    }
                    catch (Exception)
                    {
                        
                    }

                    Label1.Text = "la recuperacion de clave fue exitosa ! , por favor revise su casilla de correo";
                }
                else
                {
                    Label1.Text = "no existe un correo " + TextBox2.Text + " para dicho usuario";
                }
            }

        }
    }
}