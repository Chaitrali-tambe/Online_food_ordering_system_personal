using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;
using Label = System.Web.UI.WebControls.Label;
using TextBox = System.Web.UI.WebControls.TextBox;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s; Database = Demo; Integrated Security = False");
        SqlCommand cmd;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label fname = new Label();
                fname.Text = DisplayFirstName();
                first_name.Controls.Add(fname);

                displayData();
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


        public void displayData()
        {
            con.Open();
            try
            {
                string query = "SELECT * FROM Food";
                SqlDataAdapter adapt = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                BoundField bfield = new BoundField();
                adapt.Fill(dt);
                if(dt.Rows.Count > 0)
                {
                    items_grid_view.DataSource = dt;
                    items_grid_view.DataBind();
                }
                else
                {
                    items_grid_view.DataSource = null;
                    items_grid_view.DataBind();
                }
            }
            catch(Exception e)
            {
                Console.WriteLine(e);
            }
            finally
            {
                con.Close();
            }
        }

        protected void items_grid_view_RowEditing(object sender, GridViewEditEventArgs e)
        {
            items_grid_view.EditIndex = e.NewEditIndex;
            displayData();
        }

        protected void items_grid_view_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            items_grid_view.EditIndex = -1;
            displayData();
        }

        protected void items_grid_view_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label prod_id = (Label)items_grid_view.Rows[e.RowIndex].FindControl("lbl_PROD_ID");
            TextBox prod_name = (TextBox)items_grid_view.Rows[e.RowIndex].FindControl("txt_PROD_NAME");
            TextBox prod_price = (TextBox)items_grid_view.Rows[e.RowIndex].FindControl("txt_PROD_PRICE");
            TextBox prod_image = (TextBox)items_grid_view.Rows[e.RowIndex].FindControl("txt_PROD_IMAGE");
            TextBox category = (TextBox)items_grid_view.Rows[e.RowIndex].FindControl("txt_PROD_CATEGORY");

            if(prod_name.Text == "" || prod_price.Text == "" || prod_image.Text == "" || category.Text == "")
            {
                MessageBox.Show("Found blank Field (Enter Value)");
            }
            else
            {
                con.Open();

                query = "UPDATE FOOD SET PROD_NAME = '" + prod_name.Text + "'," +
                    "PROD_PRICE =" + prod_price.Text + "," +
                    "PROD_IMAGE ='" + prod_image.Text + "'," +
                    "CATEGORY = '" + category.Text + "'" +
                    "WHERE PROD_ID = " + prod_id.Text;

                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();

                MessageBox.Show("Updated!!!");


                con.Close();
                items_grid_view.EditIndex = -1;
                displayData();
            }
            
            
        }

        protected void items_grid_view_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label prod_id = (Label)items_grid_view.Rows[e.RowIndex].FindControl("lbl_PROD_ID");


            query = "DELETE FROM FOOD WHERE PROD_ID = " + prod_id.Text;
            con.Open();
            
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
              
            con.Close();
            displayData();
        }

        protected void items_grid_view_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            Label prod_id = (Label)e.Row.Cells[0].FindControl("lbl_PROD_ID");
            Label prod_name = (Label)e.Row.Cells[0].FindControl("lbl_PROD_NAME");
            Label prod_price = (Label)e.Row.Cells[0].FindControl("lbl_PROD_PRICE");
            Label prod_image = (Label)e.Row.Cells[0].FindControl("lbl_PROD_IMAGE");
            Label category = (Label)e.Row.Cells[0].FindControl("lbl_PROD_CATEGORY");
            
            items_grid_view.EditIndex = -1;
        }
    }
}