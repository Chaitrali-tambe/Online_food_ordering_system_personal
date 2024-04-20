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
using Button = System.Web.UI.WebControls.Button;

namespace WebApplication2

{
    public partial class Street_food : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s ; Database = Demo; Integrated Security =  false;");
        SqlCommand cmd;
        string message, query;
        //SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                Label fname = new Label();
                fname.Text = DisplayFirstName();
                first_name.Controls.Add(fname);
                DisplayItems();

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
            con.Close();
            return fname;


            //SqlDataReader reader = cmd.ExecuteReader();

            //while (reader.Read())
            //{
            //    string firstname = (string)cmd.ExecuteScalar();


            //}
            //reader.Close();


            //Label fname_display = new Label();
            //fname_display.Text = firstname;
            //first_name.Controls.Add(fname_display);
            //return reader["FNAME"].ToString();
        }

        public void DisplayItems()
        {
            string category = Session["category"].ToString();
            query = "SELECT PROD_IMAGE, PROD_NAME, PROD_PRICE FROM FOOD WHERE CATEGORY = '" + category + "'";//WHERE CATEGORY = '"+ category + "'
            //con.Open();
            SqlDataAdapter da = new SqlDataAdapter(query, con);
            DataSet dt = new DataSet();
            da.Fill(dt);
            //dr = cmd.ExecuteReader();
            //if (dr.HasRows == true)
            //{

            //}
            DL_display.DataSource = dt;
            DL_display.DataBind();

            //con.Close();
        }

        protected void add_to_cart_btn_Click(object sender, EventArgs e)
        {
            Label prod_name = (Label)DL_display.FindControl("product_name");

            //DataListItem item = (DataListItem)(sender as Button).NamingContainer;
            //string txtId = ((Label)item.FindControl("PROD_NAME")).Text.Trim();
            //con.Open();
            Label name = (Label)DL_display.Items[e.Item.ItemIndex].FindControl("product_name");
            //query = "SELECT * FROM FOOD WHERE PROD_NAME = '" + prod_name.Text + "'";
            //query = "SELECT * FROM FOOD where prod_name = '" + ;
            //cmd = new SqlCommand(query, con);
            ////cmd.ExecuteNonQuery();
            SqlDataAdapter adapt = new SqlDataAdapter(query, con);
            DataTable dt = new DataTable();
            adapt.Fill(dt);

        }

        protected void Add_item_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Item.aspx");
        }

       

        //public void Add_to_Cart()
        //{
        //    string prod_name = DL_display.FindControl(product_name);
        //    string prod_name = DL_display.FindControl("product_name");
        //}

        //public string DisplayFirstName()
        //{
        //    //con.Open();
        //    string username = Session["username"].ToString();
        //    query = "SELECT FNAME FROM User_data WHERE USERNAME = '" + username + "'";
        //    //cmd = new SqlCommand(query, con);
        //    //SqlDataReader reader = cmd.ExecuteReader();
        //    SqlDataAdapter da = new SqlDataAdapter(query, con);
        //    DataTable dt = new DataTable();
        //    da.Fill(dt);
        //    if (dt.Rows.Count > 0)
        //    {
        //        return dt.Rows[0]["FNAME"].ToString();
        //    }
        //    //while (reader.Read())
        //    //{
        //    //    return reader["FNAME"].ToString();
        //    //}

        //    //con.Close();
        //    return "--";
        //    //string firstname = (string)cmd.ExecuteScalar();

        //    //Label fname_display = new Label();
        //    //fname_display.Text = firstname;
        //    //first_name.Controls.Add(fname_display);

        //}
    }
}