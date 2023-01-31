using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;

namespace Lastellast
{
    public partial class TACreatePR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();

            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand createpr = new SqlCommand("TACreatePR", conn);
            createpr.CommandType = CommandType.StoredProcedure;

            int ttid = Int16.Parse(tid.Text);
            int sidd = Int16.Parse(sid.Text);
            DateTime date = Convert.ToDateTime( dt.Text);
            String content = ct.Text;



            createpr.Parameters.Add(new SqlParameter("@TA_id ", ttid));
            createpr.Parameters.Add(new SqlParameter("@sid", sidd));
            createpr.Parameters.Add(new SqlParameter("@date", date));
            createpr.Parameters.Add(new SqlParameter("@content", content));

            conn.Open();
            createpr.ExecuteNonQuery();
            conn.Close();

        }
    }
}