package serviet;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Mydb;

/**
 * Servlet implementation class LoginDo
 */
@WebServlet("/LoginDo")
public class LoginDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginDo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
		Connection conn=Mydb.getConn();
	    //3.创建Statement对象，执行SQL语句
	    Statement stmt=conn.createStatement();
	    String yhm=request.getParameter("yhm");
	    String mm=request.getParameter("mm");
	    String sql="select * from yh where yhm='"+yhm+"' and mm='"+mm+"'";
	    ResultSet rs=stmt.executeQuery(sql);
		
	    if(rs.next())
	    {
	    	//request.setAttribute("qx",rs.getString("qx"));
	    	response.sendRedirect("chapter10/10-1.jsp");
	    	
	    	
	    }
	    else
	    	response.sendRedirect("chapter10/login.jsp");
		}
		catch(Exception e) {}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
