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
    public partial class ViewMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            int id = Int16.Parse(lecid.Text);
            int meetingid = Int16.Parse(meetid.Text);

            SqlCommand viewmeet = new SqlCommand("LecturerCreateLocalProject", conn);
            viewmeet.CommandType = CommandType.StoredProcedure;

            viewmeet.Parameters.Add(new SqlParameter("@Lecturer_id", id));
            viewmeet.Parameters.Add(new SqlParameter("@meeting_id", meetingid));

            //how to view the output...

            SqlDataReader rdr = viewmeet.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String meetid = rdr.GetString(rdr.GetOrdinal("meeting_id"));
                //creating a lable to put the names in it 
                Label l = new Label();
                l.Text = meetid + ",\n";
                //add lable to the form of this page
                form1.Controls.Add(l);
            }
            Response.Write(Session["user"]);
        }
    }
}