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
using System.Web.Management;

namespace Lastellast
{
    public partial class EEGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gra_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand EEGrade = new SqlCommand("EEGradeThesis", conn);
            EEGrade.CommandType = CommandType.StoredProcedure;

            int EE_id = Int16.Parse(eeid.Text);
            int sid = Int16.Parse(sidd.Text);
            String title = tt.Text;
            Decimal EE_Grade = Decimal.Parse(eeg.Text);
           



            EEGrade.Parameters.Add(new SqlParameter("@EE_id", EE_id));
            EEGrade.Parameters.Add(new SqlParameter("@sid", sid));
            EEGrade.Parameters.Add(new SqlParameter("@thesis_title", title));
            EEGrade.Parameters.Add(new SqlParameter("@EE_grade", EE_Grade));

            conn.Open();
            EEGrade.ExecuteNonQuery();
            conn.Close();
        }
    }
}