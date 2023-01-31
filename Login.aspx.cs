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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String email = emaill.Text;
            String password = passwordd.Text;

            SqlCommand loginn = new SqlCommand("UserLogin", conn);
            loginn.CommandType = CommandType.StoredProcedure;
            loginn.Parameters.Add(new SqlParameter("@email", email));
            loginn.Parameters.Add(new SqlParameter("@password", password));

            SqlParameter success = loginn.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter userid = loginn.Parameters.Add("@user_id", SqlDbType.Int);

            success.Direction = ParameterDirection.Output;
            userid.Direction = ParameterDirection.Output;

                conn.Open();
                loginn.ExecuteNonQuery();
 
            if (success.Value.ToString() == "1")
            {
                Response.Write("hello");
                Response.Redirect("LecturePage.aspx");
            }
            else
                Response.Write("error");


        }
    }
}