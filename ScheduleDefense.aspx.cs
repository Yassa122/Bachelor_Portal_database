using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lastellast
{
    public partial class ScheduleDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand schedule = new SqlCommand("ScheduleDefense", conn);
            schedule.CommandType = CommandType.StoredProcedure;

            String studid = sid.Text;
            DateTime d = Convert.ToDateTime(datee.Text);
            String t = timee.Text; 
            String locationn = loc.Text;


            schedule.Parameters.Add(new SqlParameter("@sid ", studid));
            schedule.Parameters.Add(new SqlParameter("@date", d));
            schedule.Parameters.Add(new SqlParameter("@time", t));
            schedule.Parameters.Add(new SqlParameter("@location", locationn));

            conn.Open();
            schedule.ExecuteNonQuery();
            conn.Close();
        }
    }
}