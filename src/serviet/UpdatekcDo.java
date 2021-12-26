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
 * Servlet implementation class UpdatekcDo
 */
@WebServlet("/UpdatekcDo")
public class UpdatekcDo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatekcDo() {
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
	 String sql="update kc set kcm=?,xs=?,xf=? where kcdh=?";
	 PreparedStatement pstmt=conn.prepareStatement(sql);
	 String kcdh=request.getParameter("kcdh");
	 String kcm=request.getParameter("kcm");
	 String xs=request.getParameter("xs");
	 String xf=request.getParameter("xf");
	 pstmt.setString(1,kcm);
	 pstmt.setString(2,xs);
	 pstmt.setString(3,xf);
	 pstmt.setString(4,kcdh);
	 pstmt.execute();
	}
	catch(Exception e) {}
	 response.sendRedirect("chapter10/Course.jsp");
}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
