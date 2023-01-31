using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lastellast
{
    public partial class ViewUsersCoor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void details_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            String type = usertype.Text;
            int id = Int16.Parse(userid.Text);
            SqlCommand viewUsers = new SqlCommand("ViewUsers", conn);
            viewUsers.CommandType = CommandType.StoredProcedure;
            viewUsers.Parameters.Add(new SqlParameter("@User_type ", type));
            viewUsers.Parameters.Add(new SqlParameter("@User_id ", id));

            conn.Open();
            viewUsers.ExecuteNonQuery();

            string sqlquery = "select * from [dbo].[Users]";
            SqlCommand sulcomm = new SqlCommand(sqlquery, conn);

            SqlDataAdapter sda = new SqlDataAdapter(sulcomm);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            StringBuilder sb = new StringBuilder();
            sb.Append("<center>");
            sb.Append("<tr>User Table</tr>");
            sb.Append("“<tr/>");
            sb.Append("<table border=1>");
            sb.Append("<tr>");
            foreach (DataColumn dc in dt.Columns)
            {
                sb.Append("<th>");
                sb.Append(dc.ColumnName.ToUpper());
                sb.Append("</th>");

            }
            sb.Append("</tr>");

            foreach (DataRow dr in dt.Rows)
            {
                sb.Append("</tr>");
                foreach (DataColumn dc in dt.Columns)
                {

                    sb.Append("“<th>");
                    sb.Append(dr[dc.ColumnName].ToString());
                    sb.Append("</th>");

                }
                sb.Append("</tr>");
            }
            sb.Append("</table>");
            sb.Append("</center>");
            Panel1.Controls.Add(new Label { Text = sb.ToString() });
            conn.Close();

        }
    }
}
    