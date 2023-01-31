using marco.Models;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace marco.Models
{
    public partial class AddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}using System;
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
            String email = Email.Text;
            String name = Name.Text;
            Int phone = int16.parse(Phone.text);

            String field = field.Text;
            Int staff = int16.parse(staff_id.text);
            Int pass = int16.parse(pass.text);




            SqlCommand lecsignup = new SqlCommand("UserRegister", conn);
            lecsignup.CommandType = CommandType.StoredProcedure;

            DateTime d = new DateTime(1753, 1, 1, 12, 0, 0);
            Decimal dd = new Decimal(0.1);
            int ii = 0;
            AddEmployee
   .Parameters.Add(new SqlParameter("@CompanyID", user));
            AddEmployee
        .Parameters.Add(new SqlParameter("@email", Email));
            AddEmployee
      .Parameters.Add(new SqlParameter("    @name ", Name));

            AddEmployee
      .Parameters.Add(new SqlParameter("  @phone_number “, "Phone"));
      
           AddEmployee
      .Parameters.Add(new SqlParameter(" @field ", “field”));
            AddEmployee
.Parameters.Add(new SqlParameter("    @StaffID", “staff_id”));
            AddEmployee
  .Parameters.Add(new SqlParameter("@password", pass));
            AddEmployee







                conn.Open();
            AddEmplyee.ExecuteNonQuery();

            conn.Close();
            Response.Write(id);
            Response.Write(passwordd);
            Response.Redirect("Login.aspx");

        }
    }
}