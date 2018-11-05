<%@ page import="java.io.*,java.util.*,java.sql.ResultSet,bookmall.Dao.BookDao, bookmall.beans.Book"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Product Details</title>
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

<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
	
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js?load=effects,builder" type="text/javascript"></script>
<script src="js/lightbox.js" type="text/javascript"></script>

</head>

<body id="subpage">

<% 
	String book_id = request.getParameter("name");
	String sql = "select * from book where book_id="+book_id;
	BookDao bd = new BookDao();
	List<Book> bookList = bd.listBook(sql);
	
	String dir = bookList.get(0).getPhoto();
%>



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
            <li><a href="products.jsp" class="selected">Products</a>
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
        	<h2>Product Details</h2>
            <div class="col col_13">
        	<a  rel="lightbox[portfolio]" href="<%=dir %>" title="<%=bookList.get(0).getName()%>"><img src="<%=dir %>" width="200px" height="271px"/></a>
            </div>
            <div class="col col_13 no_margin_right">
                <table>
                    <tr>
                        <td height="30" width="150">Price:</td>
                        <td>$ <%=bookList.get(0).getPrice() %></td>
                    </tr>
                    <tr>
                        <td height="30">Availability:</td>
                        <td>In Stock</td>
                    </tr>
                    <tr>
                        <td height="30">Name:</td>
                        <td><% out.print(bookList.get(0).getName()); %></td>
                    </tr>
                    <tr>
                        <td height="30">Author:</td>
                        <td><%=bookList.get(0).getAuthor() %></td>
                    </tr>
                    <tr><td height="30">Quantity</td><td><input type="text" value="1" style="width: 20px; text-align: right" /></td></tr>
                </table>
                <div class="cleaner h20"></div>
                <a href="addToCart?bookid=<%=bookList.get(0).getBook_id() %>" class="add_to_cart">Add to Cart</a>
			</div>
            <div class="cleaner h30"></div>
            
            <h5><strong>Product Description</strong></h5>
            <p><%=bookList.get(0).getText() %></p>	
            
            <div class="cleaner h50"></div>
            
            
            
            <div class="cleaner"></div>
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