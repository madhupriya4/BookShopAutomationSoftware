<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegisterFinal.aspx.cs" Inherits="RegisterFinal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="height: 361px; margin-left: 320px">
    
        <b>Enter your details:-</b><br />
        <br />
        Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" style="margin-left: 0px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Name must not be empty"></asp:RequiredFieldValidator>
        <br />
        <br />
        Preferred user ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 10px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="ID is mandatory"></asp:RequiredFieldValidator>
        <br />
        <br />
        Confirm user ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" style="margin-left: 8px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="User IDs don't match"></asp:CompareValidator>
        <br />
        <br />
        Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" TextMode="Password" style="margin-left: 3px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox4" Display="Dynamic" ErrorMessage="Password is mandatory"></asp:RequiredFieldValidator>
        <br />
        <br />
        Confirm password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" style="margin-left: 9px"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="TextBox4" ControlToValidate="TextBox5" Display="Dynamic" ErrorMessage="Passwords don't match"></asp:CompareValidator>
        <br />
        <br />
        Email id:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox6" runat="server" style="margin-left: 0px" Width="164px"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Invalid email-id" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="Email required"></asp:RequiredFieldValidator>
        <br />
        <br />
        Date of birth:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:TextBox ID="TextBox7" runat="server" TextMode="Date" style="margin-left: 3px" Width="162px"></asp:TextBox>
        
        <br />
        <br />
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/captcha.jpg" style="margin-left: 58px" />
        <br />
        <br />
        Enter the captcha :
        <asp:TextBox ID="TextBox8" runat="server" style="margin-left: 36px"></asp:TextBox>
        
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="Captcha" runat="server"></asp:Label>
        
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" Width="70px" />
        &nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label3" Visible="false" runat="server" Text="Unsuccessful registration"></asp:Label>
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False" style="margin-top: 0px">
            Successfully registered!<br /> Login from<a href="LoginFinal.aspx">here</a></asp:Panel>
        <br />
        <br /> 
    
    </div>
</asp:Content>

