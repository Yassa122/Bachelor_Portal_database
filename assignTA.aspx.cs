using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.InteropServices;

namespace Lastellast
{
    public partial class assignTA : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand assignTa = new SqlCommand("AssignTAs", conn);
            assignTa.CommandType = CommandType.StoredProcedure;

            int coor = Int16.Parse(coorid.Text);
            int taid = Int16.Parse(ta.Text);
            string code = proj.Text;
            
            assignTa.Parameters.Add(new SqlParameter("@coordinator_id ", coor));
            assignTa.Parameters.Add(new SqlParameter("@TA_id", taid));
            assignTa.Parameters.Add(new SqlParameter("@proj_code", code));

            conn.Open();
            assignTa.ExecuteNonQuery();
            conn.Close();
        }
    }
}