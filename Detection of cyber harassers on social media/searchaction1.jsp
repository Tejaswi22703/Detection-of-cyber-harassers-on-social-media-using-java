<%@ page  language="java" import="java.sql.*" errorPage="" %>
<%@page import="network.DbConnection"%>
<%
   String name = null,smail=null,id=null,pname=null;

try{

   Connection con;
   con =  DbConnection.getConnection();  
   Statement st = con.createStatement();

   smail=(String)session.getAttribute("email");
  
   String s = "select id,name,mail from reg where mail!='"+smail+"'";
   
   ResultSet rs = st.executeQuery(s);
  
   if(rs.next())
   {
   id=rs.getString(1);
   name=rs.getString(2);
  
   smail=rs.getString(3);
 
  session.setAttribute("id",id);
   
   }
   else
   out.print("Please check your login credentials");
  
   
  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Online Social Network </title>
<link rel="stylesheet" href="cs\user.css" type="text/css" />
<link rel="stylesheet" href="cs\main_style.css" type="text/css" />
</head>
<body class="login">
<!-- header starts here -->
<div id="facebook-Bar">
  <div id="facebook-Frame">
    <div id="logo"> <a href="http://w3lessons.info"></a> </div>       
<br></br><br><div >
         <form action="searchaction1.jsp" method="get" action="" id="login_form" name="login_form">
          <table border="0" style="border:none">
            <tr>
              <td><img src="img\fb_icon.png" style="width:24px;height:24px;"></img></td>
              <td ><input type="text" tabindex="1"  id="email" placeholder="Search Your Friends" name="search" class="inputtext radius1" /></td>
              <td ><input type="submit" class="fbbutton" name="Search" value="Search" /></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?id=<%=id%>" style="width:30px;height:24px;"></img></td>
              <%
 
}
catch(Exception e)
{
System.out.println(e);
}
%>
              <td><a href="user_profile.jsp" style="font: 2px; color: #ffffff"><%=name%></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="uhome.jsp" style="font: 2px; color: #ffffff">Home</a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" ><img src="img\user_png.png" width="30" height="24" /></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" ><img src="img\chat1_1.png" width="30" height="24" /></a></td>
              <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="index.jsp" ><img src="img\logout1.png" width="80" height="28" /></a></td>
            </tr>
          </table>
        </form>
       </div> 
   </div>
</div>

<!-- header ends here -->
<br></br><br></br><div id="tooplate_content">

<!--<div id="services">-->
<br></br><div class="col_w300">
             <!--<h3 class="service2">Time Line Post</h3>-->
           	<ul>
		    <img src="bg.jpg" style="width:224px;height:224px;"></img>
                </ul>
                <div class="btn_more"><a href="#">More...</a></div>
</div></div></div>
<!-- body start here -->

<br></br><div id="tooplate_content">

<div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <%
//                        String uname = session.getAttribute("name").toString();
                        String search = request.getParameter("search");
                        session.setAttribute("search", search);
                    %>
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 400px;border-top-width: 20px;border-bottom-width: 10px">
                       
                           
                            <h4>Friends List</h4>
                     
                        <table style="text-align: center;margin-left: 400px;font-size: 20px;">
                            <%int fid=0;
                                Connection con = null;
                                Statement st = null;
                                ResultSet rs = null;
                                try {
                                    con = DbConnection.getConnection();
                                    st = con.createStatement();
                                    rs = st.executeQuery("select * from reg where name LIKE '%" + search + "%'");
                                    if (rs.next()) {
                                        fid=rs.getInt("id");
                                    String fname=rs.getString("name");
				
                                        do {
                            %>
                            <center><tr>
                                <td width="50px"><%=rs.getString("name")%></td>
                                <td><a href="friend_profile.jsp?id=<%=fid%>" style="text-decoration: none">&nbsp;&nbsp;&nbsp;&nbsp;Details</a></td>
                                </tr></center>      
                            <%} while (rs.next());%>
                            
                                <%} else {
                                %>
                            <label style="margin-left: 10px;font-size: 18px;color: red">Your search - <label style="color: blue"><%=search%></label>- did not match any Friends.</label><br />
                            <label style="margin-left: 10px;font-size: 18px;color: #0000cc">Suggestions:</label><br />
                            <ul style="margin-left: 350px;font-size: 18px;color: #0000cc"><br />
                                <li>Make sure that all words are spelled correctly.</li>
                                <li>Try different keywords.</li>
                               
                            </ul>
                            <center><a href="search.jsp" style="text-decoration: none"></a></center>
                                <%
                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }
                                %>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        
        <div class="cleaner"></div>
</div>
    
   
		
        <div class="cleaner"></div>            

<br></br><br></br><br></br><br></br><br></br>
<div id="tooplate_footer_wrapper">

     <div id="tooplate_footer">
    
        Copyright � 2016 <a>Macerick</a>
    
    </div> 
</div>   
<!-- body  ends here -->
</body>

</html>
