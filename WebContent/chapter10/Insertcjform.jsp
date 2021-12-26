<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩信息输入</title>
</head>

<body>
<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost:3306/mydata?characterEncoding=utf-8";
String user="root";
String pass="123456";
Connection conn=DriverManager.getConnection(url,user,pass);
Statement stmt=conn.createStatement();
String sql="select * from xs";
sql=sql+" order by xh";
ResultSet rs=stmt.executeQuery(sql);
%>
<center>
<tr><td>学号：</td></tr> <select name="xh" >
<option></option>
  <%
    while(rs.next()){
      %>
      <option value="<%=rs.getString("xh") %>"><%=rs.getString("xh") %></option>

  <%
   }
  %> <select><br>
  
 <%ResultSet rs2=stmt.executeQuery("select * from kc"); %>
  <tr><td>课程号：</td></tr> <select name="kcdh" >
<option></option>
  <%
    while(rs2.next())
   {
  %>
      <option value="<%=rs2.getString("kcdh") %>"><%=rs2.getString("kcdh") %></option>

  <%
   }
      %> </select>

   <form action="/MyFirstProject/InsertcjDo">
  ID：<input type="text" name="id"><br>
  <form action="selectdo.jsp">
   成绩：<input type="text" name="cj"><br>
   <input type="submit" value="输入">
   </form>
</center>
</body>
</html>