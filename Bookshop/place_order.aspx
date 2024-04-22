<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="place_order.aspx.cs" Inherits="Bookshop.place_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
  <form  ID="form1" runat="server">
      <center>
  <table width="70%" border="0" style="text-align:center;margin:80px;">
      <tr>
          <td>
            <asp:LinkButton ID="LinkButton1" Style="background: #006699; color: white; font-size: 50px; padding:10px;text-align: center; border-radius: 10px;" runat="server" PostBackUrl="online.aspx">Online Payment</asp:LinkButton>
          </td>
          <td>
            <asp:LinkButton ID="LinkButton2" Style="background: #006699; color: white; font-size: 50px; padding:10px;text-align: center; border-radius: 10px;"  runat="server" PostBackUrl="cod.aspx">Cash On Delivery</asp:LinkButton>
          </td>
      </tr>
      <tr>
          <td colspan="2" >
              
            <img src="images/about-img.png" alt="" width="900px" style="margin-top:50px;" height ="600px">
     
          </td>
      </tr>
  </table>
  </form></center>


</asp:Content>

