<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Owner.aspx.cs" Inherits="Owner" %>
<%@ MasterType VirtualPath="~/MasterPage.master"  %>   
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="height: 27px">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Sales statistics" BackColor="#FFCC66" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button3" runat="server" Text="Inventory level" OnClick="Button3_Click" BackColor="#FFCC66" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button4" runat="server" Text="Print Threshold list" OnClick="Button4_Click" BackColor="#FFCC66" />
        &nbsp;&nbsp;
        <asp:Button ID="Button5" runat="server" Text="Order Books" OnClick="Button5_Click" BackColor="#FFCC66" />
&nbsp;<asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="View1" runat="server">

                <br />
                <br />
                <b>Total number of books sold:</b>
                <asp:Label ID="Label5" runat="server" Text="Label" ForeColor="#FFCC66"></asp:Label>
                <br />
                <b>Total cash collected:</b>
                <asp:Label ID="Label6" runat="server" Text="Label" ForeColor="#FFCC66"></asp:Label>
                <br />
                <br />
                <b>Number of pending orders:</b><asp:Label ID="Label7" runat="server" Text="Label" ForeColor="#FFCC66"></asp:Label>
                <br />
                <b>Number of pending requests:</b><asp:Label ID="Label8" runat="server" Text="Label" ForeColor="#FFCC66"></asp:Label>
                <br />
                <br />
                <b>Best selling book(s):</b><br />
                <asp:Label ID="Label9" runat="server" ForeColor="#FFCC66"></asp:Label>
                <b>Best selling category:</b><br />
                <asp:Label ID="Label10" runat="server" ForeColor="#FFCC66"></asp:Label>
                <b>Best selling author(s):</b><br />
                <asp:Label ID="Label11" runat="server" ForeColor="#FFCC66" HeaderStyle-BackColor="#FFCC66"></asp:Label>
                <b>
                <br />
                Category wise details:-<br /><br /><br /> </b>
                <asp:Table ID="Table2" runat="server" style="margin-top: 276px; margin-left: 102px;" Width="607px">
                    <asp:TableRow runat="server" BackColor="#FFCC66" ForeColor="Black">
                        <asp:TableCell runat="server" ForeColor="Black">Serial no</asp:TableCell>
                        <asp:TableCell runat="server">Category name</asp:TableCell>
                        <asp:TableCell runat="server">Books Sold</asp:TableCell>
                        <asp:TableCell runat="server">Cash collected</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <br />

            </asp:View>
            <asp:View ID="View2" runat="server"><br /><br /><br />
                The inventory levels of the books are:-<br />
                <asp:Table ID="Table1" runat="server" Width="608px" style="margin-top: 48px; margin-left: 182px;">
                    <asp:TableRow runat="server" BackColor="#FFCC66" Font-Bold="True" ForeColor="Black">
                        <asp:TableCell runat="server">Serial no</asp:TableCell>
                        <asp:TableCell runat="server">Book Name</asp:TableCell>
                        <asp:TableCell runat="server">Inventory</asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                <br />
                <b>The total inventory level is:</b>
                <asp:Label ID="Label4" runat="server" ForeColor="#FFCC66"></asp:Label>
                <br />

            </asp:View>
            <asp:View ID="View3" runat="server">
                
                <br />The following books are below the threshold level:-<br />
                <br /><br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource3">
                    <HeaderStyle BackColor="#FFCC66" ForeColor="Black"/>
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                        <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Threshold" HeaderText="Threshold" SortExpression="Threshold" />
                        <asp:BoundField DataField="NoOfDaysToProcure" HeaderText="NoOfDaysToProcure" SortExpression="NoOfDaysToProcure" />
                        <asp:BoundField DataField="QuantitySold" HeaderText="QuantitySold" SortExpression="QuantitySold" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT * FROM [Book] where [Availability]<[Threshold]"></asp:SqlDataSource>

            </asp:View>
            <asp:View ID="View4" runat="server">
                <br />
                Pending orders:-<br /><br />

                <br />
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource4" Forecolor="white" style="margin-top: 0px; margin-left: 239px;">
                    <HeaderStyle BackColor="#FFCC66" ForeColor="Black"/>
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText=" Order Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                        <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                        <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [Id], [BookName], [Publisher] FROM [Order]"></asp:SqlDataSource>
                Choose an order:-<br />
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="Submit" BackColor="White" />
                &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [Id], [BookName] FROM [Order]"></asp:SqlDataSource>
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="SqlDataSource2" Height="50px" Width="599px" DataKeyNames="Id" style="margin-left: 163px">
                            
                         <Fields>
                            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                            <asp:BoundField DataField="BookId" HeaderText="BookId" SortExpression="BookId" />
                            <asp:BoundField DataField="BookName" HeaderText="BookName" SortExpression="BookName" />
                            <asp:BoundField DataField="Publisher" HeaderText="Publisher" SortExpression="Publisher" />
                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                            <asp:BoundField DataField="Urgent" HeaderText="Urgent" SortExpression="Urgent" />
                            <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" />
                            <asp:BoundField DataField="Timestamp" HeaderText="Timestamp" SortExpression="Timestamp" />
                        </Fields>
                    </asp:DetailsView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [Id],[BookId], [BookName], [Publisher], [Quantity], [Urgent], [UserId], [Timestamp] FROM [Order] WHERE ([Id] = @Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Send order to publisher" BackColor="#FFCC66" />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Order has been sent to publisher." Visible="False"></asp:Label>
                </asp:Panel>
                <br />
                <br />
                <br />

            </asp:View>
        </asp:MultiView>
    </p>
</asp:Content>

