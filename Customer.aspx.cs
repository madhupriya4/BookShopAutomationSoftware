using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;

public partial class Customer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["UserId"] == null && ViewState["UserId"]==null && Request.QueryString["UserId"]!="1")
            Response.Redirect("LoginFinal.aspx");
        

        this.Master.changeState();

        Session["UserId"] = Request.QueryString["UserId"];
        this.Master.changeLabel(Request.QueryString["UserId"]);

        if (ViewState["UserId"] == null)
            ViewState["UserId"] = (string)Session["UserId"];
        else
            Session["UserId"]= (string)ViewState["UserId"];

        Panel1.Visible = Panel2.Visible = Panel3.Visible = false;


        if (Wizard1.ActiveStepIndex == 0)
        {
            HttpCookie cookie = Request.Cookies["LastRequest"];
            if (cookie != null)
                Label3.Text = "Last request :" + Server.UrlDecode((string)cookie["BookName"]);
        }
        



    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        ViewState["BookId"] = GridView1.SelectedRow.Cells[0].Text;

        if (Int32.Parse(GridView1.SelectedRow.Cells[4].Text) > 0)
        {
            ViewState["option"] = 1;
            MultiView1.SetActiveView(View1);

        }
        else
        {
            ViewState["option"] = 2;
            MultiView1.SetActiveView(View2);
        }


        //Cookie to display last book request
        HttpCookie cookie = Request.Cookies["Lastrequest"];
        if (cookie == null)
            cookie = new HttpCookie("LastRequest"); 
        string text = Server.UrlEncode(GridView1.SelectedRow.Cells[2].Text);
        cookie["BookName"] = text;
        cookie.Expires = DateTime.Now.AddYears(1);
        Response.Cookies.Add(cookie);

        //For view1
        string output = "Book name: ";
        output += GridView1.SelectedRow.Cells[2].Text;
        output += " <br/> Author: "; 
        output += GridView1.SelectedRow.Cells[1].Text;
        output += " <br/> Price: ";
        output += GridView1.SelectedRow.Cells[5].Text;
        Label1.Text = output;

        //For view2
        Label2.Text = GridView1.SelectedRow.Cells[2].Text;



    }

    protected void Wizard1_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {

        if (ViewState["BookId"] == null)
            Wizard1.ActiveStepIndex = 1;


        string connectionString = null;
        SqlConnection con = new SqlConnection(connectionString);
        con.ConnectionString = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;

        string incrementRequest = null;
        string decrementAvailable = null;
        string incrementOrder = null;


        try
        {
            using (con)
            {
                // Try to open the connection.
                con.Open();

                if ((int)ViewState["option"] == 1)
                {

                    incrementRequest = "INSERT INTO [dbo].[Requests] (";
                    incrementRequest += "BookId, UserId, Timestamp) ";
                    incrementRequest += "VALUES ( '";
                    incrementRequest += (string)ViewState["BookId"] + "','";
                    incrementRequest += (string)ViewState["UserId"] + "','";
                    incrementRequest += DateTime.Now + "')";

                    decrementAvailable = "UPDATE [dbo].[Book] ";
                    decrementAvailable += "set [Availability]=[Availability]-1 ";
                    decrementAvailable += "where [ISBN]= '";
                    decrementAvailable += (string)ViewState["BookId"] + "'";

                    SqlCommand cmd = new SqlCommand(incrementRequest, con);
                    cmd.ExecuteNonQuery();
                    cmd = new SqlCommand(decrementAvailable, con);
                    cmd.ExecuteNonQuery();

                    GridView1.DataBind();
                    this.Master.changeLabel("Request has been sent");
                }
                
                 if ((int)ViewState["option"] == 2)
                 {
                    incrementOrder = "INSERT INTO [dbo].[Order] (";
                    incrementOrder += "BookId, BookName, Publisher, ";
                    incrementOrder += "Quantity, Urgent, UserId,Timestamp) ";
                    incrementOrder += "VALUES (  ";
                    incrementOrder += (string)ViewState["BookId"] + ",'";
                    incrementOrder += Label2.Text + "','";
                    incrementOrder += TextBox4.Text + "','";
                    incrementOrder += Int32.Parse(TextBox5.Text) + "',";
                    if (CheckBox2.Checked == true)
                        incrementOrder += "1" + ",'";
                    else
                        incrementOrder += "0" + ",'";
                    incrementOrder += (string)Session["UserId"] + "','";
                    incrementOrder += DateTime.Now + "')";

                    SqlCommand cmd = new SqlCommand(incrementOrder, con);
                    cmd.ExecuteNonQuery();
                    this.Master.changeLabel("Order has been sent!");
                }
            }
        }
        catch (Exception err)
        {
            Label1.Text += err.Message;
            Label1.Text += "Unsuccessful request";
            this.Master.changeLabel(decrementAvailable);
        }

        con.Close();

        Wizard1.ActiveStepIndex = 0;
        HttpCookie cookie = Request.Cookies["LastRequest"];
        if (cookie != null)
            Label3.Text = "Last request :" + Server.UrlDecode((string)cookie["BookName"]);
    }

    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedIndex == 0)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            //SqlDataSource1.SelectCommand = "SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Name]=@Name)";
        }
        if (RadioButtonList1.SelectedIndex == 1)
        {
            Panel3.Visible = true;
            Panel1.Visible = false;
            Panel2.Visible = false;
            //SqlDataSource1.SelectCommand = "SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Author]=@Author)";
        }
        if (RadioButtonList1.SelectedIndex == 2)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = false;
            //SqlDataSource1.SelectCommand = "SELECT [ISBN], [Author], [Name], [Category], [Availability], [Price] FROM [Book] where ([Category]=@Category)";

        }
        if (RadioButtonList1.SelectedIndex == 3)
        {
            Panel1.Visible = Panel2.Visible = Panel3.Visible = false;
        }
    }

    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void Wizard1_NextButtonClick(object sender, WizardNavigationEventArgs e)
    {
        if(Wizard1.ActiveStepIndex==0)
        {

            if (RadioButtonList1.SelectedIndex == 0)
                GridView1.DataSourceID = "SqlDataSource5";
            if (RadioButtonList1.SelectedIndex == 1)
                GridView1.DataSourceID = "SqlDataSource6";
            if (RadioButtonList1.SelectedIndex == 2)
                GridView1.DataSourceID = "SqlDataSource7";
            if (RadioButtonList1.SelectedIndex == 3)
                GridView1.DataSourceID = "SqlDataSource1";

        }
            
        GridView1.DataBind();
        
    }
}