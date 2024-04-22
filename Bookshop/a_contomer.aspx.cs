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
    public partial class a_contomer : System.Web.UI.Page
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

            SqlDataAdapter adapt = new SqlDataAdapter("Select * from registretion", con);
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
            Label id = GridView1.Rows[e.RowIndex].FindControl("Label2") as Label;


            SqlCommand cmd = new SqlCommand("delete from registretion where Id ='" + id.Text + "' ", con);
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
            Label td = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;

            TextBox name = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox email = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox contact = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox msg = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;
            con.Open();
            SqlCommand cmd = new SqlCommand("update registretion set name ='" + name.Text + "', email ='" + email.Text + "',password ='" + msg.Text + "', contact ='" + Convert.ToString(contact.Text) + "'  where Id ='" + td.Text + "' ", con);
            cmd.ExecuteNonQuery();
             SqlCommand cmd1 = new SqlCommand("update login set password ='" + msg.Text + "' where email ='" + email.Text + "' ", con);
            cmd1.ExecuteNonQuery();

            GridView1.EditIndex = -1;
            ShowData();
        }

    }
}