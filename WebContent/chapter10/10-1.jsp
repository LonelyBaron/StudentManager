 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,db.Mydb" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理系统</title>
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
    String xm=request.getParameter("xm");
    String csrq=request.getParameter("csrq");
    String zy=request.getParameter("zy");
    String sql="select * from xs where true";
    if((xh!=null)&&(xh!=""))
      sql=sql+" and xh='"+xh+"'";
    if((xm!=null)&&(xm!=""))
        sql=sql+" and xm='"+xm+"'";
    if((csrq!=null)&&(csrq!=""))
        sql=sql+" and csrq='"+csrq+"'";
    if((zy!=null)&&(zy!=""))
        sql=sql+" and zy='"+zy+"'";
    System.out.println(sql);
    ResultSet rs=stmt.executeQuery(sql);

    %>
    <center>
    <h2>学生信息维护</h2>
    <hr>
    <form action="">
    请输入学号：<input type="text" name="xh"><br>
  请输入姓名：  <input type="text" name="xm"><br>
    <input type="submit" value="查询">
    </form>
     <hr>
     <table border="1">
     <tr><th>学号</th><th>姓名</th><th>性别</th><th>出生日期</th><th>专业</th></tr>

     <% 
     //4.操作记录结果集对象，显示所有记录
    while(rs.next())
    {
      String id=rs.getString("xh");
    %>
    <tr>
    <td><%=id %></td>
     <td><%=rs.getString("xm") %></td>
      <td><%=rs.getString("xb") %></td>
      <td><%=rs.getString("csrq") %></td>
      <td><%=rs.getString("zy") %></td>
      <%
      String qx=(String)session.getAttribute("qx");
      if(qx.equals("1"))
      {  
      %>
      
      <td><a href=/MyFirstProject/DeleteDo?xh=<%=id %>>删除</a></td>
      <td><a href=updateform.jsp?xh=<%=id %>>修改</a></td>

    </tr>
  <%
   }
   %>
   <%
   }
   %>
    <tr><td colspan="3" align="center">
    <a href="insertform.jsp">插入记录</a>
    </td></tr>

     </table>
    </center> 
</body>
</html>