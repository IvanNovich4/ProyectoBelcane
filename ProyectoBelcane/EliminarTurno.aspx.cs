using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class EliminarTurno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // 1° eliminar turno  y 2° eliminar detalle del turno
            string codigo = Request.QueryString["codTurno"];
            DSTurno.DeleteParameters["codigoDetalleTurno"].DefaultValue = codigo;
            if (DSTurno.Delete()>0)
            {
                DSDetalle.DeleteParameters["idDetalleTurno"].DefaultValue = codigo;
                if (DSDetalle.Delete() > 0)
                {                                 
                Response.Redirect("AdministracionCalendario.aspx");
                }

            }
            

        }
    }
}