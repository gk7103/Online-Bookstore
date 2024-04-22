using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class signin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if(name.Text!=null || email.Text != null || password.Text != null || cpassword.Text != null || contact.Text != null)
            {
                if (password.Text.Equals(cpassword.Text))
                {

                    string query = "insert into registretion values('" + name.Text + "','" + email.Text + "','" + password.Text + "','" + contact.Text + "')";
                    string query2 = "insert into login values('" + email.Text + "','" + password.Text + "')";

                   SqlCommand cmd = new SqlCommand(query, con);
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd1 = new SqlCommand(query2, con);
                    cmd1.ExecuteNonQuery();
                    con.Close();

                    ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
         "<script type='text/javascript'>alert('Inserted Successfully');window.location.replace('index.aspx');</script>");
                    Response.Redirect("login.aspx");



                }
                else
                {

                    ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
         "<script type='text/javascript'>alert('Password are not Match !!');window.location.replace('signin.aspx');</script>");
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
       "<script type='text/javascript'>alert('Please Enter Valid Detials!!');</script>");
            }
        }
    }
}