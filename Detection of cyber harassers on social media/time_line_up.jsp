<%@ page  language="java" import="java.sql.*" errorPage="" %>
<%@page import="network.DbConnection"%>
<%@page import="upload.FileUploadDB"%>

<%
    String name = null, smail = null, id = null, mail = null, sname = null, dob = null, sch = null, col = null, emp = null;

    try {

        Connection con;
        con = DbConnection.getConnection();
        Statement st = con.createStatement();

        smail = (String) session.getAttribute("email");

        String s = "select id,name,sname,mail,dob,sch,col,emp from reg where mail='" + smail + "'";

        ResultSet rs = st.executeQuery(s);

        if (rs.next()) {
            id = rs.getString(1);
            name = rs.getString(2);
            sname = rs.getString(3);
            smail = rs.getString(4);
            dob = rs.getString(5);
            sch = rs.getString(6);
            col = rs.getString(7);
            emp = rs.getString(8);
            session.setAttribute("id", id);



        } else {
            out.print("Please check your login credentials");
        }


%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Online Social Network </title>
        <link rel="stylesheet" href="cs\user.css" type="text/css" />
        <link rel="stylesheet" href="cs\main_style.css" type="text/css" />
        <link rel="stylesheet" href="cs\style.css" type="text/css" />
    </head>
    <%
        if (request.getParameter("msgggg") != null) {
    %>
    <script>alert('You are using Cyberbullying words');</script>
    <%            }
    %>
    <body class="login">
        <div id="facebook-Bar">
            <div id="facebook-Frame">
                <div id="logo"> <a href="http://w3lessons.info"></a> </div>       
                <br></br><br><div >
                        <form action="searchaction1.jsp" method="post" id="login_form" name="login_form">
                            <table border="0" style="border:none">
                                <tr>
                                    <td><img src="img\fb_icon.png" style="width:24px;height:24px;"></img></td>
                                    <td ><input type="text" tabindex="1"  id="email" placeholder="Search Your Friends" name="email" class="inputtext radius1" value=""></td>
                                    <td ><input type="submit" class="fbbutton" name="Search" value="Search" /></td>
                                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?id=<%=id%>" style="width:30px;height:24px;"></img></td>
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
        <div id="nav">

            <br></br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="viewimage.jsp?id=<%=id%>" style="width:300px;height:300px;"></img><br></br>
                <center><h2> 
                        <font color="blue"><font size="5"> <%=name%>&nbsp;<%=sname%></font></font>
                    </h2></center>
        </div>
    </br><br></br><div  class="form" >
    <h2>It'z Me!&nbsp; 
        <font color="blue"><font size="5"> <%=name%></font></font>
    </h2>
    <form id="contactform" enctype="multipart/form-data" action="uploadImg" method="post"> 
        <p class="contact"><label for="photo" style="font-size: 20px">TimeLine Photo Upload</label></p><br> 
            <input id="name" name="photo" required="" tabindex="1" type="file"> 
            <textarea style="background: white" name="msg" required="" placeholder="What's on your mind?" rows="4" cols="50" ></textarea>
            <br>
                <input class="buttom" name="submit" id="submit" tabindex="5" value="Upload!" type="submit"> 	 
                    </form> 
                    </div>    
                    <div id="section">
                    </div>
                    <br></br><br></br><br></br><br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br>
                        <div id="tooplate_footer_wrapper">

                            <div id="tooplate_footer">

                                Copyright � 2016 <a>Maverick</a>
                                <%

                                    } catch (Exception e) {
                                        System.out.println(e);
                                    }
                                %>
                            </div> 
                        </div>
                        </body>
                        </html>
