using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class RegisterFinal : System.Web.UI.Page
{

    static int clicks = 0;


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int flag = 0;
        if (Page.IsValid)
        {

            clicks++;
            if (clicks > 3)
            {
                
                Captcha.Text = "You have exceeded the number of tries";
            }

            else
            {
                if (TextBox8.Text == "PQJRYD")
                {

                    string connectionString = null;
                    SqlConnection con = new SqlConnection(connectionString);
                    con.ConnectionString = WebConfigurationManager.ConnectionStrings["BAS"].ConnectionString;

                    string insertUser = null;



                    try
                    {
                        using (con)
                        {
                            // Try to open the connection.
                            con.Open();

                            insertUser = "INSERT INTO [dbo].[User] (";
                            insertUser += "RoleId, Name, ";
                            insertUser += "UserId, Password, emailId, DOB) ";
                            insertUser += "VALUES (  ";
                            insertUser += "1  ,'";
                            insertUser += TextBox1.Text + "', '";
                            insertUser += TextBox2.Text + "', '";
                            insertUser += TextBox4.Text + "', '";
                            insertUser += TextBox6.Text + "', '";
                            insertUser += TextBox7.Text + "')";

                            SqlCommand cmd = new SqlCommand(insertUser, con);
                            cmd.ExecuteNonQuery();


                        }
                    }
                    
                    catch (Exception err)
                    {
                        // Handle an error by displaying the information.
                        //Label1.Text = "Error inserting into the the database. ";
                        //Label1.Text += err.Message;
                        Label3.Visible = true;
                        flag = 1;
                    }
                    finally
                    {
                        con.Close();

                        if (flag==0)
                        {
                            Panel1.Visible = true;
                            Label3.Visible = false;
                        }
                    }

                    clicks = 0;
                }
                else
                {
                    Captcha.Text = "Wrong captcha!";
                    Panel1.Visible = false;
                }
            }
            
            
            
        }

    }
}