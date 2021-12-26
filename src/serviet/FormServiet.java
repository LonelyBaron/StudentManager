package serviet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class FormServiet
 */
@WebServlet("/FormServiet")
public class FormServiet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormServiet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.setCharacterEncoding("utf-8");
		//PrintWriter pw=response.getWriter();
		//pw.print("hello world!");
		response.setCharacterEncoding("gbk");
		String xm=request.getParameter("xm");
		String mm=request.getParameter("mm");
		File f=new File("d:\\file","test.txt");
		FileWriter fw=new FileWriter(f);
		BufferedWriter bw=new BufferedWriter(fw);
		bw.write("您输入的姓名是："+xm+"   "+mm);
		bw.flush();
		bw.close();
		fw.close();
		PrintWriter pw=response.getWriter();
		pw.print("您输入的姓名是："+xm+"   "+mm);
		//if(xm.equals("zhangjian")&&mm.equals("123456"))
			//response.sendRedirect("chapter8/index.jsp");
		//else
			//response.sendRedirect("chapter8/8-1.html");
		//System.out.println("用户名："+xm);
		//System.out.println("密码："+mm);

	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
	}

}
