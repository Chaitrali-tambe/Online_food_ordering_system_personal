<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="WebApplication2.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"  />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet" />
    <style>
        *,html{
            margin: 0;
            padding: 0;
        }

        :root{
            --light-blue: #a3e3e2;
            --dark-blue: #3887be;
            --red: #d90f31;
            --brown:#4e070c;
            --red: #d22701;
            --light-red: #d15f5f;
            --orange:#ff670e;
            --peach: #gde4ce;
            --light-green: #aad15f;
            --dark-green: #247339;
            --light-yellow: #fce6ae;
            --sap-green: #89ab41;
        }

        body{
            font-family: 'Open Sans', sans-serif;      
            display: flex;
            align-items: center;
            justify-content: center;
            height:100vh;
            box-sizing:border-box;
        }

        table {
            border-collapse: separate;
            border-spacing: 0 2em;
        }

        tr{
            padding-bottom: 20px;
            align-content: center;
        }

        .text_box{
            height: 30px; 
            width: 250px;
            border-radius:6px;
            padding: 0 7px;
            border: 2px solid #a5c267;
            background-color: #fcf4cc;
        }

        .label{
            border: none;
            height: 25px; 
            width: 200px;  
            margin-right: 15px;
        }

        .radio_btn{
            /*border: none;
            height: 20px; */

            -ms-transform: scale(1.5);
            -webkit-transform: scale(1.5);
            color:aquamarine;
            
            
        }

        .btn{
            border: none;
            height: 35px; 
            width: 100%;
            font-size: 16px;
            border-radius:7px;
            font-weight:bold;
            background-color:#d15f5f;
            color:white;
        }

    </style>
</head> 
<body>
    <form id="form1" runat="server" style="height:fit-content; width:fit-content; ">
        <div style=" padding: 20px 50px; background-color:#d15f5f; text-align:center; font-weight:500; font-size:28px; border-radius:20px 20px 0 0; color:white;">
            Create Your Account
        </div>
        
        <div style ="padding: 20px 50px 0 50px; background-color: #e0e68e;">
            
            <table id ="table" >
            <tr>
                <td>
                    <asp:Label ID="lbl_fname" runat="server" CssClass ="label">First Name: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_fname" runat="server" CssClass ="text_box" ></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Label ID="lbl_lname" runat="server" CssClass ="label">Last Name: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_lname" runat="server" CssClass ="text_box"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_uname" runat="server" CssClass ="label">User Name: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_uname" runat="server" CssClass ="text_box" OnTextChanged ="txt_uname_TextChanged"></asp:TextBox>
                    <div id="uname_message" runat="server" style="margin-top:3px; font-size:12px; margin-left:5px;"></div>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_email" runat="server" CssClass ="label">Email: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_email" runat="server" CssClass ="text_box" OnTextChanged="txt_email_TextChanged"></asp:TextBox>
                    <div id="email_message" runat="server" style="margin-top:3px; font-size:12px; margin-left:5px;"></div>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_password" runat="server" CssClass ="label">Enter Password: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_password" runat="server" CssClass ="text_box"></asp:TextBox>

                    
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_confirmpass" runat="server" CssClass ="label">Re-enter Password: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_confirmpass" runat="server" CssClass ="text_box" OnTextChanged ="txt_confirmpass_TextChanged"></asp:TextBox>
                    <div id="confirmPass_message" runat="server" style="margin-top:3px; font-size:12px; margin-left:5px;" ></div>
                </td>
            </tr>
            
            <tr>
                <td>
                    <asp:Label ID="lbl_mobile" runat="server" CssClass ="label">Mobile No.: </asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_mobile" runat="server" CssClass ="text_box" MaxLength="10" OnTextChanged ="txt_mobile_TextChanged"></asp:TextBox>
                    <div id="mobile_message" runat="server" style="margin-top:3px; font-size:12px; margin-left:5px;"></div>
                </td>
            </tr>
                
            <tr>
                <td>
                    <asp:Label ID="lbl_gender" runat="server" CssClass ="label">Gender: </asp:Label>
                </td>
                <td >
                    <div style="display:flex; justify-content:space-between">
                        <span>
                            <asp:RadioButton ID="radio_male" GroupName="gender" runat="server"  CssClass ="radio_label" OnCheckedChanged ="radio_male_CheckedChanged" />
                            <asp:Label ID="lbl_radio_male" runat="server" CssClass ="label">Male </asp:Label>
                        </span>

                        <span>
                            <asp:RadioButton ID="radio_female" GroupName="gender" runat="server"  CssClass ="radio_label" OnCheckedChanged="radio_female_CheckedChanged"  />
                            <asp:Label ID="lbl_radio_female" runat="server" CssClass ="label">Female </asp:Label>
                        </span>

                        <span>
                            <asp:RadioButton ID="radio_other" GroupName="gender" runat="server"  CssClass ="radio_label" OnCheckedChanged ="radio_other_CheckedChanged" />
                            <asp:Label ID="lbl_radio_other" runat="server" CssClass ="label">Other </asp:Label>
                        </span>
                    </div>

                    <div id="gender_message" runat="server" style="margin-top:3px; font-size:12px;"></div>
                   
                </td>
            </tr>

            <tr>
               <td style="display:none">
                    <asp:Label ID="Label1" runat="server" CssClass ="label">City: </asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_City" runat="server" CssClass ="label">City: </asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="city_options" CssClass="text_box" runat="server" AutoPostBack="true" OnSelectedIndexChanged="city_options_SelectedIndexChanged"></asp:DropDownList>
                </td>
            </tr>

 
            </table>
        </div>

        <div style ="padding: 20px 50px 40px 50px; background-color: #e0e68e; display: flex; justify-content: space-evenly; border-radius: 0 0 20px 20px;">
            


            <asp:Button ID="register_btn" CssClass="btn" Text="Register" runat="server" OnClick="register_btn_Click"></asp:Button>
                
        </div>

    </form>
</body>
</html>
