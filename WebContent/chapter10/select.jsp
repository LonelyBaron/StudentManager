<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩录入</title>
</head>
<body>
<%
Connection conn=Mydb.getConn();
Statement stmt=conn.createStatement();
ResultSet rs=stmt.executeQuery("select * from xs");
%>
<form action="selectdo.jsp">
学生：<select name="xh">
<option></option>
<%
while(rs.next())
{
%>
 <option value=<%=rs.getString("xh") %>>
 <%=rs.getString("xm") %>
 
 </option>
<%} %>
</select>




</form>
</body>
</html>