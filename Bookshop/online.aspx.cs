using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class online : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                    if (Session["total"] != null & Session["address"] != null) { 
                    Label1.Text = Session["address"].ToString();
                    Label2.Text = Session["total"].ToString();
                    }
                    else
                    {
                        Label1.Text = "nooo";
                        Label2.Text = "000";
                    }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Image1.Visible = true;
            TextBox1.Visible = false;
            TextBox2.Visible= false;
            TextBox3.Visible= false;
            TextBox5.Visible = false;
            


          
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          
            if(Image1.Visible==true)
            {
                TextBox4.Text += ":QR-Scan";
                SqlCommand cmd = new SqlCommand("insert into offline_mode values('"+Session["email"].ToString()+"','"+TextBox4.Text+"','"+Session["address"].ToString()+"','"+Convert.ToInt32(Session["total"].ToString())+"')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(typeof(Page), "alertMessage","<script type='text/javascript'>alert('Your Order Are Pleaced (QR-scan pay)..');window.location.replace('order-confrom.aspx');</script>");

                con.Close();
            }
            else
            {
                SqlCommand cmd = new SqlCommand("insert into online_mode values('" +Session["email"].ToString() + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + Session["address"].ToString() + "','" +Convert.ToInt32(Session["total"].ToString()) + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(typeof(Page), "alertMessage", "<script type='text/javascript'>alert('Your Order Are Pleaced (Online Payment)..');window.location.replace('order-confrom.aspx');</script>");

                con.Close();
            }
                
               
        }
    }
}