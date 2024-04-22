<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="c_profile.aspx.cs" Inherits="Bookshop.c_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <center>
        <form runat="server" style="margin: 30px;">



            <br />
            <br />

            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <%--    Id:
                   <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                   <br />
                   name:
                   <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />
                   <br />
                   email:
                   <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                   <br />
                   password:
                   <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                   <br />
                   contact:
                   <asp:Label ID="contactLabel" runat="server" Text='<%# Eval("contact") %>' />
                   <br />
<br />--%>

                    <table class="table" border="1" style="font-size: 30px;">
                       <tr>
                            <th colspan="2" style="background:#006699;color:white;text-align:center;">-: User Profile :-
                            </th>
                       </tr>
                        <tr>
                            <th style="background:#006699;color:white;">Id:
                            </th>

                            <td>
                                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />

                            </td>

                        </tr>
                        <tr>
                            <th style="background:#006699;color:white;">Name:
                            </th>

                            <td>
                                <asp:Label ID="nameLabel" runat="server" Text='<%# Eval("name") %>' />

                            </td>

                        </tr>
                        <tr>
                            <th style="background:#006699;color:white;">Email:
                            </th>

                            <td>
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />

                            </td>

                        </tr>
                        <tr>
                            <th style="background:#006699;color:white;">Password :
                            </th>

                            <td>
                                <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                            </td>
                        </tr>
                        <tr>
                            <th style="background:#006699;color:white;">Contact:
                            </th>
                            <td>
                                <asp:Label ID="contactLabel" runat="server" Text='<%# Eval("contact") %>' />
                            </td>
                        </tr>
                    </table>

                </ItemTemplate>
            </asp:DataList>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [registretion] WHERE ([email] = @email)">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="email" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <h3>
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="fpassword.aspx" Visible="true">Update Your Password</asp:LinkButton></h3>

        </form>


    </center>

</asp:Content>

