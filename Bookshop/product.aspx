<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="Bookshop.product" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <form id="form1" runat="server" style="text-align:center;">
    <br />
    <br />
        <asp:Label ID="Label9" runat="server"></asp:Label>
    <from runat="server">
        <center>
     <%
         if(Session["email"]!=null)
            {
                %> <div class="container" style="width:600px;">
                <div class="row">
                    <div class="col" style="margin-top:7px;">
                        <h4>Your Cart Item:</h4>
                    </div>
                    <div class="col" style="margin-left:-110px;">
                        <asp:Label ID="Label1" runat="server" Text="Empty" style="color:#006699;font-size:30px;" />
                    </div>
                    <div class="col">  
                        <asp:LinkButton ID="LinkButton3" style="background:#006699;color:white;font-size:25px;text-align:center;border-radius:10px;padding:10px;" runat="server" PostBackUrl="c_cart.aspx">Show Cart</asp:LinkButton>
                    </div>
                </div>
            </div>
            <%
            }
         %>     
           
            </center>
<div class="text-left" >
        <asp:DataList ID="DataList1" runat="server" CellPadding="4" style="margin:50px;margin-left:250px;padding:20px;"  DataKeyField="Id" DataSourceID="SqlDataSource1" Height="518px" RepeatColumns="3" RepeatDirection="Horizontal" Width="1250px" BackColor="White"  >
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <ItemStyle BackColor="White" ForeColor="#330099" />
            <ItemTemplate>
                <br />&nbsp
                <table class="w-100" style="color:#006699;" >
                    <tr>
                        <td rowspan="9" class="text-center" >
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>' Visible="False"></asp:Label>
                             <asp:Label ID="Label8" runat="server" Text='<%# Eval("b_image") %>' Visible="False"></asp:Label>
                            <asp:Image ID="Image1" runat="server" Width="200px" Height="290px" ImageUrl='<%# Eval("b_image") %>' />
                        </td>
                       
                        <td><strong><hr />Name:&nbsp<asp:Label ID="Label3" runat="server" Text='<%# Eval("b_name") %>'></asp:Label>
                            </strong>&nbsp;</td>
                    </tr>
                    
                    <tr>
                        <td>&nbsp;Rs.<asp:Label ID="Label4" runat="server" Text='<%# Eval("b_price") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td><strong><hr />Book Info: </strong> <br />Author:<asp:Label ID="Label5" runat="server" Text='<%# Eval("b_author") %>'></asp:Label>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;Book Stoke : <asp:Label ID="Label10" runat="server" Text='<%# Eval("b_contity") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Quantity : &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>language : &nbsp;<asp:Label ID="Label6" runat="server" Text='<%# Eval("b_language") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>Cotogory : &nbsp;<asp:Label ID="Label7" runat="server" Text='<%# Eval("b_catogory") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                   
                      <td class="text-left"><hr />
                                <asp:LinkButton ID="LinkButton1" style="background:#006699;color:white;font-size:12px;text-align:center;border-radius:10px;padding:10px;" runat="server" CommandArgument='<% #Eval("Id") %>' CommandName="addtocart" OnClick="insert_cart" >AddToCart</asp:LinkButton>

                        </td>
                    </tr>
                   
                </table>
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        </asp:DataList>
        </div>
        <br />
        <br />
        <br />
    </from>

        <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [books]"></asp:SqlDataSource>--%>
    
        <%-- if out of stoke books are not show than this query use...->-> --%>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [books] WHERE ([b_contity] &gt; @b_contity)">
            <SelectParameters>
                <asp:Parameter DefaultValue="0" Name="b_contity" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
 

</asp:Content>

