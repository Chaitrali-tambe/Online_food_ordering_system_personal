<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Items_Display.aspx.cs" Inherits="WebApplication2.Street_food" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home Page</title>
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
            margin: 0;
            padding: 0;
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
            width:100%;
            
        }

        

        .categories{
            width: 500px;
            height: 100px;
            font-size:32px;
            font-weight: 300;
            font-family: 'Open Sans', sans-serif;  
            margin: 50px 100px;
            border:none;
            color: white;
        }

        #street_food_btn{
            background-color: var(--street-food);
        }
        
        #street_food_btn:hover{
            background-color: var(--street-food-hover);
        }
        
        #seafood_btn{
            background-color: var(--seafood);
        }
        #seafood_btn:hover{
            background-color: var(--seafood-hover);
        }

        #veg_btn{
            background-color: var(--veg);
        }
        #veg_btn:hover{
            background-color: var(--veg-hover);
        }

        #chicken_btn{
            background-color: var(--chicken);
        }
        #chicken_btn:hover{
            background-color: var(--chicken-hover);
        }

        #sweets_btn{
            background-color: var(--sweets);
        }
        #sweets_btn:hover{
            background-color: var(--sweets-hover);
        } 

        #juices_btn{
            background-color: var(--juice);
        }
        #juices_btn:hover{
            background-color: var(--juice-hover);
        }

        .Item_display{
            width:80%;
            height: fit-content;
        }

        .card{
            border:1px solid var(--street-food);
            background-color:white;
            border-radius:12px;
            padding: 12px;
        }

        .card-btn{
            border: none;
            height: 35px; 
            width: 100%;
            font-size: 16px;
            border-radius:7px;
            font-weight:bold;
            background-color:#d15f5f;
            color:white;
        }

        .product_name{
            font-weight:700;
            font-size:20px;
            
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
          

        }


    </style>
</head>
    <body >

        <form id="form1" runat="server" >
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
                    <div class="d-flex">
                        <button class="btn btn-outline-light p-2" type="submit">Logout</button>
                    </div>
                </div>
            </div>
        </nav>
        <%--<div style="display:flex; justify-content:space-between; align-items:center; padding:40px 70px; 
        back    ground-color:var(--street-food); font-size:25px; font-weight:700; color:var(--light-yellow); " >
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
 
        <div >
            
                <div style="padding: 3% 5%; display:flex; justify-content: end;">
                    <asp:Button runat="server"  ID="Add_item" Text="Add Item" CssClass="Add_item_btn" OnClick="Add_item_Click" />
                </div>


                <div style="display:flex; justify-content:center; box-sizing:border-box; " class="m-auto">
                    <asp:DataList ID="DL_display" runat="server"  CssClass="Item_display" RepeatDirection="Horizontal" RepeatColumns="5">
                    <ItemTemplate >
                        <%--<div style="display:flex; flex-direction:column; align-items:center; background-color:white; padding:20px 10px; margin: 1rem; height:250px; width: 300px;  border-radius:15px; border:1px solid var(--street-food);">--%>
                            <%--<asp:Image runat="server" AlternateText="product image" ImageUrl="<%# Eval("PROD_IMAGE")%>"/> 
                                
                            <asp:Label runat="server"><%# Eval("PROD_NAME") %></asp:Label>
                           
                            <asp:Label runat="server"><%# Eval("PROD_PRICE") %></asp:Label>
                           
                            <asp:Button runat="server" Text="Add To Cart" CssClass="btn"/>--%>
                            
                            <%-- <asp:ImageButton ID ="product_image" runat="server" AlternateText="product image" ImageUrl="<%# Eval("PROD_IMAGE")%>" /> --%>
                            
                            <div class="card my-2 mx-2" style="width: 18rem;">
                              <img class="card-img-top mx-auto" style="height:180px; width:230px;" src="<%# Eval("PROD_IMAGE")%>" alt="Card image cap">
                              <div class="card-body">
                                <h5 class="card-title" id="product_name" runat="server"><%# Eval("PROD_NAME") %></h5>
                                <p class="card-text">₹ <%# Eval("PROD_PRICE") %></p>
                                <a href="#" class="btn btn-danger opacity-75 w-100">Add to Cart</a>
                              </div>
                            </div>
                            <%--<table >
                                <tr>
                                    <td>
                                        <img style="height:180px; width:230px;" src="<%# Eval("PROD_IMAGE")%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="product_name" runat="server" CssClass="product_name"><%# Eval("PROD_NAME") %></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Button ID="add_to_cart_btn" runat="server" Text="Add To Cart" CssClass="card-btn"/>
                                    </td>
                                </tr>

                            </table>--%>
                            
                            <%--<br />
                            
                            <br />--%>
                            
                        <%--</div>--%>
                    </ItemTemplate>
                </asp:DataList>
                </div>

                
                <%--<asp:table runat="server" css>
                    <tr>
                        <td>
                            
                        </td>
                    </tr>
                </asp:table>--%>


                <%--<asp:GridView ID="gridview1" runat="server" AutoGenerateColumns="true">
                    
                </asp:GridView>--%>
            
        </div>
    </form>
    </body>
</html>
