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
int pageRecord=2;//假设每一个页面显示2条记录
int pageCount=1;//总页数
int pageNo=1;//当前页的编号
int records=0;//所有的记录数
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
    String sql="select * from xs where true";
    if((xh!=null)&&(xh!=""))
    	sql=sql+" and xh='"+xh+"'";
    if((xm!=null)&&(xm!=""))
        sql=sql+" and xm='"+xm+"'";
    //System.out.println(sql);
    ResultSet rs=stmt.executeQuery(sql);
    Statement stmt2=conn.createStatement();
    ResultSet rs2=stmt2.executeQuery("select count(*) as total from xs");
    rs2.next();
    records=rs2.getInt("total");
    System.out.println("total");
    //System.out.println(records);
    if(records%pageRecord==0)
    	pageCount=records/pageRecord;
    else
    	pageCount=records/pageRecord+1;
    //System.out.println(pageCount);
    %>
    <center>
    <h2>学生信息管理系统</h2>
    <hr>
    <form action="">
    请输入学号：<input type="text" name="xh"><br>
  请输入姓名：  <input type="text" name="xm"><br>
    <input type="submit" value="查询">
    </form>
     <hr>
     <table border="1">
     <tr><th>学号</th><th>姓名</th><th>性别</th></tr>
     <% 
     //4.操作记录结果集对象，显示所有记录
  
     if(request.getParameter("pageNo")!=null)
     {
    	 pageNo=Integer.valueOf(request.getParameter("pageNo"));
    	 if(pageNo<1) pageNo=1;
    	 if(pageNo>pageCount) pageNo=pageCount;
    	 }
     rs.absolute((pageNo-1)*pageRecord+1);
     for(int i=1;i<=pageRecord;i++)
    	 
    {
    	String id=rs.getString("xh");
    	%>
     <tr>
     <td><%=id %></td>
     <td><%=rs.getString("xm") %></td>
     <td><%=rs.getString("xb") %></td>
     <%
     //String qx=(String)session.getAttribute("qx");
     //if(qx.equals"1"))
    //{
    	%>
         <td><a href=/MyFirstProject/DeleteDo?xh=<%=id %>>删除</a></td>
      <td><a href=updateform.jsp?xh=<%=id %>>修改</a></td>
    </tr>
    <%
      if(!rs.next()) break;
      }
    %>
    <tr><td colspan="3" align="center">
    <a href="insertform.jsp">插入记录</a>
    </td></tr>
    <tr>
    <td><a href=10-2.jsp?pageNo=1>第一页</a></td>
    <td><a href=10-2.jsp?pageNo=<%=pageNo-1%>>上一页</a></td>
    <td><a href=10-2.jsp?pageNo=<%=pageNo+1%>>下一页</a></td>
    <td><a href=10-2.jsp?pageNo=<%=pageCount%>>最后页</a></td>
     </table>
    </center> 
</body>
</html>