using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lastellast
{
    public partial class Assignee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {   

            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand assign = new SqlCommand("AssignEE", conn);
            assign.CommandType = CommandType.StoredProcedure;

            String cid = Coordinatorid.Text;
            String eid = eeid.Text;
            string pcode = projcode.Text;
            
            assign.Parameters.Add(new SqlParameter("@coordinator_id ", cid));
            assign.Parameters.Add(new SqlParameter("@EE_id", eid));
            assign.Parameters.Add(new SqlParameter("@proj_code", pcode));

            conn.Open();
            assign.ExecuteNonQuery();
            conn.Close();
        }
    }
}