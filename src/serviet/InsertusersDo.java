package serviet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.Mydb;

/**
 * Servlet implementation class InsertusersDo
 */
@WebServlet("/InsertusersDo")
public class InsertusersDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertusersDo() {
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
		 String sql="insert into yh values(?,?,?,?)";
		 PreparedStatement pstmt=conn.prepareStatement(sql);
		 String id=request.getParameter("id");
		 String yhm=request.getParameter("yhm");
		 String mm=request.getParameter("mm");
		 String qx=request.getParameter("qx");
		 pstmt.setString(1,id);
		 pstmt.setString(2,yhm);
		 pstmt.setString(3,mm);
		 pstmt.setString(4,qx);
		 pstmt.execute();
		}
		 catch(Exception e) {}
		 response.sendRedirect("chapter10/Users.jsp");
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
