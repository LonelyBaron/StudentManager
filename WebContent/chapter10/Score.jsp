<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import='java.sql.*,db.Mydb' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>成绩管理系统</title>
</head>
<body>
<% 
   Connection conn=Mydb.getConn();
   Statement stmt=conn.createStatement();
   String xh=request.getParameter("xh");
   String kcdh=request.getParameter("kcdh");
   String cj=request.getParameter("cj");
   String sql="select * from cj where true";
   if((xh!=null)&&(xh!="")&&(kcdh!=null)&&(kcdh!=""))
     sql=sql+" and xh='"+xh+"'"+" and kcdh ='"+kcdh+"'";
   ResultSet rs=stmt.executeQuery(sql);
   %>
   
 
  
   <center>
   <h2>成绩信息维护</h2>
   <hr>
  <form action="">
   请输入您的学号：<input type="text" name="xh">
   请输入您的课程代号：<input type="text" name="kcdh">
   <input type="submit" value="查询">
   <hr>
   
   </form>
   
   <table border="1">
   <tr><th>ID</th><th>学号</th><th>课程代号</th><th>成绩</th></tr>
   
   
   <% 
   //4.操作记录结果集对象，显示所有记录
   while(rs.next())
   {
	   
	   String id=rs.getString("id");
	   
   %>
   <tr>
   <td><%=id %></td>
    <td><%=rs.getString("xh") %></td>
   <td><%=rs.getString("kcdh") %></td>
   <td><%=rs.getString("cj") %></td>
   <%
   String qx=(String)session.getAttribute("qx");
   if(qx.equals("1"))   //1是管理员
   {   
   %>

   <td><a href="/MyFirstProject/DeletecjDo?id=<%=id %>">删除</a></td>
   <td><a href=Updatecjform.jsp?id=<%=id %>>修改</a></td>
   
   </tr>
   <%
   }
   %>
	 <%
   }
   %>
	 <tr><td colspan="3" align="center">
	<a href="Insertcjform.jsp">插入记录</a>
	</td></tr>
   
 </table>
</center>
</body>
</html>















