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
    public partial class StudentSignUp : System.Web.UI.Page
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
            String firstnamee = firstname.Text;
            String secondnamee = lastname.Text;
            int major = Int16.Parse(majorcode.Text);
            DateTime dt = DateTime.Parse(dob.Text);
            SqlCommand Studentsignup = new SqlCommand("UserRegister", conn);
            Studentsignup.CommandType = CommandType.StoredProcedure;
            String addresss = address.Text;
            int gpaa = Int16.Parse(gpa.Text);
            Decimal dd = new Decimal(0.1);
            int semesterr = Int16.Parse(semster.Text);
            Studentsignup.Parameters.Add(new SqlParameter("@userName", user));
            Studentsignup.Parameters.Add(new SqlParameter("@phone_number", phonee));
            Studentsignup.Parameters.Add(new SqlParameter("@email", emaill));
            Studentsignup.Parameters.Add(new SqlParameter("@usertype", "Student"));
            Studentsignup.Parameters.Add(new SqlParameter("@first_name", firstnamee));
            Studentsignup.Parameters.Add(new SqlParameter("@last_name", secondnamee));
            Studentsignup.Parameters.Add(new SqlParameter("@birth_date", dt));
            Studentsignup.Parameters.Add(new SqlParameter("@GPA", gpaa));
            Studentsignup.Parameters.Add(new SqlParameter("@semester", semesterr));
            Studentsignup.Parameters.Add(new SqlParameter("@adress", addresss));
            Studentsignup.Parameters.Add(new SqlParameter("@faculty_code", "null"));
            Studentsignup.Parameters.Add(new SqlParameter("@major_code", major));
            Studentsignup.Parameters.Add(new SqlParameter("@company_name", "null"));
            Studentsignup.Parameters.Add(new SqlParameter("@representative_name", "null"));
            Studentsignup.Parameters.Add(new SqlParameter("@representative_email", "null"));
            Studentsignup.Parameters.Add(new SqlParameter("@country_of_residence", "null"));

            SqlParameter passwordd = Studentsignup.Parameters.Add(new SqlParameter("@passwordd", SqlDbType.VarChar, 10));
            SqlParameter id = Studentsignup.Parameters.Add(new SqlParameter("@userid", SqlDbType.Int));
            passwordd.Direction = ParameterDirection.Output;
            id.Direction = ParameterDirection.Output;




            conn.Open();
            Studentsignup.ExecuteNonQuery();

            conn.Close();
            Response.Write(id);
            Response.Write(passwordd);
            Response.Redirect("StudentLogin.aspx");
        }
    }
}