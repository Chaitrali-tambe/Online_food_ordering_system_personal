 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home_page.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"  />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet" />
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin/>
    <link href="https://fonts.googleapis.com/css2?family=Satisfy&display=swap" rel="stylesheet"/>
    
    
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="Scripts/bootstrap.min.js"></script>--%>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    
    <style>
        *,html{
            margin: 0 !important;
            padding: 0 !important;
        }

        :root{
            --light-blue: #a3e3e2;
            --dark-blue: #3887be;
            --red: #d90f31;
            --brown:#4e070c;
            --red: #d4552f;
            --light-red: #d15f5f;
            --orange:#ff670e;
            --peach: #gde4ce;
            --light-green: #aad15f;
            --dark-green: #247339;
            --light-yellow: #faf8e1;

            /*button colors*/
            --sap-green: #89ab41;
            --street-food: #d18143;
            --seafood: #fa8b41;
            --veg: #aad15f;
            --chicken: #d4552f;
            --sweets:#9c86bd;
            --juice: #f55d97;

            /*button hover colors*/
            --street-food-hover: #b5713c;
            --seafood-hover: #de7a37;
            --veg-hover: #8fb051;
            --chicken-hover: #b34625;
            --sweets-hover:#806d9c;
            --juice-hover: #c44b79;
        }

        body{
            font-family: 'Open Sans', sans-serif;      
            background-color: var(--light-yellow);
            box-sizing:border-box;
            
        }

        .categories{
            width: 500px;
            height: 100px;
            font-size:32px;
            font-weight: 300;
            font-family: 'Open Sans', sans-serif;  
            /*margin: 50px 100px;*/
            border:none;
            color: white;
        }

        #street_food_btn{
            background-color: var(--street-food);
            transition: transform .2s;
        }
        
        #street_food_btn:hover{
            background-color: var(--street-food-hover);
            transform:scale(1.1);
        }
        
        #seafood_btn{
            background-color: var(--seafood);
            transition: transform .2s;
        }
        #seafood_btn:hover{
            background-color: var(--seafood-hover);
            transform:scale(1.1);
        }

        #veg_btn{
            background-color: var(--veg);
            transition: transform .2s;
        }
        #veg_btn:hover{
            background-color: var(--veg-hover);
            transform:scale(1.1);
        }

        #chicken_btn{
            background-color: var(--chicken);
            transition: transform .2s;
        }
        #chicken_btn:hover{
            background-color: var(--chicken-hover);
            transform:scale(1.1);
        }

        #sweets_btn{
            background-color: var(--sweets);
            transition: transform .2s;
        }
        #sweets_btn:hover{
            background-color: var(--sweets-hover);
            transform:scale(1.1);
        } 

        #juices_btn{
            background-color: var(--juice);
            transition: transform .2s;
        }
        #juices_btn:hover{
            background-color: var(--juice-hover);
            transform:scale(1.1);
        }

        .logo{
            display:flex;
            align-items:center;
            font-family: "Satisfy", cursive;
            font-weight: 400;
            font-style: normal;
            font-size:40px;
            /*justify-content:center;*/
            width:fit-content;
            padding:0;
            margin:0;
            width: 20%;
        }

        #logo_image{
            width:10%;
            margin: 0.5em;
        }

        #cart{
            width:10%;
          
        }

        #profile-icon{
            border: 11px solid var(--light-yellow);
            width:100%;
            height:100%;
        }

        #profile_icon_img{
            margin-right:10px;
            height:20px;
        }

        li .nav-item a:hover{
            border-bottom: 1px solid var(--light-yellow) !important;
        }

        .Add_item_btn{
            border: none;
            height: fit-content; 
            width: fit-content;
            font-size: 16px;
            border-radius:7px;
            font-weight:bold;
            background-color:#d15f5f;
            color:white;
            padding: 0.5% 2%;
            text-align:center;
            line-height:2em;
            margin-right:2em;

        }

    </style>
</head>
<body>
    <form runat="server">
        
        <%--Navbar --%>
        <nav class="navbar navbar-expand-lg bg-danger bg-opacity-75 ps-5 pe-5 pt-4 pb-4">
            <div class="container-fluid">
                <a class="navbar-brand ms-5 me-5 fs-1" style="color:var(--light-yellow); font-weight:700; font-family: Satisfy, cursive;">Logo</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mb-2 mb-lg-0" style="margin-left:auto !important; ">

                        <li class="nav-item me-5 fs-5">
                            <a class="nav-link active" style="color:var(--light-yellow);" href="#">
                                <span class="me-1 fw-bold">Hi,</span>
                                <span id="first_name" class="fw-bold" runat="server"></span>
                            </a>
                        </li>

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
                            <a class="nav-link active" style="color:var(--light-yellow);" href="Add_Item.aspx">Add Item</a>
                        </li>

                        <li class="nav-item me-5 fs-5">
                            <a class="nav-link active" style="color:var(--light-yellow);" href="#">Cart</a>
                        </li>

                     </ul>
                     <div id="form3" class="d-flex" >
                        <asp:Button ID="logout_btn" runat="server" class="btn btn-outline-light p-2 fs-5" Text="Logout" OnClick="logout_btn_Click1" />
                    </div>
                </div>
            </div>
        </nav>




        <%--Home Content--%>

        <div class="container mx-auto  " >
            <div id="form2" class="mt-5" >

                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center ">
                        <asp:Button ID="street_food_btn" runat="server" Text="Street Delacasies" class="categories m-5" OnClick="street_food_btn_Click" />
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center">
                        <asp:Button ID="seafood_btn" runat="server" Text="Coastal Waves" class="categories m-5" OnClick="seafood_btn_Click"/>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center">
                        <asp:Button ID="veg_btn" runat="server" Text="Shudh Vegetarian" class="categories m-5" OnClick="veg_btn_Click"/>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center">
                        <asp:Button ID="chicken_btn" runat="server" Text="Chicken Specials" class="categories m-5 " OnClick="chicken_btn_Click"/>
                    </div>
                </div>
                
                <div class="row">
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center">
                        <asp:Button ID="sweets_btn" runat="server" Text="Sweet Mithai" class="categories m-5" OnClick="sweets_btn_Click"/>
                    </div>
                    <div class="col-sm-12 col-md-6 col-lg-6 d-flex justify-content-center">
                        <asp:Button ID="juices_btn" runat="server" Text="Fruity Juices" class="categories m-5" OnClick="juices_btn_Click"/>
                    </div>
                </div>

            </div>

        </div>
    </form>




  <%--  <div>
    <div>
        <div style="display:flex; justify-content:space-between; align-items:center; padding:40px 50px; 
background-color:var(--light-red); font-size:25px; font-weight:700; color:var(--light-yellow); ">

            <div style="text-align:center; width:30%; display:flex; align-items:center;">
                <span id="profile_icon"><asp:Image ID="profile_icon_img" runat="server" src="images1/profile_icon.svg"/></span>
                <span style="margin-right:8px">Hello</span><span id="first_name" runat="server"></span><span>!</span>
                <div id="profile_icon"><asp:Image ID="profile_icon_img" runat="server" src="images1/profile_icon.svg"/></div>
            </div>

            <div class="logo">
                <image id="logo_image" src="images1/logo.svg"/><p style="width:fit-content">Logo</p>
            </div>

            <div class="Cart" style="text-align:right; width:20%">
                <image id="cart"src="images1/cart.svg" /><p style="font-size:0.8em">Cart</p>
            </div>
      </div>

    </div>

    </div>--%>

<%--    <div class="container-fluid" >
        <nav class="navbar navbar-inverse bg-danger bg-opacity-75 ps-5 pe-5 pt-3 pb-3">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand text-warning opacity-100 fw-bolder fs-3" href="#">Logo</a>
                </div>  
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li><a href="#">Page 1</a></li>
                    <li><a href="#">Page 2</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                </ul>
            </div>
        </nav> 
    </div>--%>
    

   <%-- <div style="display:flex; justify-content:center; align-items:center; height: 80vh;">--%>
    <%--<form id="form1" runat="server">
    <div class="container-fluid">
    <div class="table-responsive">
                <table class="table">
                <tr>
                    <td >
                        <asp:Button ID="street_food_btn" runat="server" Text="Street Delacasies" CssClass="categories" OnClick="street_food_btn_Click" />
                    </td>

                    <td>
                        
                        <asp:Button ID="seafood_btn" runat="server" Text="Coastal Waves" CssClass="categories" OnClick="seafood_btn_Click"/>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:Button ID="veg_btn" runat="server" Text="Shudh Vegetarian" CssClass="categories" OnClick="veg_btn_Click"/>
                    </td>
                
                    <td>
                        <asp:Button ID="chicken_btn" runat="server" Text="Chicken Specials" CssClass="categories" OnClick="chicken_btn_Click"/>
                    </td>

                </tr>

                <tr>
                    <td>
                        <asp:Button ID="sweets_btn" runat="server" Text="Sweet Mithai" CssClass="categories" OnClick="sweets_btn_Click"/>
                    </td>

                    <td>
                        <asp:Button ID="juices_btn" runat="server" Text="Fruity Juices" CssClass="categories" OnClick="juices_btn_Click"/>
                    </td>
                </tr>

            </table>
            </div>

    </div>
            


        </form>--%>
   <%-- </div>--%>
    
</body>
</html>
