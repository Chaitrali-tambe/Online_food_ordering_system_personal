<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication2.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        *, html {
            margin: 0;
            padding: 0;
        }

        :root {
            --light-blue: #a3e3e2;
            --dark-blue: #3887be;
            --red: #d90f31;
            --brown: #4e070c;
            --red: #d22701;
            --light-red: #d15f5f;
            --orange: #ff670e;
            --peach: #gde4ce;
            --light-green: #aad15f;
            --dark-green: #247339;
            --light-yellow: #faf8e1;
            --sap-green: #89ab41;
        }

        body {
            font-family: 'Open Sans', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            box-sizing: border-box;
        }

        table {
            border-collapse: separate;
            border-spacing: 0 2em;
        }

        tr {
            padding-bottom: 20px;
            align-content: center;
        }

        .text_box {
            border: 2px solid #a5c267;
            background-color: #fcf4cc;
            height: 30px;
            width: 250px;
            border-radius: 6px;
            padding: 0 7px;
            font-size: 14px;
        }

        .label {
            border: none;
            height: 25px;
            width: 200px;
            margin-right: 15px;
        }

        .btn {
            border: none;
            height: 35px;
            width: 47%;
            font-size: 16px;
            border-radius: 7px;
            font-weight: bold;
            background-color: #d15f5f;
            color: white;
        }

        .password_field {
            display: flex;
            align-items: center;
        }

        .show_pass_icon_btn {
            margin-left: 12px;
            height: 30px;
        }

        .eye-image{
            width:20px;
            height:20px;
        }

        /*.eye{
            background-image:url("images1/eye.svg");

        }

        .eye-slash{
            background-image:url("images1/eye-slash.svg");
            display:none;
        }*/
    </style>
</head>
<body>
    <form id="form1" runat="server" style="height: fit-content; width: fit-content;">
        <div style="padding: 20px 50px; background-color: #d15f5f; text-align: center; font-weight: 500; font-size: 28px; border-radius: 20px 20px 0 0; color: white;">
            Welcome! Login here
        </div>

        <div style="padding: 20px 50px 0 50px; background-color: #e0e68e;">
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lbl_username" runat="server" class="label">User Name: </asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txt_username" runat="server" class="text_box"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Label ID="lbl_password" runat="server" CssClass="label" >Password: </asp:Label>
                    </td>
                    <td class="password_field">
                        <%--<asp:TextBox ID="txt_password" runat="server" CssClass="text_box" TextMode="Password" checked="myFunction"></asp:TextBox>--%>
                        <%--<asp:ImageButton ID="show_icon" runat= "server" CssClass="show_pass_icon_btn" ImageUrl="images1/eye-slash.svg"/>--%>
                        <%--<asp:ImageButton ID="hide_show_pass" runat="server" src="images1/eye-slash.svg" />--%>
                        <%--<asp:ImageButton ID="hide_icon" runat="server" CssClass="show_pass_icon_btn "/>--%>
                     
                        <%--<i id="togglePassword" class="eye eye_slash" ></i>--%>
                        <%--<i id="togglePassword" style="margin-left: -30px; cursor: pointer;"></i>--%>
                        

                        <%--<input type="password" name="password" required="" id="txt_password" class="text_box"/>--%>
                        
                        
                        
                        <asp:TextBox ID="txt_password" runat="server" class="text_box" TextMode="Password"></asp:TextBox>
                        <img src="images1/eye-slash.svg" style="display: inline;vertical-align: middle;margin-left: -10%"  height="23" width="23" id="togglePassword"/>

                    </td>

                </tr>
                <%--<tr>
                    <td>

                    </td>
                    <td>
                        <%--<asp:CheckBox ID="show_pass_chkbox" runat="server" OnCheckedChanged="show_pass_chkbox_CheckedChanged" Font-Size="20px" />
                        <asp:Label runat="server" style="margin-left: 5px">Show Password</asp:Label>

                        <input type="checkbox" onclick="myFunction()" />
                        <asp:Label runat="server" style="margin-left: 5px" >Show Password</asp:Label>
                    </td>
                    
                </tr>--%>

                
            </table>
            

        </div>

        <div style="padding: 20px 50px 40px 50px; background-color: #e0e68e; display: flex; justify-content: space-between; border-radius: 0 0 20px 20px;">

            <asp:Button ID="login_btn" CssClass="btn" Text="Login" runat="server" OnClick="login_btn_Click"></asp:Button>

            <asp:Button ID="register_btn" CssClass="btn" Text="Register" runat="server" OnClick="register_btn_Click"></asp:Button>

        </div>

    </form>

    <script type="text/javascript">
        //function myFunction() {
        //    var x = document.getElementById("txt_password");
        //    if (x.type === "password") {
        //        x.type = "text";
        //    } else {
        //        x.type = "password";
        //    }
        //}


        const togglePassword =
            document.querySelector('#togglePassword');

        const password =
            document.querySelector('#txt_password');

        togglePassword.addEventListener('click', function (e) {

            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);

            // Toggle the eye slash icon
            if (togglePassword.src.match("images1/eye.svg")) {
                togglePassword.src = "images1/eye-slash.svg";
            }
            else {
                togglePassword.src = "images1/eye.svg";
            }
        });

    </script>
</body>
</html>
