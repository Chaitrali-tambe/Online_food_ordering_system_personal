<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete_Item.aspx.cs" Inherits="WebApplication2.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Delete Item</title>
    <link rel="preconnect" href="https://fonts.googleapis.com"/>
    <link rel="preconnect" href="https://fonts.gstatic.com"  />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,300&display=swap" rel="stylesheet" />
    
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
                        <button class="btn btn-outline-light p-2 fs-5" type="submit">Logout</button>
                    </div>
                </div>
            </div>
            </nav>


           <%-- Main Content--%>
           
           
           <div class ="container-fluid w-100 ">
               <asp:GridView class="mx-auto mt-5"  ID="items_grid_view" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="3" ForeColor="#333333" GridLines="None">
                   <AlternatingRowStyle BackColor="White" />
                   <Columns>

                       <%------PROD_ID-------%>
                       <asp:TemplateField HeaderText="ID NO." HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Label ID="lbl_PROD_ID" runat="server" Text='<%# Bind("PROD_ID") %>' />
                           </ItemTemplate>
                           <HeaderStyle Width="50px" HorizontalAlign="Center"></HeaderStyle>
                           <ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%------PROD_NAME-------%>
                       <asp:TemplateField HeaderText="PRODUCT NAME" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Label ID="lbl_PROD_NAME" runat="server" Text='<%# Bind("PROD_NAME") %>' />
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txt_PROD_NAME" runat="server" Text='<%# Bind("PROD_NAME") %>' />
                           </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%------PROD_PRICE-------%>
                       <asp:TemplateField HeaderText="PRODUCT PRICE" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Label ID="lbl_PROD_PRICE" runat="server" Text='<%# Bind("PROD_PRICE") %>' />
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txt_PROD_PRICE" runat="server" Text='<%# Bind("PROD_PRICE") %>' />
                           </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%------PROD_IMAGE-------%>
                       <asp:TemplateField HeaderText="PRODUCT IMAGE" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Label ID="lbl_PROD_IMAGE" runat="server" Text='<%# Bind("PROD_IMAGE") %>' />
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txt_PROD_IMAGE" runat="server" Text='<%# Bind("PROD_IMAGE") %>' />
                           </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%------CATEGORY-------%>
                       <asp:TemplateField HeaderText="PRODUCT CATEGORY" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Label ID="lbl_PROD_CATEGORY" runat="server" Text='<%# Bind("CATEGORY") %>' />
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:TextBox ID="txt_PROD_CATEGORY" runat="server" Text='<%# Bind("PROD_CATEGORY") %>' />
                           </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%-----EDIT OPTION-------%>
                       <asp:TemplateField HeaderText="EDIT PRODUCT" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Button class="btn btn-danger opacity-75" ID="btn_edit" runat="server" CausesValidation="false" 
                                   CommandName="Edit" Text="Edit" />
                           </ItemTemplate>
                           <EditItemTemplate>
                               <asp:Button class="btn btn-danger opacity-75" ID="btn_update" runat="server" CausesValidation="false" 
                                   CommandName="Update" Text="Update" />
                               <asp:Button class="btn-danger opacity-75" ID="btn_cancel" runat="server" CausesValidation="false" 
                                   CommandName="Cancel" Text="Cancel" />
                           </EditItemTemplate>

<ItemStyle HorizontalAlign="Center"></ItemStyle>
                       </asp:TemplateField>

                       <%-----DELETE OPTION-------%>
                       <asp:TemplateField HeaderText="DELETE PRODUCT" ItemStyle-HorizontalAlign="Center" >
                           <ItemTemplate>
                               <asp:Button class="btn btn-danger opacity-75" ID="btn_delete" runat="server" CausesValidation="false" 
                                   CommandName="Delete" Text="Edit" />
                           </ItemTemplate>
                           
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                           
                       </asp:TemplateField>

                       
                   </Columns>
                   <EditRowStyle BackColor="#FEFBDA" />
                   <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                   <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                   <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                   <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                   <SortedAscendingCellStyle BackColor="#FDF5AC" />
                   <SortedAscendingHeaderStyle BackColor="#4D0000" />
                   <SortedDescendingCellStyle BackColor="#FCF6C0" />
                   <SortedDescendingHeaderStyle BackColor="#820000" />
               </asp:GridView>
           </div>
           
           
        </div>
    </form>
</body>
</html>
