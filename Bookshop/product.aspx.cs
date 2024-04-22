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
    public partial class product : System.Web.UI.Page
    {
        
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        DataTable dt = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["email"] != null)
            {
                SqlCommand cmd = new SqlCommand("select * from mycart where s_id='" + Session["email"].ToString() + "'", con);
                con.Open();
                var img = cmd.ExecuteReader();
                int a = 0;
                if (img.HasRows)
                {
                    while (img.Read())
                    {
                        a += 1;
                        if (img.Equals(null))
                        {
                            break;
                        }
                    }
                    Label1.Text = Convert.ToString(a);
                }
                con.Close();
             
                
            }
        }
    
        protected void insert_cart(object sender, EventArgs e)
        {
            con.Open();
            int totalprice;
            DataListItem item = (sender as LinkButton).NamingContainer as DataListItem;
            Label p_id = item.FindControl("Label2") as Label;
            Label bname = item.FindControl("Label3") as Label;
            Label bprice = item.FindControl("Label4") as Label;
            Label bauthor = item.FindControl("Label5") as Label;
            DropDownList dlist = item.FindControl("DropDownList1") as DropDownList;
            Label bla = item.FindControl("Label6") as Label;
            Label image = item.FindControl("Label8") as Label;
            Label bstoke = item.FindControl("Label10") as Label;
            Label bcat = item.FindControl("Label7") as Label;
            LinkButton addcartbtn = item.FindControl("LinkButton1") as LinkButton;

            int u_count = Convert.ToInt32(bstoke.Text) - Convert.ToInt32(dlist.SelectedItem.ToString());
            SqlCommand countupdate = new SqlCommand("update books set b_contity='" + Convert.ToString(u_count) + "'  where Id = '" + p_id.Text + "' ", con);
            countupdate.ExecuteNonQuery();
            totalprice = Convert.ToInt32(bprice.Text) * Convert.ToInt32(dlist.SelectedItem.ToString());
            int n1 = Convert.ToInt16(dlist.SelectedItem.ToString());
            SqlCommand cmd = new SqlCommand("insert into mycart values('" + Session["email"].ToString() + "','" + Convert.ToInt16(p_id.Text) + "','" + bname.Text.Trim() + "','" + Convert.ToString(totalprice).Trim() + "','" + bauthor.Text.Trim() + "','" + dlist.SelectedItem.ToString() + "','" + bla.Text.Trim() + "','" + bcat.Text.Trim() + "','" + image.Text.Trim() + "') ", con);
            cmd.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(typeof(Page), "alertMessage", "<script type='text/javascript'>alert('Add to cart Successfully');window.location.replace('product.aspx');</script>");
            con.Close();
        }
    }
}