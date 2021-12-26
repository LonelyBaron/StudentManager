<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
/**
//1.查找驱动程序包
   Class.forName("com.mysql.jdbc.Driver");
    //2.连接数据库mydata
    String url="jdbc:mysql://localhost:3306/mydata?characterEncoding=utf-8";
    String user="root";
    String pass="123456";
    Connection conn=DriverManager.getConnection(url,user,pass);
**/
    Connection conn=Mydb.getConn();
    //3.创建Statement对象，执行SQL语句
    Statement stmt=conn.createStatement();
    String yhm=request.getParameter("yhm");
    String mm=request.getParameter("mm");
    String sql="select * from yh where yhm='"+yhm+"' and mm='"+mm+"'";
    ResultSet rs=stmt.executeQuery(sql);
    if(rs.next())
    {
    	session.setAttribute("qx",rs.getString("qx"));
    	String qx=(String)session.getAttribute("qx");
    	if(qx.equals("1"))
        {
      
	   response.sendRedirect("toptitle+leftlist.html");}
     else response.sendRedirect("studentleftlist3.html");
	   
  } 
    	
    else
    	response.sendRedirect("login.jsp");
    
 %>
</body>
</html>