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
    public partial class EEGradeDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gra_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["farah"].ToString();
            //create a new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand EEDefense = new SqlCommand("EEGradedefense", conn);
            EEDefense.CommandType = CommandType.StoredProcedure;

            int EE_id = Int16.Parse(eeid.Text);
            int sid = Int16.Parse(sidd.Text);
            String loc = dl.Text;
            Decimal EE_Grade = Decimal.Parse(eeg.Text);




            EEDefense.Parameters.Add(new SqlParameter("@EE_id", EE_id));
            EEDefense.Parameters.Add(new SqlParameter("@sid", sid));
            EEDefense.Parameters.Add(new SqlParameter("@defense_location", loc));
            EEDefense.Parameters.Add(new SqlParameter("@EE_grade", EE_Grade));

            conn.Open();
            EEDefense.ExecuteNonQuery();
            conn.Close();
        }
    }
}