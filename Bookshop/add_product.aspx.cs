using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class add_product : System.Web.UI.Page
    {
        string nm;
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            image();
            con.Open();
            string query = "insert into books values('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" +TextBox4.Text + "','"+TextBox5.Text+"','"+TextBox6.Text+"','"+nm+"')";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
           
            con.Close();

            ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
 "<script type='text/javascript'>alert('Inserted Successfully');window.location.replace('a_product.aspx');</script>");
            

        }
        public void image()
        {
            if (FileUpload1.HasFile)
            {
                //{
                //    nm = "images/" + FileUpload1.FileName.ToString();
                //    FileUpload1.SaveAs(Server.MapPath(nm));
                string nm = "Image/" + FileUpload1.FileName.ToString();
                string nmtype = Path.GetExtension(nm);
                if (nmtype == ".pdf" || nmtype==".PDF")
                {
                    FileUpload1.SaveAs(Server.MapPath(nm));
                    Response.Write("Done ...");

                }
                else
                {
                    Response.Write("please choise .pdf file only .");
                }
            }
        }
    }
}