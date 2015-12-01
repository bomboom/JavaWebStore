<%@ page import="java.io.*,java.util.*, bookmall.Dao.OrderDao, bookmall.beans.Orders"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Order Status</title>
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


<% 
	String order_id = (String)request.getSession().getAttribute("id");
	String sql = "select * from orders where username='"+order_id+"'";
	OrderDao od = new OrderDao();
	List<Orders> orderList = od.ListOrders(sql);
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
            <li><a href="products.jsp">Products</a>
                <ul>
                    <li><a href="products.jsp?category=Arts">Arts</a></li>
                    <li><a href="products.jsp?category=Biographies">Biographies</a></li>
                    <li><a href="products.jsp?category=Cookbooks">Cookbooks</a></li>
              </ul>
            </li>
            <li><a href="cart.jsp">Cart</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	
       
       
        <div id="content">
       		<h2>Order Status</h2>
         	<table width="700px" cellspacing="0" cellpadding="5">
                   	  <tr bgcolor="#CCCCCC">
                        	<th width="100" align="left">User ID </th> 
                        	<th width="220" align="left">Address </th> 
                       	  	<th width="120" align="left">Email </th> 
                        	<th width="120" align="left">Phone </th> 
                        	<th width="60" align="left">Total </th> 
                            
                      </tr>
         
         			<%for(int i=0;i<orderList.size();i++){ %>
                    	<tr>
                        	<td><%out.print(orderList.get(i).getUsername()); %></td> 
                        	<td><%out.print(orderList.get(i).getAddr()); %></td> 
                            <td><%out.print(orderList.get(i).getEmail()); %></td>
                            <td><%out.print(orderList.get(i).getPhone()); %></td> 
                            <td><%out.print(orderList.get(i).getTotal());%></td>
						</tr>
					<%} %>
         
         
         
         
         </table>
                
         
         </div>>
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