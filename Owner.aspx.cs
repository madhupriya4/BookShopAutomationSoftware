using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Owner : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null && ViewState["UserId"] == null&&(string)Session["RoleId"] != "3")
            Response.Redirect("LoginFinal.aspx");
        this.Master.changeState();
        if (ViewState["UserId"] == null)
            ViewState["UserId"] = Session["UserId"];
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 0;
        string conStr = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string TotalNoOfBooks = "select sum(QuantitySold) as sum from[Book]";
        string TotalCash = "select sum(Price*QuantitySold) as cash from[Book] where QuantitySold>0";
        string TotalOrders = "select count(*) as orders from [Order]";
        string TotalRequests = "select count(*) as requests from [Requests]";
        string BestBook = "select Name from Book where QuantitySold in(SELECT MAX(QuantitySold) FROM Book)";
        string BestAuthor = "select Author from Book where QuantitySold in(SELECT MAX(QuantitySold) FROM Book)";
        string BestCategory = "select sum(QuantitySold) as q,Category from Book group by Category order by q desc";
        string CategoryDetails = "select sum(QuantitySold) as q,SUM(Price*QuantitySold) as p,Category from Book group by Category order by p desc";

        SqlCommand cmd = new SqlCommand(TotalNoOfBooks, con);
        SqlDataReader myReader;
        try
        {
            con.Open();
            myReader = cmd.ExecuteReader();
            myReader.Read();
            Label5.Text = myReader["sum"].ToString();
            myReader.Close();


            cmd = new SqlCommand(TotalCash, con);
            myReader = cmd.ExecuteReader();
            myReader.Read();
            Label6.Text = myReader["cash"].ToString();
            myReader.Close();

            cmd = new SqlCommand(TotalOrders, con);
            myReader = cmd.ExecuteReader();
            myReader.Read();
            Label7.Text = myReader["orders"].ToString();
            myReader.Close();

            cmd = new SqlCommand(TotalRequests, con);
            myReader = cmd.ExecuteReader();
            myReader.Read();
            Label8.Text = myReader["requests"].ToString();
            myReader.Close();

            cmd = new SqlCommand(BestBook, con);
            myReader = cmd.ExecuteReader();
            Label9.Text = "";
            while(myReader.Read())
                Label9.Text += myReader["Name"].ToString()+"<br/>";
            myReader.Close();

            Label10.Text = "";
            cmd = new SqlCommand(BestCategory, con);
            myReader = cmd.ExecuteReader();
            myReader.Read();
            int first = Int32.Parse(myReader["q"].ToString());
            Label10.Text += myReader["Category"].ToString() + "<br/>";

            while (myReader.Read())
            {
                if (Int32.Parse(myReader["q"].ToString()) < first)
                    break;
                Label10.Text += myReader["Category"].ToString() + "<br/>";
            }
            myReader.Close();

            Label11.Text = "";
            cmd = new SqlCommand(BestAuthor, con);
            myReader = cmd.ExecuteReader();
            while (myReader.Read())
                Label11.Text += myReader["Author"].ToString() + "<br/>";
            myReader.Close();

            
            cmd = new SqlCommand(CategoryDetails, con);
            myReader = cmd.ExecuteReader();
            int i = 0;
            while (myReader.Read())
            {
                TableRow r = new TableRow();
                Table2.Controls.Add(r);
                TableCell c1 = new TableCell();
                c1.Text = (++i).ToString();
                TableCell c2 = new TableCell();
                c2.Text= myReader["Category"].ToString();
                TableCell c3 = new TableCell();
                c3.Text = myReader["q"].ToString();
                TableCell c4 = new TableCell();
                c4.Text = myReader["p"].ToString();

                r.Controls.Add(c1);
                r.Controls.Add(c2);
                r.Controls.Add(c3);
                r.Controls.Add(c4);

            }
               
            myReader.Close();


        }
        catch(Exception err)
        {
            Label5.Text = err.Message;
        }
        finally
        {

        }



    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
        string conStr = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string query = "select [Name],[QuantitySold],[NoOfDaysToProcure] from [Book]";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader myReader;
        try
        {
            con.Open();
            myReader = cmd.ExecuteReader();
            int total = 0;
            
            int i = 1;
            while (myReader.Read())
            {
                TableRow r = new TableRow();
                Table1.Controls.Add(r);
                TableCell c1 = new TableCell();
                TableCell c2 = new TableCell();
                TableCell c3 = new TableCell();

                c1.Text = (i++).ToString();
                c2.Text = myReader["Name"].ToString();
                int inv = Int32.Parse(myReader["QuantitySold"].ToString()) *
                        Int32.Parse(myReader["NoOfDaysToProcure"].ToString());
                total += inv;
                c3.Text= inv.ToString();
                r.Controls.Add(c1);
                r.Controls.Add(c2);
                r.Controls.Add(c3);
            }
            
            Label4.Text = total.ToString();
            myReader.Close();

        }
        catch (Exception err)
        {
            Label4.Text = err.Message;
        }
        finally
        {
            con.Close();
        }
    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }

    protected void Button6_Click(object sender, EventArgs e)
    {
        string conStr = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;
        SqlConnection con = new SqlConnection(conStr);
        string query = "Delete from [dbo].[Order] where [Id]=";
        query += DropDownList1.SelectedItem.Text;
        SqlCommand cmd = new SqlCommand(query, con);
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
        }

        catch(Exception err)
        {
            Label2.Text = err.Message;
        }
        finally
        {
            con.Close();
            Label2.Visible = true;
        }
        DropDownList1.DataBind();
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        MultiView1.ActiveViewIndex = 3;
    }

    protected void Button7_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }
}