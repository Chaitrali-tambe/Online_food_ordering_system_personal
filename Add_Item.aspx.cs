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
using Image = System.Drawing.Image;

namespace WebApplication2
{
    public partial class Add_Item : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s ; Database = Demo; Integrated Security =  false;");
        SqlCommand cmd;
        string query; 

        protected void Page_Load(object sender, EventArgs e)
        {
            //Label fname = new Label();
            //fname.Text = DisplayFirstName();
            //first_name.Controls.Add(fname);
            if (!IsPostBack)
            {
                ClearText();
            }
            
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


        protected void Add_btn_Click(object sender, EventArgs e)
        {
            string prod_name = txt_prod_name.Text;
            int prod_price = int.Parse(txt_prod_price.Text);
            string prod_img = txt_prod_link.Text;
            string prod_category = txt_prod_catg.SelectedValue;

            string check_prod_exist = "SELECT * FROM FOOD WHERE PROD_NAME like '" + prod_name + "'";
            //SqlCommand selectproduct = new SqlCommand(check_prod_exist, con);
            SqlDataAdapter da = new SqlDataAdapter(check_prod_exist, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
           
            if (dt.Rows.Count <= 0)
            {
                con.Open();
                query = "INSERT INTO FOOD (PROD_NAME, PROD_PRICE, PROD_IMAGE, CATEGORY) VALUES('" + prod_name + "', " + prod_price + ", '" + prod_img + "', '" + prod_category + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                ClearText();
                MessageBox.Show("Product Inserted");
                con.Close();
            }
            else
            {
                MessageBox.Show("This Product Already Exists");
            }
          //if (dt.Rows[0]["PROD_NAME"].ToString() == prod_name)
          //{

          //      MessageBox.Show("This Product Already Exists");

          //  }
          //else
          //{
          //      query = "INSERT INTO FOOD (PROD_NAME, PROD_PRICE, PROD_IMAGE, CATEGORY) VALUES('" + prod_name + "', " + prod_price + ", '" + prod_img + "', '" + prod_category + "')";
          //      cmd = new SqlCommand(query, con);
          //      cmd.ExecuteNonQuery();
          //      ClearText();
          //      MessageBox.Show("Product Inserted");
                
          //}


        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            ClearText();
        }

        public void ClearText()
        {
            txt_prod_name.Text = "";
            txt_prod_price.Text = "";
            txt_prod_link.Text = "";
            
        }

        
           
    }
}