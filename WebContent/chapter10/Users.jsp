<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import='java.sql.*,db.Mydb' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户管理系统</title>
</head>
<body>
<% 
   Connection conn=Mydb.getConn();
   Statement stmt=conn.createStatement();

   String yhm=request.getParameter("yhm");
   String mm=request.getParameter("mm");
   String sql="select * from yh where true";
   if((yhm!=null)&&(yhm!="")&&(mm!=null)&&(mm!=""))
     sql=sql+" and yhm='"+yhm+"'"+" and mm ='"+mm+"'";
   ResultSet rs=stmt.executeQuery(sql);
   %>
   <center>
   <h2>用户信息维护</h2>
   <hr>
  <form action="">
   请输入您的用户名：<input type="text" name="yhm">
    请输入您的密码：<input type="password" name="mm">
   <input type="submit" value="查询">
   <hr>
   
   </form>
   
   <table border="1">
   <tr><th>用户ID</th><th>用户名</th><th>密码</th><th>权限</th></tr>
   
   <% 
   //4.操作记录结果集对象，显示所有记录
   while(rs.next())
   {
	   
	   String id=rs.getString("id");
	   
   %>
   <tr>
   <td><%=id %></td>
   <td><%=rs.getString("yhm") %></td>
   <td><%=rs.getString("mm") %></td>
   <td><%=rs.getString("qx") %></td>
   <%
   String qx=(String)session.getAttribute("qx");
   if(qx.equals("1"))   //1是管理员
   {   
   %>

   <td><a href="/MyFirstProject/DeleteuserDo?id=<%=id %>">删除</a></td>
   <td><a href=Updateuserform.jsp?id=<%=id %>>修改</a></td>
   
   </tr>
   <%
   }
   %>
	 <%
   }
   %>
    


	 <tr><td colspan="3" align="center">
	<a href="Insertuserform.jsp">插入记录</a>
	</td></tr>
   
 </table>
</center>
</body>
</html>