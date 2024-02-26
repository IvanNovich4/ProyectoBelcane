using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class EliminarUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string codigo = Request.QueryString["codigo"];
            DSUsuarios.DeleteParameters["codigo"].DefaultValue = codigo;
            DSUsuarios.Delete();
            Response.Redirect("AdministracionUsuarios.aspx");
        }
    }
}