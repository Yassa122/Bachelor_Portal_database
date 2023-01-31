using marco.Models;
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
            Int company = int16.parse(company_id.text);
            Int proj_code = int16.parse(proj_code.text);
            String title = title.Text;
            String title = title.Text;
            Int major = int16.parse(major_code.text);







            SqlCommand lecsignup = new SqlCommand("UserRegister", conn);
            lecsignup.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            AddEmployee
   .Parameters.Add(new SqlParameter("@company_id", company_id));
            AddEmployee
        .Parameters.Add(new SqlParameter("@proj_code", proj_code));
            AddEmployee
      .Parameters.Add(new SqlParameter("    @title ", title));

            AddEmployee
      .Parameters.Add(new SqlParameter("  @title “, "title"));
      
           AddEmployee
      .Parameters.Add(new SqlParameter(" @major_code ", “major_code”));





            conn.Open();
            AddEmplyee.ExecuteNonQuery();

            conn.Close();
            Response.Write(id);
            Response.Write(passwordd);
            Response.Redirect("Login.aspx");

        }
    }
}