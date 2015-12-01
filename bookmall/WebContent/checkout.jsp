<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Checkout</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

</head>

<body id="subpage">

<div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title">
        	<h1><a rel="nofollow" href="#">Book Store</a></h1>
        </div>

        <div>
    			<p align="right">
    			ID:<%=request.getSession().getAttribute("id") %>
 				<a href="order.jsp?id=<%=request.getSession().getAttribute("id") %>">order</a>
 				<input type="button" onclick="exit()" value="quit"/>
    			</p>
		</div>


		<div id="header_right">
            <div class="cleaner"></div>
            <div id="templatemo_search">
                <form action="products.jsp" method="get">
                  <input type="text" value="Search" name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                </form>
            </div>
         </div> <!-- END -->
    </div> <!-- END of header -->
    
    <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="products.jsp">Products</a>
                <ul>
                    <li><a href="products.jsp?category=Arts">Arts</a></li>
                    <li><a href="products.jsp?category=Biographies">Biographies</a></li>
                    <li><a href="products.jsp?category=Cookbooks">Cookbooks</a></li>
              </ul>
            </li>
            <li><a href="shoppingcart.jsp">Cart</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	
       
       
        <div id="content">
       		<h2>Checkout</h2>
            <h5><strong>BILLING DETAILS</strong></h5>
            <form action="AddOrder">
	            <div class="col col_13 checkout">
					Enter your full name as it is on the credit card:                				<input type="text"  style="width:300px;"  />
	                Address:
	                <input type="text" name="addr" style="width:300px;"  />
	                City:
	                <input type="text" name="city" style="width:300px;"  />
	                Country:
	                <input type="text" name="country" style="width:300px;"  />
	            </div>
            
	            <div class="col col_13 checkout">
	            	E-MAIL
					<input type="text" name="email" style="width:300px;"  />
	                PHONE<br />
					<span style="font-size:10px">Please, specify your reachable phone number. YOU MAY BE GIVEN A CALL TO VERIFY AND COMPLETE THE ORDER.</span>
	                <input type="text" name="phone" style="width:300px;"  />
	            </div>
	            
	            <div class="cleaner h50"></div>
	            <h3>Shopping Cart</h3>
	            <input type="hidden" name="total" value=<%=request.getParameter("total") %> />
	            <h4>TOTAL: <strong>$<%=request.getParameter("total") %></strong></h4>
				<p><a  rel="lightbox[portfolio]" href="images/finish.jpeg" target=_blank><input type="submit" name="action" value="Place Order"/></a></p>
		</form>
		</div>
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
    <div id="templatemo_footer">
    	<div class="col col_16">
        	<h4>Categories</h4>
            <ul class="footer_menu">
			    <li><a href="#">Aenean et dolor diam</a></li>
                <li><a href="#">Aenean pulvinar</a></li>				
                <li><a href="#">Cras bibendum auctor</a></li>
                <li><a href="#">Donec sodales bibendum</a></li>				
		  </ul>  
        </div>
        <div class="col col_16">
        	<h4>Pages</h4>
            <ul class="footer_menu">
            	<li><a href="#">Home</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Shipping</a></li>
                <li><a href="#">Privacy</a></li>
			</ul>  
        </div>
        <div class="col col_16">
        	<h4>Partners</h4>
            <ul class="footer_menu">
            	<li><a href="#">Website Templates</a></li>
            	<li><a href="#">HTML CSS Layouts</a></li>
                <li><a href="#">Web Design</a></li>
                <li><a href="#">Free Graphics</a></li>
			</ul>  
        </div>
        <div class="col col_16">
        	<h4>Social</h4>
            <ul class="footer_menu">
            	<li><a href="#">Twitter</a></li>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Youtube</a></li>
                <li><a href="#">LinkedIn</a></li> 
		  </ul>  
        </div>
        <div class="col col_13 no_margin_right">
        	<h4>About Us</h4>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur semper quam sit amet turpis rhoncus id venenatis tellus sollicitudin. Fusce ullamcorper, dolor non mollis pulvinar, turpis tortor commodo nisl. Validate.</p>
        </div>
        
        <div class="cleaner h40"></div>
		<center>
			Copyright &copy; 2014.Company name All rights reserved.<a target="_blank" href="http://sc.chinaz.com/moban/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
		</center>
    </div> <!-- END of footer -->   
   
</div>

<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>