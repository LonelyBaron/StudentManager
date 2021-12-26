<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩信息更新</title>
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
    String kcdh=request.getParameter("kcdh");
    String sql="select * from kc where kcdh='"+kcdh+"'";
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
   %>
<center>
   <form action="/MyFirstProject/UpdatekcDo">
  课程号：<input type="text" name="kcdh" value=<%=rs.getString("kcdh") %> ><br>
   课程名：<input type="text" name="kcm" value=<%=rs.getString("kcm") %>><br>
   学时：<input type="text" name="xs" value=<%=rs.getString("xs") %>><br>
   学分：<input type="text" name="xf" value=<%=rs.getString("xf") %>><br>
   <input type="submit" value="修改">
   </form>
</center>
</body>
</html>