using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.Security;

public partial class LoginFinal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Abandon();
        FormsAuthentication.SignOut();
        Label1.Text = "";
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        string connectionString = null;
        SqlConnection con = new SqlConnection(connectionString);
        con.ConnectionString = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;

        string checkUser = null;



        try
        {
            using (con)
            {
                // Try to open the connection.
                con.Open();
                con.State.ToString();

                checkUser = "select  UserId,RoleId from [dbo].[User] where UserId='";
                checkUser += TextBox1.Text;
                checkUser += "' and Password='";
                checkUser += TextBox2.Text;
                checkUser += "'";



                SqlCommand cmd = new SqlCommand(checkUser, con);

                SqlDataReader myReader = null;
                myReader = cmd.ExecuteReader();
                myReader.Read();
                
                if (TextBox1.Text == myReader["UserId"].ToString())
                {

                    Session["UserId"] = TextBox1.Text;
                    Session["RoleId"] = myReader["RoleId"].ToString();
                    if (myReader["RoleId"].ToString() == "1")
                    {
                        /* con.Close();
                         Server.Transfer("Customer.aspx");*/
                        string url = "Customer.aspx?";
                        url += "UserId=" +TextBox1.Text+"&";
                        url += "RoleId=" + myReader["RoleId"].ToString();
                        Response.Redirect(url);

                    }
                    else if (myReader["RoleId"].ToString() == "2")
                    {
                        Server.Transfer("Clerk.aspx");
                        con.Close();
                    }
                    else
                    {
                        Server.Transfer("Owner.aspx");
                        con.Close();
                    }
                    


                }
                                               
            }
        }
        catch (Exception err)
        {
            
            Label1.Text= "Unsuccessful login";
            Label1.Visible = true;
        }

        
    }
}