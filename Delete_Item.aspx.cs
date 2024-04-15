using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication2
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source = 192.168.1.103; User ID = dev; Password = Sq1@Ho34s; Database = Demo; Integrated Security = False");
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                displayData();
            }
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
    }
}