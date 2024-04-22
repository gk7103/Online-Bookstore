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
    public partial class a_product : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");

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

            SqlDataAdapter adapt = new SqlDataAdapter("Select * from books", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            ShowData();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;

            SqlCommand cmd = new SqlCommand("delete from books where Id ='" + id.Text + "' ", con);
            con.Open();
            cmd.ExecuteNonQuery();

            ShowData();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label l1 = GridView1.Rows[e.RowIndex].FindControl("Label8") as Label;

            TextBox name = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox price = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox author = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox stoke = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            TextBox lan = GridView1.Rows[e.RowIndex].FindControl("TextBox5") as TextBox;
            TextBox cat = GridView1.Rows[e.RowIndex].FindControl("TextBox6") as TextBox;
            con.Open();
            SqlCommand cmd = new SqlCommand("update books set b_name = '" + name.Text + "',b_price = '" + price.Text + "' ,b_author = '" + author.Text + "' ,b_contity = '" + stoke.Text + "' ,b_language = '" + lan.Text + "' ,b_catogory = '" + cat.Text + "' where Id ='" + l1.Text + "' ", con);
            cmd.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            ShowData();
        }


    }
}