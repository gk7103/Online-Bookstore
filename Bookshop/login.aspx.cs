using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

            if (email.Text != "" && password.Text != "")
            {

            
                SqlCommand cmd = new SqlCommand("select email,password from login where email='" + email.Text + "' and password='" + password.Text + "'", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    Session["email"] = email.Text;
                    ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
          "<script type='text/javascript'>alert('Welcome to MyBookShop...');window.location.replace('index.aspx');</script>");
                    //Response.Redirect("index.aspx");
                }
                else
                {

                    Label1.Text = "Enter Correct Username & Password !!";

                }
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
"<script type='text/javascript'>alert('Enter a Data !!');window.location.replace('login.aspx');</script>");
                //Response.Redirect("index.aspx");
            }

        }
    }
}