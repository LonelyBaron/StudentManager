package db;
import java.sql.*;
public class Mydb {
public static Connection getConn()
  {
	Connection conn=null;
	try
	{
	 //1.�������������
	   Class.forName("com.mysql.jdbc.Driver");
	    //2.�������ݿ�mydata
	    String url="jdbc:mysql://localhost:3306/mydata?characterEncoding=utf-8";
	    String user="root";
	    String pass="123456";
	    conn=DriverManager.getConnection(url,user,pass);
	}
catch(Exception e)
	{}
	return conn;

   }
}

