using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class AltaUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
                Label1.Text = "Debe completar todos los campos ";
            else
            {
                DSUsuarios.InsertParameters["nombre"].DefaultValue = TextBox1.Text;
                DSUsuarios.InsertParameters["clave"].DefaultValue = TextBox2.Text;
                DSUsuarios.InsertParameters["mail"].DefaultValue = TextBox3.Text;
                DSUsuarios.InsertParameters["permisos"].DefaultValue = DropDownList1.SelectedValue;
                DSUsuarios.Insert();
                Response.Redirect("AdministracionUsuarios.aspx");
            }
            
                
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionUsuarios.aspx");
        }

        protected void DSUsuarios_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionUsuarios.aspx");
        }
    }
}