<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="cod.aspx.cs" Inherits="Bookshop.cod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <section class="contact_section layout_padding">
        <div class="container">
            <div class="row">
                <div class="col-md-6 ">
                    <div class="heading_container ">
                        <h2 class="auto-style1">Cash On Delivery Payment
                            <br />
                            <h5>(Enter Address and Place Order Now ..)</h5>
                        </h2>
                    </div>

                    <form runat="server">
                        <div>
                            <asp:TextBox ID="TextBox4" Style="border: solid #44b89d 5px; border-radius: 34px;" runat="server" placeholder="Bank Holder Name :" type="text"></asp:TextBox>
                        </div>
                        Address:<asp:Label ID="Label1" runat="server" Text="Address : "></asp:Label><br />
                        <br />
                        
                        Total price:
                        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        
                        <center>
                            <button style="width: 300px;">
                                <asp:Button ID="Button1" runat="server" Text="Plaese Conform Order" Style="margin: -8px; background: #44b89d; color: white; font-size: 25px; text-align: center; width: 290px; margin-left: -40px;" PostBackUrl="order-confrom.aspx" OnClick="Button1_Click" />
                            </button>
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

