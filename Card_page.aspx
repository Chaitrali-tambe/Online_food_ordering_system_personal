<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Card_page.aspx.cs" Inherits="WebApplication2.WebForm4" %>

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
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
