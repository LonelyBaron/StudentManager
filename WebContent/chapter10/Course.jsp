<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import='java.sql.*,db.Mydb' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>课程管理系统</title>
</head>
<body>
<% 
   Connection conn=Mydb.getConn();
   Statement stmt=conn.createStatement();
   String kcdh=request.getParameter("kcdh");
   String kcm=request.getParameter("kcm");
   String xs=request.getParameter("xs");
   String xf=request.getParameter("xf");
   String sql="select * from kc where true";
   if((kcdh!=null)&&(kcdh!="")&&(kcm!=null)&&(kcm!=""))
     sql=sql+" and kcdh='"+kcdh+"'"+" and kcm ='"+kcm+"'";
   ResultSet rs=stmt.executeQuery(sql);
   %>
   <center>
   <h2>课程信息维护</h2>
   <hr>
  <form action="">
   请输入您的课程代号：<input type="text" name="kcdh">
   请输入您的课程名称：<input type="text" name="kcm">
   <input type="submit" value="查询">
   <hr>
   
   </form>
   
   <table border="1">
   <tr><th>课程代号</th><th>课程名</th><th>学时</th><th>学分</th></tr>
   
   
   <% 
   //4.操作记录结果集对象，显示所有记录
   while(rs.next())
   {
	   
	   String id=rs.getString("kcdh");
	   
   %>
   <tr>
   <td><%=id %></td>
    <td><%=rs.getString("kcm") %></td>
   <td><%=rs.getString("xs") %></td>
   <td><%=rs.getString("xf") %></td>
   <%
   String qx=(String)session.getAttribute("qx");
   if(qx.equals("1"))   //1是管理员
   {   
   %>

   <td><a href="/MyFirstProject/DeletekcDo?kcdh=<%=id %>">删除</a></td>
   <td><a href=Updatekcform.jsp?kcdh=<%=id %>>修改</a></td>
   
   </tr>
   <%
   }
   %>
	 <%
   }
   %>
	 <tr><td colspan="3" align="center">
	<a href="Insertkcform.jsp">插入记录</a>
	</td></tr>
   
 </table>
</center>
</body>
</html>















