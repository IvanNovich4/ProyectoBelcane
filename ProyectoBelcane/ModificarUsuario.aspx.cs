using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ModificarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nombreusuario = Request.QueryString["nombre"];
                TextBox1.Text = nombreusuario;

                DSUsuarios.SelectParameters["nombre"].DefaultValue = TextBox1.Text;
                DSUsuarios.DataSourceMode = SqlDataSourceMode.DataReader;
                SqlDataReader registro = (SqlDataReader)DSUsuarios.Select(DataSourceSelectArguments.Empty);
                if (registro.Read())
                {
                    TextBox2.Text = registro["clave"].ToString();
                    TextBox3.Text = registro["mail"].ToString();
                    DropDownList1.SelectedValue = registro["permisos"].ToString();
                }
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionUsuarios.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DSUsuarios.UpdateParameters["nombre"].DefaultValue = TextBox1.Text;
            DSUsuarios.UpdateParameters["clave"].DefaultValue = TextBox2.Text;
            DSUsuarios.UpdateParameters["mail"].DefaultValue = TextBox3.Text;
            DSUsuarios.UpdateParameters["permisos"].DefaultValue = DropDownList1.SelectedValue;
            int cant = DSUsuarios.Update();
            if (cant == 1)
                Response.Redirect("AdministracionUsuarios.aspx");            
                
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdministracionUsuarios.aspx");
        }
    }
}