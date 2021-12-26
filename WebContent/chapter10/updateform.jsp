<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息更新</title>
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
    String xh=request.getParameter("xh");
    String sql="select * from xs where xh='"+xh+"'";
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
   %>
<center>
   <form action="/MyFirstProject/UpdateDo">
   学号：<input type="text" name="xh" value=<%=rs.getString("xh") %> readonly ><br>
   姓名：<input type="text" name="xm" value=<%=rs.getString("xm") %>><br>
   性别：<input type="text" name="xb" value=<%=rs.getString("xb") %>><br>
   出生：<input type="text" name="csrq" value=<%=rs.getString("csrq") %>><br>
   专业：<input type="text" name="zy" value=<%=rs.getString("zy") %>><br>
   <input type="submit" value="修改">
   </form>
</center>
</body>
</html>