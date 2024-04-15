<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add_Item.aspx.cs" Inherits="WebApplication2.Add_Item" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head runat="server">
    <title>Add Item</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"  />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet" />
    
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="Scripts/bootstrap.min.js"></script>--%>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <style>

        *{
            padding:0;
            margin:0
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
            --light-yellow: #faf8e1;
            --sap-green: #89ab41;
            
        }

        body{
            font-family: 'Open Sans', sans-serif;      
            
            height:100vh;
            box-sizing:border-box;      
          /*  background-color:#fcf4cc;*/
            background-color: var(--light-yellow);
          
            
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
            border-color:lightgrey;
            background-color: transparent;
            height: 30px; 
            width: 250px;
            border-radius:6px;
            padding: 0 7px;
            
        }

        .label{
            border: none;
            height: 25px; 
            width: 200px;  
            margin-right: 15px;
        }

        .form-btn{
            border: none;
            height: 35px; 
            width: 47%;
            font-size: 16px;
            border-radius:7px;
            font-weight:bold;
            background-color:#d15f5f;
            color:white;
        }


    </style>
</head>
<body>
    <form runat="server">

        <nav class="navbar navbar-expand-lg bg-danger bg-opacity-75 ps-5 pe-5 pt-4 pb-4">
            <div class="container-fluid">
            <a class="navbar-brand ms-5 me-5 fs-1" style="color:var(--light-yellow); font-weight:700; font-family: Satisfy, cursive;">Logo</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0" style="margin-left:auto !important; ">
                    <li class="nav-item me-5" >
                        <a class="nav-link active fs-5" style="color:var(--light-yellow);" href="#">Home</a>
                    </li>
        
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle me-5 fs-5" style="color:var(--light-yellow);" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            About
                        </a>
                        <ul class="dropdown-menu p-2 mt-2" aria-labelledby="navbarScrollingDropdown">
                            <li><a class="dropdown-item mb-2" href="#">Company</a></li>
                            <li><a class="dropdown-item mb-2" href="#">Branches</a></li>
                            <li><hr class="dropdown-divider mb-2"/></li>
                            <li><a class="dropdown-item mb-1" href="#">Ratings and Reviews</a></li>
                        </ul>
                    </li>
        
                    <li class="nav-item me-5 fs-5">
                        <a class="nav-link active" style="color:var(--light-yellow);" href="#">Contact</a>
                    </li>
            
                    <li class="nav-item me-5 fs-5">
                        <a class="nav-link active" style="color:var(--light-yellow);" href="Delete_Item.aspx">Delete Item</a>
                    </li>

                    <li class="nav-item me-5 fs-5">
                        <a class="nav-link active" style="color:var(--light-yellow);" href="#">Cart</a>
                    </li>


                 </ul>
                 <div class="d-flex" >
                    <button class="btn btn-outline-light p-2 fs-5" type="submit">Logout</button>
                 </div>
            </div>
        </div>
        </nav>
        <div style="display: flex; align-items: center; justify-content: center; height:85%">
            <div id="form2" class="mt-5" style="height:fit-content; width:fit-content;  border-radius:20px; box-shadow: #bfad64 2px 2px 6px">
                <div class="bg-danger opacity-75" style=" padding: 20px 50px; text-align:center; font-weight:500; font-size:28px; border-radius:20px 20px 0 0; color:white; ">
                    Add Item
                </div>

                <div style ="padding: 20px 50px 0 50px; background-color: transparent;" >
                    <table id ="table">
                    <tr>
                        <td>
                            <asp:Label ID="lbl_prod_name" runat="server" CssClass ="label">Product Name </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_prod_name" runat="server" class ="text_box" ></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lbl_prod_price" runat="server" CssClass ="label">Product Price </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_prod_price" runat="server" CssClass ="text_box"></asp:TextBox>
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            <asp:Label ID="lbl_prod_link" runat="server" CssClass ="label">Product Image Name <br /> <span style="font-size:11px">(with extention example .jpg, .png, etc)</span> </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_prod_link" runat="server" CssClass ="text_box"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Label ID="lbl_prod_catg" runat="server" CssClass ="label" >Product Image Name <br /> <span style="font-size:11px">(with extention example .jpg, .png, etc)</span> </asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="txt_prod_catg" runat="server" CssClass ="text_box" >
                                <asp:ListItem Text="--Select Category--"  Value="selection"    />
                                <asp:ListItem Text="Street Food" Value="street food" />
                                <asp:ListItem Text="Sea Food" Value="sea food" />
                                <asp:ListItem Text="Vegetarian Food" Value="veg food" />
                                <asp:ListItem Text="Chicken Dish" Value="chicken dish" />
                                <asp:ListItem Text="Sweet Dish" Value="sweet dish" />
                                <asp:ListItem Text="Juice" Value="juice" />

                            </asp:DropDownList>
                        </td>
                    </tr>

                </table>
                </div>

                <div style ="padding: 20px 50px 40px 50px; background-color: transparent; display: flex; justify-content: space-between; border-radius: 0 0 20px 20px;">
                    
                    <asp:Button ID="Add_btn" CssClass="form-btn bg-danger opacity-75" Text="Add" runat="server" OnClick="Add_btn_Click"></asp:Button> 
                    
                    <asp:Button ID="Cancel_btn" CssClass="form-btn bg-danger opacity-75" Text="Cancel" runat="server" OnClick="Cancel_btn_Click"></asp:Button> 
                        
                </div>
            </div>
        </div>

    </form>
    <%--<div style="display:flex; justify-content:space-between; align-items:center; padding:40px 70px; 
background-color:var(--light-red); font-size:25px; font-weight:700; color:var(--light-yellow);">
        <div>
            Logo
        </div>

        <div>
            <span>Welcome</span> 
            <span id="first_name" runat ="server"></span><span>!</span>
        </div>

        <div>
            Cart
        </div>
        



    </div>--%>


    
    
</body>
</html>
