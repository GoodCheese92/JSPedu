package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex04_calculatorAction
 */
@WebServlet("/calc.do")
public class Ex04_calculatorAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
			out.print("<title>계산결과 페이지</title>");
		out.print("</head>");
		out.print("<body>");
			out.print("+ 결과 : " + (su1 + su2) + "<br>");
			out.print("- 결과 : " + (su1 - su2)+ "<br>");
			out.print("* 결과 : " + (su1 * su2)+ "<br>");
			out.print("/ 결과 : " + (su1 / su2)+ "<br>");
		out.print("</body>");
		out.print("</html>");
		
		
		
		
	} // end of service()

} // end of class
