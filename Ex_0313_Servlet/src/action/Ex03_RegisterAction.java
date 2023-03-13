package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex03_RegisterAction
 */
@WebServlet("/join.do")
public class Ex03_RegisterAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// join.do?id=aaa&pwd=1111&age=30
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		// 파라미터로 넘어온 값은 String이므로 Integer.parseInt()로 정수로 변경
		int age = Integer.parseInt(request.getParameter("age"));
		// System.out.println("id : " + id + ", pwd : " + pwd + ", age : " + age);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
		out.print("<title>join.do 페이지</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h1>회원가입 성공</h1>");
		out.print("ID : " + id + "<br>");
		out.print("PWD : " + pwd + "<br>");
		out.print("나이 : " + age);
		out.print("</body>");
		out.print("</html>");

	} // end of service

} // end of class
