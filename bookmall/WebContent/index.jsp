<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>HOME</title>
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

</script>

<link rel="stylesheet" type="text/css" href="css/styles.css" />
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="scripts/slideitmoo-1.1.js"></script>
<script language="javascript" type="text/javascript">
	window.addEvents({
		'domready': function(){
			/* thumbnails example , div containers */
			new SlideItMoo({
						overallContainer: 'SlideItMoo_outer',
						elementScrolled: 'SlideItMoo_inner',
						thumbsContainer: 'SlideItMoo_items',		
						itemsVisible: 5,
						elemsSlide: 2,
						duration: 200,
						itemsSelector: '.SlideItMoo_element',
						itemWidth: 171,
						showControls:1});
		},
		
	});

	function clearText(field)
	{
		if (field.defaultValue == field.value) field.value = '';
		else if (field.value == '') field.value = field.defaultValue;
	}

	
	//AJAX Login
	var xmlHttp = false; 
	function createXMLHttpRequest() { 
		if (window.XMLHttpRequest) {
	        //IE7, Firefox, Opera
	        xmlHttp = new XMLHttpRequest();
	    } else if (window.ActiveXObject) {
	        //IE5,IE6  
	        xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	    }
	}
	            
	function check(){
		createXMLHttpRequest();  
		nameStr=myform.name.value;
		passStr=myform.pass.value;
		
		var url="check?name="+nameStr+"&pass="+passStr;
		//servlet/check
		xmlHttp.open("get",url, true);      //request
		xmlHttp.onreadystatechange = callback;
		xmlHttp.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp.send(null); 
		//window.print();
	}

	function callback(){
	    if(xmlHttp.readyState==4 && xmlHttp.status==200){  
	    		var str = xmlHttp.responseText;
	    		//alert(str);
				if(str.length==2){    //document.getElementById("state").innerHTML="login";
					var tdName=document.getElementById("tdName");
	                tdName.replaceChild(document.createTextNode(nameStr),tdName.firstChild);
	 				var tdPass=document.getElementById("pwdBox");
	 				var dir = "order.jsp?id="+nameStr;
	 				tdPass.innerHTML='<a href="'+dir+'"">order</a>';
					var trButtom=document.getElementById("buttom");
					trButtom.innerHTML='<input type="button" onclick="exit()" value="quit"/>';
	        		trButtom.name="yes";
	             }else{
					alert("wrong password!");
				}   
		}      
	}
	
	
	function quit(){
		createXMLHttpRequest();
		var url="quit";
		//servlet/quit
		xmlHttp.open("get",url, true);
		xmlHttp.onreadystatechange = call;
		xmlHttp.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=UTF-8");
		xmlHttp.send(null); 
	}
	
	function call(){
		if(xmlHttp.readyState==4 && xmlHttp.status==200){  
    		var str = xmlHttp.responseText;
    		window.location.href("index.jsp");
    	}
	}
	
	</script>

</head>

<body id="home">

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost:3306/test"
     user="root"  password="316591"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from book;
</sql:query>

<div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title">
        	<h1><a rel="nofollow" href="#">Book Store</a></h1>
        </div>
        
      
        <div>
        <% if(request.getSession().getAttribute("id")==null){ %>
        <form id="myform" action="" method="post">
    			<p align="right">
    			ID:<span id="tdName"><input type="text" id="userName" name="name" /></span>
    			<span id="pwdBox"> Password:<span id="tdPass"><input type="password" id="userPass" name="pass" /></span></span>
    			<span id="buttom"><input type="button" onclick="check()" value="login" /></span>
 
    			</p>
   		 </form>
   		 <%}else{ %>
   		 		<p align="right">
   		 		ID:<%=request.getSession().getAttribute("id") %>
 				<a href="order.jsp?id=<%=request.getSession().getAttribute("id") %>">order</a>
 				<input type="button" onclick="exit()" value="quit"/>
   		 		</p>
   		 <% }%>
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
            <li><a href="index.jsp" class="selected">Home</a></li>
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
    
    <div id="templatemo_middle">
    	<img src="images/Books-2-icon.png" alt="Image 01" width="310px" height="310px"/>
    	<h1>Book Store</h1>
        <p><a rel="nofollow" href="http://sc.chinaz.com" target="_parent">Book Store</a> is a free online shopping center.</p>
        <a href="products.jsp" class="buy_now">Browse All Products</a>
    </div> <!-- END of middle -->
    
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	<div id="product_slider">
    		<div id="SlideItMoo_outer">	
                <div id="SlideItMoo_inner">			
                    <div id="SlideItMoo_items">
                    
                    	<c:forEach var="row" items="${result.rows}">
                        <div class="SlideItMoo_element">
                                <a href="#slide1" target="_parent">
                                <img src="${row.photo}" width="100px" height="135.5px"/></a>
                        </div>	
         				</c:forEach>
         
         
                    </div>			
                </div>
            </div>
            <div class="cleaner"></div>
        </div>
        
        <div id="sidebar">
        	<h3>Categories</h3>
            <ul class="sidebar_menu">
			     <li><a href="products.jsp?category=Arts">Arts</a></li>
                 <li><a href="products.jsp?category=Biographies">Biographies</a></li>
                 <li><a href="products.jsp?category=Cookbooks">Cookbooks</a></li>
			</ul>
            <h3>Newsletter</h3>
            <p>Praesent aliquam mi id tellus pretium pulvinar in vel ligula.</p>
            <div id="newsletter">
                <form action="#" method="get">
                  <input type="text" value="Subscribe" name="email_newsletter" id="email_newsletter" title="email_newsletter" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="subscribe" value="Subscribe" alt="Subscribe" id="subscribebtn" title="Subscribe" class="subscribebtn"  />
                </form>
                <div class="cleaner"></div>
            </div>
        </div> <!-- END of sidebar -->
         
        
        <div id="content">
        
      	
        	<c:forEach var="row" items="${result.rows}">
        	
        	<div class="col col_14 product_gallery">
            	<a href="productdetail.jsp?name=${row.book_id}"><img src="${row.photo}" width="200px" height="271px"/></a>
                <h3>${row.name}</h3>
                <p class="product_price">$ ${row.price}</p>
                <a href="addToCart?bookid=${row.book_id}" class="add_to_cart">Add to Cart</a>
            </div>        	
            </c:forEach> 
            
            
            	
        </div> <!-- END of content -->
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