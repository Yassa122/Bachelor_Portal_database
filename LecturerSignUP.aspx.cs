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
    public partial class LecturerSignUP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String user = username.Text;
            String phonee = phone.Text;
            String emaill = email.Text;

            SqlCommand lecsignup = new SqlCommand("UserRegister", conn);
            lecsignup.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            lecsignup.Parameters.Add(new SqlParameter("@userName", user));
            lecsignup.Parameters.Add(new SqlParameter("@phone_number", phonee));
            lecsignup.Parameters.Add(new SqlParameter("@email", emaill));
            lecsignup.Parameters.Add(new SqlParameter("@usertype", "Lecturer"));
            lecsignup.Parameters.Add(new SqlParameter("@first_name", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@last_name", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@birth_date", d));
            lecsignup.Parameters.Add(new SqlParameter("@GPA", dd));
            lecsignup.Parameters.Add(new SqlParameter("@semester", ii));
            lecsignup.Parameters.Add(new SqlParameter("@adress", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@faculty_code", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@major_code", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@company_name", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@representative_name", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@representative_email", "null"));
            lecsignup.Parameters.Add(new SqlParameter("@country_of_residence", "null"));

            SqlParameter passwordd = lecsignup.Parameters.Add(new SqlParameter("@passwordd", SqlDbType.VarChar,10));
            SqlParameter id = lecsignup.Parameters.Add(new SqlParameter("@userid", SqlDbType.Int));
            passwordd.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;



            
                conn.Open();
                lecsignup.ExecuteNonQuery();
            
            conn.Close();
            Response.Write(id);
            Response.Write(passwordd);
            Response.Redirect("Login.aspx");

        }
    }
}