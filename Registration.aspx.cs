using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;
using System.Web.UI.WebControls.WebParts;
using TextBox = System.Web.UI.WebControls.TextBox;
using Label = System.Web.UI.WebControls.Label;
using System.Drawing;

/*          
 password and confirm password

 */

namespace WebApplication2
{
    public partial class Registration : System.Web.UI.Page
    {
        private const string V = "city_code";
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s ; Database = Demo; Integrated Security =  false;");
        SqlCommand cmd;
        string message, query;
        SqlDataReader dr;
        string gender_var;
        


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Abccc();
            }
        }
        public void Abccc()
        {
            string query = "SELECT * FROM User_city";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            da.Fill(ds);
            city_options.DataSource = ds;
            city_options.DataTextField = "CITY_NAME";
            city_options.DataValueField = "CITY_CODE";
            city_options.DataBind();
            city_options.Items.Insert(0,"--Select--");

        }


        protected void radio_male_CheckedChanged(object sender, EventArgs e)
        {
            if (radio_male.Checked)
            {
                
                gender_var = "MALE";
               
               
            }
        }

        protected void radio_female_CheckedChanged(object sender, EventArgs e)
        {
            if (radio_female.Checked)
            {
               
                gender_var = "FEMALE";
             
            }
        }

        protected void radio_other_CheckedChanged(object sender, EventArgs e)
        {
            if (radio_other.Checked)
            {
               
                gender_var = "OTHER";
              
            }
            
        }

        //public void Abc()
        //{
        //    string query = "SELECT CITY, CITY_CODE FROM User_data";
        //    cmd = new SqlCommand(query, con);
        //    SqlDataAdapter da = new SqlDataAdapter(cmd);
        //    DataSet ds = new DataSet();
        //    da.Fill(ds);
        //    city_options.DataSource = ds.Tables[0];
        //    city_options.DataTextField = "CITY";
        //    city_options.DataValueField = "CITY_CODE";

        //    city_options.DataBind();
        //}


        protected void register_btn_Click(object sender, EventArgs e)
        {
            
            string f_name = txt_fname.Text;
            string l_name = txt_lname.Text;
            string user_name = txt_uname.Text;
            string email = txt_email.Text;
            string password = txt_password.Text;
            long mobile = long.Parse(txt_mobile.Text);
            //string gender = gender_var;
            string gender = "";

            if (radio_female.Checked)    gender = "FEMALE";
          
            else if (radio_male.Checked)  gender = "MALE";
            
            else if (radio_other.Checked)  gender = "OTHERS";
            
            else
            {
                Label gender_error = new Label();
                gender_error.Text = "Gender not selected";
                gender_error.ForeColor = Color.Red;
                gender_message.Controls.Add(gender_error);
            }

            //MessageBox.Show("gender " + gender);

            //for city and city code


            //int city_code = int.Parse(Label1.Text);
            //string city = city_options.DataTextField;

            int city_code = int.Parse(Label1.Text);
            string city = city_options.SelectedItem.ToString();


            

            con.Open();

            //string query = "SELECT * FROM User_city";
            //cmd = new SqlCommand(query, con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds);
            //string city = "";
            ////string city = city_options.Text;
            //int city_code = int.Parse(Label1.Text);

            //DataRow[] drCityName = ds.Tables[0].Select("CITY_CODE='" + city_code + "'");
            //if (drCityName.Count() > 0) { city = drCityName[0]["CITY_NAME"].ToString(); }


            SqlCommand cmd1 = new SqlCommand(query, con);
            cmd1 = new SqlCommand("user_insert '" + f_name + "' , '" + l_name + "' , '" + user_name + "' , '" + email +
                "' , '" + password + "' , " + mobile + " , '" + gender + "' , '" + city + "' , " + city_code, con);
            cmd1.ExecuteNonQuery();


            con.Close();
            MessageBox.Show("Registered Succcessfully");
            Response.Redirect("Login.aspx");



            //string city_name = city_options.SelectedValue;
            //query = "SELECT CITY_CODE from User_city WHERE CITY_name = '" + city + "'";

            //cmd = new SqlCommand(query, con);
            ////DataTable dt = new DataTable();
            ////SqlDataAdapter da = new SqlDataAdapter();
            ////da.Fill(dt);
            //city_code = (int)cmd.ExecuteNonQuery();

            //MessageBox.Show("City code " + city_code);



            //if (f_name == "" || l_name == "" || user_name == "" || email == "" || password == "" || mobile == "" || gender == "" || city == "")
            //{
            //    MessageBox.Show("enter all the details");
            //}

            //else
            //{
            //CheckUserName();
            //CheckEmail();
            //CheckMobile();
            // city_code = 

            //  MessageBox.Show("city code " + city_code);




            //}





        }

        //protected void txt_uname_TextChanged(object sender, EventArgs e)
        //{

        //}

        public void CheckUserName()
        {
            string u_name = txt_uname.Text;
            
            con.Open();
            query = "SELECT * FROM User_data WHERE USERNAME = '" + u_name + "'";

            cmd = new SqlCommand(query, con);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                dr.Close();
                Label uname_message_label = new Label();
                uname_message_label.Text= "This Username is already taken";
                uname_message_label.ForeColor = Color.Red;
                uname_message.Controls.Add(uname_message_label);

            }
            else
            {
                dr.Close();
                Label uname_message_label = new Label();
                uname_message_label.Text = "This Username is available";
                uname_message_label.ForeColor = Color.DarkGreen;
                uname_message.Controls.Add(uname_message_label);
            }
            con.Close();
        }


        public void CheckEmail()
        {
            string email = txt_email.Text;

            con.Open();
            query = "select * from user_data where email = '" + email + "'";

            cmd = new SqlCommand(query, con);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                dr.Close();
                Label email_error = new Label();
                email_error.Text = "This Email is already registered";
                email_error.ForeColor = Color.Red;
                email_message.Controls.Add(email_error);

            }
            con.Close();
        }

        public void CheckMobile()
        {

            long mobile = long.Parse(txt_mobile.Text);


            query = "select * from user_data where mobile_no = " + mobile + "";
            con.Open();
            cmd = new SqlCommand(query, con);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                dr.Close();
                Label mobile_error = new Label();
                mobile_error.Text = "this mobile no. is already registered";
                mobile_error.ForeColor = Color.Red;
                mobile_message.Controls.Add(mobile_error);

            }
            con.Close();
        }

        public void PasswordMatch()
        {
            string pass = txt_password.Text;
            string confirm_pass = txt_confirmpass.Text;

            if (pass == confirm_pass)
            {
                Label pass_message = new Label();
                pass_message.Text = "Password Matched";
                pass_message.ForeColor = Color.DarkGreen;
                confirmPass_message.Controls.Add(pass_message);

            }
            else 
            {
                Label pass_message = new Label();
                pass_message.Text = "Password does not match";
                pass_message.ForeColor = Color.Red;
                confirmPass_message.Controls.Add(pass_message);

            }


        }

        protected void txt_confirmpass_TextChanged(object sender, EventArgs e)
        {
            PasswordMatch();
        }

        protected void txt_uname_TextChanged(object sender, EventArgs e)
        {
            CheckUserName();
            
        }

        protected void txt_email_TextChanged(object sender, EventArgs e)
        {
            CheckEmail();
        }

        protected void txt_mobile_TextChanged(object sender, EventArgs e)
        {
            CheckMobile();
        }

        protected void city_options_SelectedIndexChanged(object sender, EventArgs e)
        {
            Label1.Text= city_options.SelectedValue;
        }




        //public int AssignCityCode()
        //{
        //    string city = city_options.SelectedValue;
        //    query = "SELECT CITY_CODE from User_city WHERE CITY_name = '" + city+"'";
        //    con.Open();
        //    cmd = new SqlCommand(query, con);
        //    //DataTable dt = new DataTable();
        //    //SqlDataAdapter da = new SqlDataAdapter();
        //    //da.Fill(dt);

             

        //    //int city_code = (int)cmd.ExecuteScalar();
        //    con.Close();
        //    //return city_code;
           
        //    ////dr = cmd.ExecuteReader();
        //    ////if (dr.Read())
        //    ////{
        //    ////    int city_code = dr.();
        //    ////}
        //}


    }
}