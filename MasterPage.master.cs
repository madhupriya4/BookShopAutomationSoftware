using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = "This page was served at: "+ DateTime.Now.ToLongTimeString();
    }
    public void changeState()
    {
        Button1.Visible = true;
    }
    public void changeLabel(string s)
    {
        Label1.Text = s;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}
