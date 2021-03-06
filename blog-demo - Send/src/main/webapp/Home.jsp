<!-- **********************DONE******************* -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    /*If user tries to click on browser bac k button then he/ she should not be able to access this page*/
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);

    /**
	* TODO: 4.13. Check if user is logged in or not. if not then redirect user to default page i.e index.jsp.
	* (Hint: You need to handle NullPointerException.)
	* (Hint: Make use of the email id stored in the session object to check if user is logged in or not.)
    */
    if(session.getAttribute("emailId") == null){
                   response.sendRedirect("/index.jsp");
            }



%>
<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/styles.css">
</head>
<body>
<header class="header">
<%
        String name=(String)session.getAttribute("emailId");
        if (name != null){
        int indexChar = name.indexOf("@");
         String uname = name.substring(0,indexChar);
         out.print("Logged In as " + uname);
        }
  %>
	<!--
		TODO: 4.14. If user is logged in then display the string before @ in the user's email id
		on this web page. For example, if email id is example@gmail.com, then display "Logged In as example"
		in the top right corner of the web page. 
	-->

</header>
<a href="blog/CreatePost.jsp"> Create Post</a>
<a href="blog/Search.jsp"> Search Post</a>
<a href="blog/Delete.jsp">Delete Post</a>
<a href="blog/Filter.jsp">Filter Post</a>
<a href="Logout.jsp">Logout</a>
</body>
</html>