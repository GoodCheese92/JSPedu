package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Calculator
 */
@WebServlet("/calc.do")
public class Ex01_CalculatorAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// calc.do?su1=10&su2=5
		// 클라이언트 측에서 넘어온 su1, su2에 대한 파라미터 값을 받는다.
		int su1 = Integer.parseInt(request.getParameter("su1"));
		int su2 = Integer.parseInt(request.getParameter("su2"));

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
			out.print("<head>");
			out.print("</head>");
			out.print("<body>");
				out.printf("+결과 : %d<br>", su1 + su2);
				out.printf("-결과 : %d<br>", su1 - su2);
				out.printf("*결과 : %d<br>", su1 * su2);
				out.printf("/결과 : %d<br>", su1 / su2);
			out.print("</body>");
		out.print("</html>");

	} // end of service()

} // end of class
