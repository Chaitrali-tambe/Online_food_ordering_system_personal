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

namespace WebApplication2
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103 ; User ID = dev ; Password = Sq1@Ho34s ; Database = Demo ; Integrated Security= false; ");
        SqlCommand cmd;
        string query;

        
        protected void Page_Load(object sender, EventArgs e)
        {

            Label fname = new Label();
            fname.Text = DisplayFirstName();
            first_name.Controls.Add(fname);
        }

        public string DisplayFirstName()
        {
            con.Open();
            string username = Session["username"].ToString();
            
            query = "SELECT FNAME FROM User_data WHERE USERNAME = '" + username + "'";
            cmd = new SqlCommand(query, con);


            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            string fname = dt.Rows[0]["fname"].ToString();
            //SqlDataReader reader = cmd.ExecuteReader();

            //while (reader.Read())
            //{
            //    string firstname = (string)cmd.ExecuteScalar();

                
            //}
            //reader.Close();
            con.Close();
            return fname;

            //Label fname_display = new Label();
            //fname_display.Text = firstname;
            //first_name.Controls.Add(fname_display);
            //return reader["FNAME"].ToString();
        }

        protected void street_food_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "street food";
            Response.Redirect("Items_Display.aspx");
        }

        protected void seafood_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "sea food";
            Response.Redirect("Items_Display.aspx");
        }

        protected void veg_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "veg food";
            Response.Redirect("Items_Display.aspx");
        }

        protected void chicken_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "chicken dish";
            Response.Redirect("Items_Display.aspx");
        }

        protected void sweets_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "sweet dish";
            Response.Redirect("Items_Display.aspx");
        }

        protected void juices_btn_Click(object sender, EventArgs e)
        {
            Session["category"] = "juice";
            Response.Redirect("Items_Display.aspx");
        }


        protected void logout_btn_Click1(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("You are Loging Out", "Logout", MessageBoxButtons.YesNo);
            if(result == DialogResult.Yes)
            {
                Session.Abandon();
                Session.Remove("username");
                Session.Remove("password");
                Response.Redirect("Login.aspx");
            }
            
        }

        protected void Add_item_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Item.aspx");
        }
    }
}