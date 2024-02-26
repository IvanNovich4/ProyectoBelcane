using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class EliminarMascota : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            string codigo = Request.QueryString["codMasc"];
            DSMascotas.DeleteParameters["idMascota"].DefaultValue = codigo;
            DSMascotas.Delete();
            Response.Redirect("ConsultaMascota.aspx");
        }
    }
}