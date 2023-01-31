using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace marco
{
    public partial class CreateMeeting2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int lecidd = Int16.Parse(lecid.Text);
            //fix this.
            DateTime startT = DateTime.Parse(meetET.Text);
            DateTime endT = DateTime.Parse(meetST.Text);
            DateTime date = DateTime.Parse(meetingp0.Text);
            String meetingP = meetingp.Text;

            SqlCommand CreateMeeting = new SqlCommand("CreateMeeting", conn);
            CreateMeeting.CommandType = CommandType.StoredProcedure;
            CreateMeeting.Parameters.Add(new SqlParameter("@Lecturer_id", lecid));
            CreateMeeting.Parameters.Add(new SqlParameter("@start_time", startT));
            CreateMeeting.Parameters.Add(new SqlParameter("@end_time", endT));
            CreateMeeting.Parameters.Add(new SqlParameter("@datee", date));
            CreateMeeting.Parameters.Add(new SqlParameter("@meeting_point", meetingP));


            conn.Open();
            CreateMeeting.ExecuteNonQuery();
            conn.Close();
        }
    }
}