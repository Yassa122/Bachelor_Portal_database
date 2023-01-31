using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace marco
{
    public partial class ViewMyProgressReports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int s_id = Int16.Parse(SID.Text);
            DateTime date1 = DateTime.Parse(datee.Text);

            SqlCommand lecsignup = new SqlCommand("ViewMyProgressReports", conn);
            lecsignup.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            lecsignup.Parameters.Add(new SqlParameter("@s_id", s_id));
            lecsignup.Parameters.Add(new SqlParameter("@datee", date1));




            conn.Open();
            lecsignup.ExecuteNonQuery();

            conn.Close();
            Response.Write("done");

        }
    }
}