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
    String id=request.getParameter("id");
    String sql="select * from yh where id='"+id+"'";
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
   %>
<center>
   <form action="/MyFirstProject/UpdateuserDo">
   用户ID：<input type="text" name="id" value=<%=rs.getString("id") %> ><br>
   用户名：<input type="text" name="yhm" value=<%=rs.getString("yhm") %>><br>
   密码：<input type="text" name="mm" value=<%=rs.getString("mm") %>><br>
   权限：<input type="text" name="qx" value=<%=rs.getString("qx") %>><br>
   <input type="submit" value="修改">
   </form>
</center>
</body>
</html>