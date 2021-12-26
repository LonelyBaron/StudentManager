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
 * Servlet implementation class DeleteDo
 */
@WebServlet("/DeleteDo")
public class DeleteDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteDo() {
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
		 String sql="delete from xs where xh=?";
		 PreparedStatement pstmt=conn.prepareStatement(sql);
		 String xh=request.getParameter("xh");

		 pstmt.setString(1,xh);

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
