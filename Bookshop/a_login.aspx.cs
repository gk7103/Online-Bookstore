using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Bookshop
{
    public partial class a_login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //string query="insert into login values('"+useradmin.Text+"','"+userpass.Text+"')";
            // cmd = new SqlCommand(query, con);

            // cmd.ExecuteNonQuery();
            // con.Close();
            // Response.Write("insert");

            SqlCommand cmd = new SqlCommand("select username,password from admin_login where username='" + useradmin.Text + "' and password='" + userpass.Text + "'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["email"] = useradmin.Text;
                Response.Redirect("index.aspx");
            }
            else
            {
                Label1.Text = "enter correct username & password !!";
            }

        }
    }
}