<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Customer.aspx.cs" Inherits="Customer" Theme="Theme1"%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>   

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <hr style="color: #FFFF99" />
    <asp:Label ID="Label3" runat="server" ForeColor="White"  ></asp:Label>
    <hr style="color: #FFFF66" />
    <br />

    <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" Height="374px" Width="757px" OnFinishButtonClick="Wizard1_FinishButtonClick" style="margin-left: 49px; margin-top: 0px" OnNextButtonClick="Wizard1_NextButtonClick" BackColor="#200000" BorderStyle="None">
        
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Search">
                Choose the appropriate search filter<br />&nbsp;&nbsp;<br /> <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem>Book Name</asp:ListItem>
                    <asp:ListItem>Author</asp:ListItem>
                    <asp:ListItem>Category</asp:ListItem>
                    <asp:ListItem>View all books</asp:ListItem>
                </asp:RadioButtonList>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="RadioButtonList1" Display="Dynamic" ErrorMessage="Choose any one!"></asp:RequiredFieldValidator>

                <br />
                <asp:Panel ID="Panel1" runat="server" Height="26px" Visible="False">
                    Choose book name:
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource2" DataTextField="Name" DataValueField="Name" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [Name] FROM [Book]"></asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible="False">
                    Choose category:<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="Category" DataValueField="Category" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT DISTINCT [Category] FROM [Book]"></asp:SqlDataSource>
                </asp:Panel>
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                    Choose author name:<asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="Author" DataValueField="Author" SelectedIndexChanged="DropDownList3_SelectedIndexChanged" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT DISTINCT [Author] FROM [Book]"></asp:SqlDataSource>
                </asp:Panel>
                <br />
                <br />
                <br />
                &nbsp;

            </asp:WizardStep>
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Results">
                List of matches:-

                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="ISBN" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CellPadding="4" PageSize="5" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px">
                    <Columns>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" ReadOnly="True" SortExpression="ISBN" />
                        <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                        <asp:BoundField DataField="Availability" HeaderText="Availability" SortExpression="Availability" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" ForeColor="#330099" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                    <SortedAscendingCellStyle BackColor="#FEFCEB" />
                    <SortedAscendingHeaderStyle BackColor="#AF0101" />
                    <SortedDescendingCellStyle BackColor="#F6F0C0" />
                    <SortedDescendingHeaderStyle BackColor="#7E0000" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Name]=@Name)">
                    <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList2" Name="Name" PropertyName="SelectedValue" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Author]=@Author)">
                    <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" Name="Author" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:BASConnectionString %>" SelectCommand="SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Category]=@Category)">
                    <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Category" PropertyName="SelectedValue" Type="String" DefaultValue="" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />

            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Procure/Order">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        Book details:-<br /> <br />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Click on the finish button to procure a copy.                                                           
                    </asp:View>
                    <asp:View ID="View2" runat="server">  
                        Enter complete details of book to generate an order.<br /> <br />
                        Book name: <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                        <br />
                        <br />
                        Publisher:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        Quantity:<asp:TextBox ID="TextBox5" runat="server" style="margin-left: 3px"></asp:TextBox>
                        <br />
                        <br />
                        Urgent(extra charges):<asp:CheckBox ID="CheckBox2" runat="server" /><br />
                        <br />
                        Click on the finish button to place the order.
                    </asp:View>
                </asp:MultiView>
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
&nbsp; 
</asp:Content>

