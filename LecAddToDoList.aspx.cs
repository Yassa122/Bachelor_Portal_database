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
    public partial class LecAddToDoList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int meetID = Int16.Parse(meetingID.Text);
            string todolist = todoList.Text;

            SqlCommand createtodolist = new SqlCommand("LecturerAddToDo", conn);
            createtodolist.CommandType = CommandType.StoredProcedure;
            createtodolist.Parameters.Add(new SqlParameter("@meeting_id", meetID));
            createtodolist.Parameters.Add(new SqlParameter("@to_do_list", todolist));

            conn.Open();
            createtodolist.ExecuteNonQuery();
            conn.Close();

        }
    }
}