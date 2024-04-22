using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class a_payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\hp\source\repos\Bookshop\Bookshop\App_Data\myDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                con.Open();
                ShowData();

            }
        }
        public void ShowData()
        {
            DataTable dt = new DataTable();

            SqlDataAdapter adapt = new SqlDataAdapter("Select * from online_mode", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            } 
            DataTable dt1 = new DataTable();

            SqlDataAdapter adapt1 = new SqlDataAdapter("Select * from offline_mode", con);
            adapt1.Fill(dt1);
            if (dt.Rows.Count > 0)
            {
                GridView2.DataSource = dt1;
                GridView2.DataBind();
            }
            con.Close();
        }

        protected void online_delete(object sender, GridViewDeleteEventArgs e)
        {
            Label l1 = GridView1.Rows[e.RowIndex].FindControl("Label2") as Label;

            SqlCommand cmd = new SqlCommand("delete from online_mode where Id ='" + l1.Text + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
           "<script type='text/javascript'>alert('Row Deleted...');</script>");
            ShowData();


        }

        protected void offline_delete(object sender, GridViewDeleteEventArgs e)
        {
            Label L2 = GridView2.Rows[e.RowIndex].FindControl("o_id") as Label;
            SqlCommand cmd = new SqlCommand("delete from offline_mode where Id ='" + L2.Text + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
             "<script type='text/javascript'>alert('Row Deleted...');</script>"); 
            ShowData();

        }
       
    }
}
