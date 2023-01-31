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
    public partial class ComapnySignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["test"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String namee = name.Text;
            String rnamee = rname.Text;
            String remaill = remail.Text;
            String locationn = location.Text;

            SqlCommand companySignUp = new SqlCommand("UserRegister", conn);
            companySignUp.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            companySignUp.Parameters.Add(new SqlParameter("@userName", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@phone_number", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@email", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@usertype", "Company"));
            companySignUp.Parameters.Add(new SqlParameter("@first_name", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@last_name", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@birth_date", d));
            companySignUp.Parameters.Add(new SqlParameter("@GPA", dd));
            companySignUp.Parameters.Add(new SqlParameter("@semester", ii));
            companySignUp.Parameters.Add(new SqlParameter("@adress", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@faculty_code", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@major_code", "null"));
            companySignUp.Parameters.Add(new SqlParameter("@company_name", namee));
            companySignUp.Parameters.Add(new SqlParameter("@representative_name", rnamee));
            companySignUp.Parameters.Add(new SqlParameter("@representative_email", remaill));
            companySignUp.Parameters.Add(new SqlParameter("@country_of_residence", locationn));

            SqlParameter passwordd = companySignUp.Parameters.Add(new SqlParameter("@passwordd", SqlDbType.VarChar, 10));
            SqlParameter id = companySignUp.Parameters.Add(new SqlParameter("@userid", SqlDbType.Int));
            passwordd.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;




            conn.Open();
            companySignUp.ExecuteNonQuery();

            conn.Close();
            Response.Write(id);
            Response.Write(passwordd);
            Response.Redirect("CompanyLogin.aspx");

        }
    }
}