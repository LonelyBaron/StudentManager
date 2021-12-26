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
 * Servlet implementation class UpdatecjDo
 */
@WebServlet("/UpdatecjDo")
public class UpdatecjDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatecjDo() {
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
		 String sql="update cj set xh=?,kcdh=?,cj=? where id=?";
		 PreparedStatement pstmt=conn.prepareStatement(sql);
		 String id=request.getParameter("id");
		 String xh=request.getParameter("xh");
		 String kcdh=request.getParameter("kcdh");
		 String cj=request.getParameter("cj");
		 pstmt.setString(1,xh);
		 pstmt.setString(2,kcdh);
		 pstmt.setString(3,cj);
		 pstmt.setString(4,id);
		 pstmt.execute();
		}
		catch(Exception e) {}
		 response.sendRedirect("chapter10/Score.jsp");
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
