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


namespace WebApplication2
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s ; Database = Demo; Integrated Security =  false;");
        SqlCommand cmd;
        string message, query;
        //SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void login_btn_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text.ToString();
            string password = txt_password.Text.ToString();


            if (username == "" && password == "")
            {
                MessageBox.Show("Enter Username and Password");
            }

            else if (username == "")
            {
                MessageBox.Show("Enter Username");

            }

            else if (password == "")
            {
                MessageBox.Show("Enter Password");

            }

            else
            {
                //con.Open();



                query = "SELECT * FROM User_data WHERE USERNAME =\'" + username + "\' and PASSWORD = \'" + password + "\'";

                //query = "user_insert 'chaitra', 'tambe', '" + username + "','chaitra@email.com', '" + password + "', 11111111";
                //cmd = new SqlCommand(query, con);
                //cmd.Parameters.AddWithValue("@uname", txt_username.Text);
                //cmd.Parameters.AddWithValue("@pass", txt_password.Text);
                //SqlDataAdapter adapter = new SqlDataAdapter(query,con);
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataSet dt = new DataSet();
                da.Fill(dt);

                //cmd = new SqlCommand(query, con);
                //dr = cmd.ExecuteReader();
                if (dt.Tables[0].Rows.Count > 0)
                {
                    //dr.Close();
                    message = "Sucessfull login!!!";
                    //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                    //sb.Append("<script type = text/javascript>");
                    //sb.Append("window.onload = function(){");
                    //sb.Append("alert (");
                    //sb.Append(message);
                    //sb.Append(")}");
                    //sb.Append("</script>");
                    //ClientScript.RegisterClientScriptBlock(GetType(), "alert", sb.ToString());


                    Session["username"] = txt_username.Text;
                    Response.Redirect("Home_page.aspx");
                }

                else
                {
                    MessageBox.Show("Not Found! Requested to Register First");
                }

                //DataTable dt = new DataTable();
                //adapter.Fill(dt);
                ////cmd.ExecuteNonQuery();
                //if (dt.Rows.Count > 0)
                //{
                //    message = "Sucessfull login!!!";
                //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //    sb.Append("<script type = text/javascript>");
                //    sb.Append("window.onload = function(){");
                //    sb.Append("alert (");
                //    sb.Append(message);
                //    sb.Append(")}");
                //    sb.Append("</script>");
                //    ClientScript.RegisterClientScriptBlock(GetType(), "alert", sb.ToString());
                //}
                //else
                //{
                //    message = "Something went wrong!";
                //    System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //    sb.Append("<script type = text/javascript>");
                //    sb.Append("window.onload = function(){");
                //    sb.Append("alert(");
                //    sb.Append(message);
                //    sb.Append(")}");
                //    sb.Append("</script>");
                //    ClientScript.RegisterClientScriptBlock(GetType(), "alert", sb.ToString());

                //}
                //con.Close();




            }

        }

        //protected void show_pass_chkbox_CheckedChanged(object sender, EventArgs e)
        //{
        //    if (show_pass_chkbox.Checked == true)
        //    {
        //        txt_password.TextMode = TextBoxMode.SingleLine;
        //    }
        //    else if (show_pass_chkbox.Checked == false)
        //    {
        //        txt_password.TextMode = TextBoxMode.SingleLine;
        //    }

        //    else
        //    {
        //        txt_password.TextMode = TextBoxMode.Password;
        //    }
        //}

        //protected void show_icon_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (show_icon.ImageUrl == "images1/eye-slash.svg")
        //    {
        //        show_icon.ImageUrl = "images1/eye.svg";
        //        //txt_password.TextMode = TextBoxMode.SingleLine;
        //    }
        //    else if (show_icon.ImageUrl == "images1/eye.svg")
        //    {
        //        show_icon.ImageUrl = "images1/eye-slash.svg";
        //        //txt_password.TextMode = TextBoxMode.Password;
        //    }
        //    else
        //    {
        //        show_icon.ImageUrl = "images1/eye-slash.svg";
        //        //txt_password.TextMode = TextBoxMode.Password;
        //    }
        //}


        //protected void show_hide_icon_Click(object sender, ImageClickEventArgs e)
        //{
        //    if(txt_password.TextMode.ToString() == "Password")
        //    {
        //        show_hide_icon.ImageUrl = "images1/eye-slash.svg";
        //    }
        //}

        //protected void show_hide_icon_Click1(object sender, ImageClickEventArgs e)
        //{
        //    if (txt_password.TextMode.ToString() == "Password")
        //    {
        //        show_hide_icon.ImageUrl = "images1/eye-slash.svg";
        //        //txt_password.TextMode = "single-line";
        //    }
        //}

        protected void register_btn_Click(object sender, EventArgs e)
        {

            Response.Redirect("Registration.aspx");
        }
    }
}