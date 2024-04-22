<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="add_product.aspx.cs" Inherits="Bookshop.add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="contact_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ">
                    <div class="heading_container ">
                        <h2 class="">Add Books Data
                        </h2>
                    </div>
                    <%-- <form action="#">
            <div>
              <input type="text" placeholder="Name" />
            </div>
            <div>
              <input type="email" placeholder="Email" />
            </div>
            <div>
              <input type="text" placeholder="Pone Number" />
            </div>
            <div>
              <input type="text" class="message-box" placeholder="Message" />
            </div>
            <div class="btn-box">
              <button>
                SEND
              </button>
            </div>
          </form>--%>

                    <form runat="server">
                        <div >
                            <asp:TextBox ID="TextBox1" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book name"></asp:TextBox></div>
                        <div>
                            <asp:TextBox ID="TextBox2" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book price(Rs.)" type="number"></asp:TextBox></div>
                        <div>
                            <asp:TextBox ID="TextBox3" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book author name"></asp:TextBox></div>
                        <div>
                            <asp:TextBox ID="TextBox4" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book stoke"></asp:TextBox></div>
                        <div>
                            <asp:TextBox ID="TextBox5" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book language(english.hindi,gujrati)"></asp:TextBox></div>
                        <div>
                            <asp:TextBox ID="TextBox6" style="border:solid #44b89d 5px;border-radius:34px;" runat="server" placeholder="book catogory"></asp:TextBox></div>
                      
                            <asp:FileUpload style="background:white;" ID="FileUpload1" runat="server" />
                     <center> <button style="width:300px;">  <asp:Button ID="Button1" runat="server" Text="submit"  style="margin:-8px;background:#44b89d;color:white;font-size:25px;text-align:center;width:290px;margin-left:-40px;" OnClick="Button1_Click"  /></button> 
                    </center></form>


                </div>
                <div class="col-md-6">
                    <div class="img-box">
                        <img src="images/contact-img.png" style="margin-top:60px;" alt="">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- end contact section -->


</asp:Content>

