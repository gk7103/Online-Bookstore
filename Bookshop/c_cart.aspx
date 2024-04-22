<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="c_cart.aspx.cs" Inherits="Bookshop.c_cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            height: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

     <form runat="server">
        <center>
            <br />
            <br />
            <asp:LinkButton ID="LinkButton1" Style="background: #006699; color: white; font-size: 40px; text-align: center; border-radius: 10px; padding: 10px;" runat="server" PostBackUrl="product.aspx">Go to Shopping</asp:LinkButton>
            <br /><br /><br />
           
       </center>
        <div class="text-center"  >
           
         <center>   <asp:GridView ID="GridView1" cssClass="table" runat="server" style="width:80%;" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand" >
                <Columns>
                    <asp:TemplateField HeaderText="Cart ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Session Id">
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("s_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Id">
                        <ItemTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("c_id") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Book Name">
                        <ItemTemplate>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("b_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                  
                    <asp:TemplateField HeaderText="Book Author">
                        <ItemTemplate>
                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("b_author") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Book Quntity ">
                        <ItemTemplate>
                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("b_contity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language">
                        <ItemTemplate>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("b_language") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Book Catogory">
                        <ItemTemplate>
                            <asp:Label ID="Label9" runat="server" Text='<%# Eval("b_catogory") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <%-- <asp:TemplateField HeaderText="Image">
                      
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("b_image") %>' Width="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                      <asp:TemplateField HeaderText="Book Price">
                       
                        <ItemTemplate>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("b_price") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Remove Item">
                        <ItemTemplate>
                            <asp:Button ID="Delete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Delete" Text="Delete"  />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView></center>
            
             </div>

        <center>
            <table border="0" width="60%" style="margin:30px;text-align:center;">
                <tr>
                    <td style="margin:30px;">
                        <asp:Button ID="Button1" runat="server" Style="background: #006699; color: white; font-size: 20px; text-align: right; border-radius: 10px; padding: 10px;" Text="Get Total Price :- " CommandName="total" CommandArgument='<%# Eval("b_price") %>' />
                    &nbsp&nbsp
                        <asp:Label ID="Label10" runat="server" style="background: #006699; color: white; font-size: 20px; text-align: right; border-radius: 10px; padding: 10px;" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="margin:30px;">
                        <asp:TextBox ID="TextBox1" runat="server" Style="background: white; color:#006699; font-size: 28px;width:600px; padding:10px;text-align:left; border-radius: 10px;margin:5px;" Placeholder="Enter Your Shipping Address..."></asp:TextBox>
                    </td>
                </tr>
               
                <tr>
                    <td><br />
                        <hr />
<br />
                        <asp:Button ID="Button2"  Style="background: #006699; color: white; font-size: 28px; padding:10px;text-align: center; border-radius: 10px;margin:5px;" runat="server" Text="Online Pay" OnClick="Button2_Click" />
                                                             &nbsp&nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp

                        <asp:Button Style="background: #006699; color: white; font-size: 28px; padding:10px;text-align: center; border-radius: 10px;margin:5px;"  ID="Button3" runat="server" Text="Cash On Delivery" OnClick="Button3_Click" />
                                   <%-- <asp:LinkButton ID="LinkButton2" Style="background: #006699; color: white; font-size: 28px; padding:10px;text-align: center; border-radius: 10px;margin:5px;" runat="server" PostBackUrl="online.aspx">Online Payment</asp:LinkButton>

                                     &nbsp&nbsp&nbsp&nbsp&nbsp  &nbsp&nbsp

                                    <asp:LinkButton ID="LinkButton3" Style="background: #006699; color: white; font-size: 28px; padding:10px;text-align: center; border-radius: 10px;margin:5px;"  runat="server" PostBackUrl="cod.aspx">Cash On Delivery</asp:LinkButton>--%>

                    </td>
                </tr>
            </table>


             <br />
            <%--<asp:LinkButton ID="LinkButton5" Style="background: #006699; color: white; font-size: 40px; text-align: center; border-radius: 10px; padding: 10px;" runat="server" PostBackUrl="place_order.aspx">Place Order</asp:LinkButton>--%>
            <br /><br /><br />
        </center>
    </form>


</asp:Content>

