using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;

public partial class Clerk : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null && ViewState["UserId"]==null && (string)Session["RoleId"]!="2")
            Response.Redirect("LoginFinal.aspx");
        this.Master.changeState();
        if (ViewState["UserId"] == null)
            ViewState["UserId"] = Session["UserId"];
           
        if (!this.IsPostBack)
        {
            DropDownList2.Items.Add("Fiction");
            DropDownList2.Items.Add("Non-Fiction");
            DropDownList2.Items.Add("Horror");
            DropDownList2.Items.Add("Mystery");
            DropDownList2.Items.Add("Religion");
            DropDownList2.Items.Add("Science");
            DropDownList2.Items.Add("Biographies");
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
        Panel2.Visible = true;
        

        //Generate cash receipt

        string conStr = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);

        string query= "select b.ISBN,r.Timestamp,b.Name as BookName,b.Price,b.Publisher,u.Name as CustName,u.UserId  from [Requests] as r,[Book] as b,[User] as u where r.BookId=b.ISBN and r.UserId=u.UserId and r.id=";
        string delRequest = "Delete from Requests where [Requests].Id=";
        
        query += DropDownList1.SelectedValue;

        delRequest += DropDownList1.SelectedValue;
        
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader myReader;
        try
        {
            con.Open();
            string FileStr = "";
            myReader = cmd.ExecuteReader();
            myReader.Read();
            Label2.Text = DropDownList1.SelectedValue;
            Label3.Text = DateTime.Now.ToString();
            FileStr += "Time:";
            FileStr +=Label3.Text;
            Label4.Text = myReader["BookName"].ToString();
            FileStr += "\nBookName:";
            FileStr += Label4.Text;
            Label5.Text = myReader["Price"].ToString();
            FileStr += "\nPrice:";
            FileStr += Label5.Text;
            Label6.Text = myReader["Publisher"].ToString();
            FileStr += "\nPublisher:";
            FileStr += Label6.Text;
            Label7.Text = myReader["CustName"].ToString();
            FileStr += "\nCustomer name:";
            FileStr += Label7.Text;
            Label8.Text = myReader["UserId"].ToString();
            FileStr += "\nUser ID:";
            FileStr += Label8.Text;
            Label9.Text= myReader["Timestamp"].ToString();
            FileStr += "\nRequest time:";
            FileStr += Label9.Text;

            string incrQuantitySold = "update [Book] set [QuantitySold]=[QuantitySold]+1 where [ISBN]="+myReader["ISBN"];

            myReader.Close();
            cmd = new SqlCommand(delRequest, con);
            cmd.ExecuteNonQuery();

            cmd = new SqlCommand(incrQuantitySold, con);
            cmd.ExecuteNonQuery();

            DropDownList1.DataBind();

            //To store details onto file
            ViewState["RequestID"] = Label2.Text;
            ViewState["RequestDetails"] = FileStr;


        }
        catch(Exception err)
        {

        }
        finally
        {
            con.Close();
        }

    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
    {

    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Label10.Text = "Contents have been written to file.";
        StreamWriter w;
        string path = @"C:\Users\Acer\Desktop\Madhu\Project\App_Data\" + ViewState["RequestID"] + ".txt";
        w = File.CreateText(path);
        w.Write(ViewState["RequestDetails"]);
        w.Close();



    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        Label10.Text = "Print request has been sent.";
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;

    }

    protected void Button8_Click(object sender, EventArgs e)
    {
       //Add new book
        
        string conStr = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string query = "INSERT INTO [dbo].[Book] (";
        query += "ISBN, Name, Author, Publisher,";
        query += " Category, Availability, Price,NoOfDaysToProcure,Threshold) ";
        query += "VALUES (  '";
        query += TextBox1.Text + "', '";
        query += TextBox2.Text + "', '";
        query += TextBox3.Text + "', '";
        query += TextBox4.Text + "', '";
        query += DropDownList2.SelectedItem.Text+"','";
        query += TextBox5.Text + "', '";
        query += TextBox6.Text + "', '";
        query += TextBox7.Text + "', '";
        query += TextBox8.Text + "')";
        

        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }
        catch(Exception err)
        {
            Label11.Text = "Error inserting into database";
        }
        finally
        {
            con.Close();
        }
        Label11.Visible = true;
    }

    
}