<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="online.aspx.cs" Inherits="Bookshop.online" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



    <section class="contact_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ">
                    <div class="heading_container ">
                        <h2 class="">Online Payment
                            <br />
                            <h6>(Card or QR Code Scan Now ..)</h6>
                            <br />
                        </h2>
                    </div>

                    <form runat="server">
                        <div>
                            <asp:TextBox ID="TextBox4" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="Holder Name :" type="text"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="TextBox1" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="card-no" type="number"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="TextBox2" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="cvv-no" type="number"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="TextBox5" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="Card Expiry Date" type="text"></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="TextBox3" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="Company Name" type="text"></asp:TextBox>
                        </div>
                       Address :  <asp:Label ID="Label1" runat="server" Text="Address:"></asp:Label><br />
                       Total Price: <asp:Label ID="Label2" runat="server" Text="Total Price:"></asp:Label>
                        <center>
                           <button style="width:300px;">  
 <asp:Button ID="Button1" runat="server" Text="Plaese Conform Order" Style="margin: -8px; background: #44b89d; color: white; font-size: 25px; text-align: center; width: 290px; margin-left: -40px;" OnClick="Button1_Click" /></button>
                           <br />
                 </button> 
 <hr />
                            <button style="width: 300px;">
                                <asp:Button ID="Button2" runat="server" Text="Pay Using QR-Code" Style="margin: -8px; background: #44b89d; color: white; font-size: 25px; text-align: center; width: 290px; margin-left: -40px;" OnClick="Button2_Click" /></button>
                           <br /><br /> <asp:Image ID="Image1" runat="server" ImageUrl="~/images/qrcode.png" Visible="False" />
                            <br />
                        </center>
                    </form>

                </div>
            <div class="col-md-6">
                <div class="img-box">
                    <img src="images/cod.png" alt="">
                </div>
            </div>
        </div>
        </div>
    </section>
</asp:Content>

