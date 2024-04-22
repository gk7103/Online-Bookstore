using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop
{
    public partial class fpasswprd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|myDB.mdf;Integrated Security=True");
        String semail, spass;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if (email.Text != "")
            {


                SqlCommand cmd = new SqlCommand("select email from login where email='" + email.Text + "' ", con);
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
               {
                    if (password.Text == rpassword.Text)
                    {
                        semail = email.Text;
                        spass = password.Text;
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
"<script type='text/javascript'>alert('Password are Conform Password is not metch !!');</script>");

                    }
                }
                else
                {
                    Label1.Text = "Your Username is Wronge!!";
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
"<script type='text/javascript'>alert('Enter a Data !!');window.location.replace('fpassword.aspx');</script>");
                //Response.Redirect("index.aspx");
            }


            con.Close();
            if(semail==email.Text)
            {


                //protected void Button1_Click(object sender, EventArgs e)
                //{
                string allowedChars = "";

                allowedChars = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,";

                allowedChars += "A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,";

                allowedChars += "1,2,3,4,5,6,7,8,9,0,!,@,#,$,%,&,?";

                char[] sep = { ',' };

                string[] arr = allowedChars.Split(sep);

                string passwordString = "";

                string temp = "";

                Random r = new Random();

                for (int i = 0; i < 8; i++)

                {

                    temp = arr[r.Next(0, arr.Length)];

                    passwordString += temp;
                }
                //TextBox3.Text = passwordString;

                try
                {
                    SmtpClient Smtp_Server = new SmtpClient();
                    MailMessage e_mail = new MailMessage();
                    Smtp_Server.UseDefaultCredentials = false;
                    Smtp_Server.Port = 587;
                    Smtp_Server.EnableSsl = true;
                    Smtp_Server.Host = "smtp.gmail.com";
                    Smtp_Server.Credentials =
                new System.Net.NetworkCredential("mermaulik2@gmail.com", "maulik690");
                    e_mail = new MailMessage();
                    e_mail.From = new MailAddress("mermaulik2@gmail.com");
                    e_mail.To.Add(email.Text);
                    e_mail.Subject = "MyBookshop Username Password...";
                    e_mail.IsBodyHtml = false;
                    e_mail.Body = "Password : "+passwordString;
                    Smtp_Server.Send(e_mail);
                    //Interaction.MsgBox("Mail Sent");
                    //lblMessage.Text = "Mail Sent";
                    con.Open();
                    SqlCommand c1 = new SqlCommand("update login set password='" + passwordString + "' where email='" + semail + "'", con);
                    c1.ExecuteNonQuery();
                    SqlCommand c2 = new SqlCommand("update registretion set password='" + passwordString + "' where email='" + semail + "'", con);
                    c2.ExecuteNonQuery();

                    ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
"<script type='text/javascript'>alert('Password sent in your email address, please chek your email...');window.location.replace('login.aspx');</script>");

                }
                catch (Exception error_t)
                {
                    // Interaction.MsgBox(error_t.ToString);
                    // lblMessage.Text = "Error in Mail Sent";

                    ClientScript.RegisterStartupScript(typeof(Page), "alertMessage",
"<script type='text/javascript'>alert('Email address send erroe !!!');window.location.replace('login.aspx');</script>");

                }

                con.Close();

            }
        }
    }
}