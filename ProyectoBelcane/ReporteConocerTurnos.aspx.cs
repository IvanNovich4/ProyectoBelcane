using Microsoft.Data.SqlClient;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoBelcane
{
    public partial class ReporteConocerTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //SqlConnection con = new SqlConnection(@"Data Source=ivanoski;Initial Catalog=bd1;Integrated Security=True;Pooling=True;Min Pool Size=0;Max Pool Size=10024");
        protected void Button1_Click(object sender, EventArgs e)
        {
            /*SqlCommand c = new SqlCommand("Select * from turnos",con );
            SqlDataAdapter s = new SqlDataAdapter(c);
            DataTable dt = new DataTable();
            s.Fill(dt);

            ReportViewer1.LocalReport.DataSources.Clear();
            ReportDataSource rds = new ReportDataSource("DataSet2",dt);
            ReportViewer1.LocalReport.ReportPath = Server.MapPath("ReporteTurnos.rdlc");
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();*/
        }
    }
}   