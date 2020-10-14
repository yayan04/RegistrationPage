using AppRegistrationPage.Account;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppRegistrationPage
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DateTime Today = DateTime.Today;

            var mt = MonthList;
            var dt = DateList;
            var yt = YearList;

            var gd = Gender;


            if (!Page.IsPostBack)
            {
                mt.Items.Add(new ListItem { Text = "Month", Value = "-1" });
                for (int i = 1; i <= 12; i++)
                {
                    mt.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                dt.Items.Add(new ListItem { Text = "Date", Value = "-1" });
                for (int i = 1; i <= 31; i++)
                {
                    dt.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                yt.Items.Add(new ListItem { Text = "Year", Value = "-1" });
                for (int i = 1980; i <= Today.Year; i++)
                {
                    yt.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                //----------

                ListItem[] gdList = new ListItem[] {
                new ListItem("Male", "Male"),
                new ListItem("Female", "Female")
                };

                foreach (var items in gdList)
                {
                    gd.Items.Add(items);
                }

                Gender.SelectedValue = "Male";
            }

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string mNumber = MobileNumber.Text;
            string fName = FirstName.Text;
            string lName = LastName.Text;

            string Birthdate = null;
            if (YearList.SelectedValue != "-1" || MonthList.SelectedValue != "-1" || DateList.SelectedValue != "-1")
            {
                Birthdate = YearList.SelectedValue + "-" + MonthList.SelectedValue + "-" + DateList.SelectedValue;
            }

            string gender = Gender.SelectedValue;
            string email = Email.Text;

            using (var con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\DBAccount.mdf;Integrated Security=True"))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into tbAccount(MobileNumber, FirstName, LastName, BirthDate, Gender, Email) values (@mNumber, @fName, @lName, @Birthdate, @Gender, @Email)", con);
                cmd.Parameters.AddWithValue("mNumber", mNumber);
                cmd.Parameters.AddWithValue("fName", fName);
                cmd.Parameters.AddWithValue("lName", fName);

                var bd = cmd.Parameters.AddWithValue("Birthdate", Birthdate);
                if (Birthdate == null)
                    bd.Value = DBNull.Value;
                var gd = cmd.Parameters.AddWithValue("Gender", gender);
                if (gd == null)
                    gd.Value = DBNull.Value;

                cmd.Parameters.AddWithValue("Email", email);
                cmd.ExecuteNonQuery();

                MobileNumber.Text = "";
                FirstName.Text = "";
                LastName.Text = "";
                YearList.SelectedValue = "-1";
                MonthList.SelectedValue = "-1";
                DateList.SelectedValue = "-1";
                Gender.SelectedValue = "Male";
                Email.Text = "";

                divlogin.Visible = true;

                MobileNumber.Enabled = false;
                FirstName.Enabled = false;
                LastName.Enabled = false;
                YearList.Enabled = false;
                DateList.Enabled = false;
                MonthList.Enabled = false;
                Gender.Enabled = false;
                Email.Enabled = false;
                Register.Enabled = false;
            }
        }

        protected void MobileNumber_TextChanged(object sender, EventArgs e)
        {

        }
    }
}