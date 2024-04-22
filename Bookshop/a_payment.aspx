<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="a_payment.aspx.cs" Inherits="Bookshop.a_payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <br /><br />

    <form runat="server" id="f1">
        <center>
                <asp:Button ID="Button1" runat="server" Style="background: #006699; color: white; font-size: 20px; text-align: right; border-radius: 10px; padding: 10px;" Text="Online Payment Detials " />

        <asp:GridView ID="GridView1" style="margin:40px;width:90%;text-align:center" CssClass="table" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnRowDeleting="online_delete">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Session Id">
                   
                    <ItemTemplate>
                        <asp:Label ID="s_id" runat="server" Text='<%# Eval("s_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Card No">
                  
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("card_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Cvv No">
                  
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("cvv_no") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bank Name">
                    
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("company_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Bank holder name">
            
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("holder_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Card Expiray Date">
            
                    <ItemTemplate>
                        <asp:Label ID="date" runat="server" Text='<%# Eval("expiry_date") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Shipping Address">
            
                    <ItemTemplate>
                        <asp:Label ID="address" runat="server" Text='<%# Eval("shipping_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Total Cost">
            
                    <ItemTemplate>
                        <asp:Label ID="cost" runat="server" Text='<%# Eval("total_cost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
               
                          <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Delete" Text="Delete" />
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
        </asp:GridView>
  
            <br />
        <div>--------------------------------------------------------------------------------------------</div>
            <br />
               
                <asp:Button ID="Button3" runat="server" Style="background: #006699; color: white; font-size: 20px; text-align: right; border-radius: 10px; padding: 10px;" Text="Offline Payment Detials " />

        <asp:GridView ID="GridView2" style="margin:40px;width:90%;text-align:center" CssClass="table" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AutoGenerateColumns="False" OnRowDeleting="offline_delete">
            <Columns>
                <asp:TemplateField HeaderText="Id">
                    <ItemTemplate>
                        <asp:Label ID="o_id" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Session Id">
                   
                    <ItemTemplate>
                        <asp:Label ID="Lab" runat="server" Text='<%# Eval("s_id") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Bank holder name">
            
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("holder_name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Shipping Address">
            
                    <ItemTemplate>
                        <asp:Label ID="Label9" runat="server" Text='<%# Eval("shipping_address") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Total Cost">
            
                    <ItemTemplate>
                        <asp:Label ID="Label0" runat="server" Text='<%# Eval("total_cost") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
               
                          <asp:Button ID="off_delete" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="Delete" Text="Delete" />
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
        </asp:GridView>
  </center>
  </form>

</asp:Content>

