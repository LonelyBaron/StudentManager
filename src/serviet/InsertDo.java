package serviet;
import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Mydb;

/**
 * Servlet implementation class InsertDo
 */
@WebServlet("/InsertDo")
public class InsertDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertDo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		 Connection conn=Mydb.getConn();
		 String sql="insert into xs values(?,?,?,?,?)";
		 PreparedStatement pstmt=conn.prepareStatement(sql);
		 String xh=request.getParameter("xh");
		 String xm=request.getParameter("xm");
		 String xb=request.getParameter("xb");
		 String csrq=request.getParameter("csrq");
		 String zy=request.getParameter("zy");
		 pstmt.setString(1,xh);
		 pstmt.setString(2,xm);
		 pstmt.setString(3,xb);
		 pstmt.setString(4,csrq);
		 pstmt.setString(5,zy);
		 pstmt.execute();
		}
		 catch(Exception e) {}
		 response.sendRedirect("chapter10/10-1.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
