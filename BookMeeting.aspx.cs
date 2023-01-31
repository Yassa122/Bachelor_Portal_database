using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class BookMeeting : System.Web.UI.Page
    {
        protected void Submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int s_id = Int16.Parse(SID.Text);
            int meeting_id = Int16.Parse(MID.Text);
            SqlCommand lecsignup = new SqlCommand("BookMeeting", conn);
            lecsignup.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            lecsignup.Parameters.Add(new SqlParameter("@s_id", SID));
            lecsignup.Parameters.Add(new SqlParameter("@meeting_id", MID));




            conn.Open();
            lecsignup.ExecuteNonQuery();

            conn.Close();
            Response.Write("done");

        }
    }
}