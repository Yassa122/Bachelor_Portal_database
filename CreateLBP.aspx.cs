using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace marco
{
    public partial class CreateLBP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateProj(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(lecid.Text);
            int code = Int16.Parse(ProjCode.Text);
            int majorCode = Int16.Parse(majorcode.Text);
            String title = Title.Text;
            String description = Description.Text;

            SqlCommand createLBP = new SqlCommand("LecturerCreateLocalProject", conn);
            createLBP.CommandType = CommandType.StoredProcedure;

            createLBP.Parameters.Add(new SqlParameter("@proj_code", code));
            createLBP.Parameters.Add(new SqlParameter("@title", title));
            createLBP.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            createLBP.Parameters.Add(new SqlParameter("@description", description));
            createLBP.Parameters.Add(new SqlParameter("@major_code", majorCode));


            try
            {
                conn.Open();
                createLBP.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("there was an issue!");
            }

        }
    }
}