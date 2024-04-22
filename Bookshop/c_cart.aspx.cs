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
    public partial class c_cart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        int total,gtotal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if(Session["email"] != null)
                {
                ShowData();
                Session["total"] = Label10.Text;
                    
                }
                else
                {
                    Response.Redirect("login.aspx");
                   
                }

            }

        }

        public void ShowData()
        {

            
            //DataTable dt = new DataTable();
            DataSet ds = new DataSet();
            SqlDataAdapter adapt = new SqlDataAdapter("Select * from mycart where s_id='" + Session["email"].ToString() + "' ", con);
            adapt.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
            con.Open();
            SqlCommand cmd = new SqlCommand("Select b_price from mycart where s_id='" + Session["email"].ToString() + "'", con);
            var rdr = cmd.ExecuteReader();
            if (rdr.HasRows)
            {
                while (rdr.Read())
                {
                    total = Convert.ToInt32(rdr[0]);
                    gtotal += total;
                }

                con.Close();
            }
            else
            {
                Label10.Text = "o";

                con.Close();
            }
            Label10.Text = Convert.ToString(gtotal);
           

        }
      

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label l1 = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;

            Label bookId = GridView1.Rows[e.RowIndex].FindControl("Label3") as Label;
            Label u_count = GridView1.Rows[e.RowIndex].FindControl("Label7") as Label;

            int current_stoke=0;
            SqlCommand cmd11 = new SqlCommand("select b_contity from books where Id='" + bookId.Text + "'", con);
            con.Open();
            current_stoke = Convert.ToInt32(cmd11.ExecuteScalar().ToString());
            int a = 0;
            //if (img.HasRows)
            //{
            //    while (img.Read())
            //    {
            //        current_stoke = Convert.ToInt32(img[0]);
            //    }
            //}
            con.Close();



           
            con.Open();
            current_stoke =current_stoke + Convert.ToInt32(u_count.Text);
            SqlCommand cmd = new SqlCommand("delete from mycart where Id ='" + l1.Text + "' ", con);
            SqlCommand countupdate = new SqlCommand("update books set b_contity='" + Convert.ToString(current_stoke) + "'  where Id = '" + bookId.Text + "' ", con);
            countupdate.ExecuteNonQuery();
          
            cmd.ExecuteNonQuery();
            con.Close();
            ShowData();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Session["total"] = Label10.Text;

            Session["address"] = TextBox1.Text;
            Response.Redirect("online.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {

            Session["total"] = Label10.Text;

            Session["address"] = TextBox1.Text;
            Response.Redirect("cod.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int t1 = Convert.ToInt32(e.CommandArgument);
            Label10.Text = Convert.ToString(t1);
        }
    }
}