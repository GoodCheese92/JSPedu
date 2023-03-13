package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex05_juminAction
 */
@WebServlet("/jumin.do")
public class Ex05_juminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String jumin = request.getParameter("jumin");
		// System.out.println(jumin);
		String gender = "";
		// System.out.println(jumin.charAt(7) - '0');
		if((jumin.charAt(7) - '0')%2 == 1) {
			gender = "남자";
		} else {
			gender = "여자";
		}
		
		String season = "";
		// System.out.println(jumin.charAt(2));
		// System.out.println(jumin.charAt(4));
		String birth_month = jumin.substring(2, 4);
		// System.out.println(birth_month);
		
		switch (birth_month) {
		case "12": case "01": case "02":
			season = "겨울";
			break;
		case "03": case "04": case "05":
			season = "봄";
			break;
		case "06": case "07": case "08":
			season = "여름";
			break;
		case "09": case "10": case "11":
			season = "가을";
			break;
		default:
			season = "잘못된 정보입니다.";
			break;
		} // switch
		
		response.setContentType("text/html; charset=utf-8");		
		PrintWriter out = response.getWriter();
		out.print("<html>");
		out.print("<head>");
			out.print("<style>");
				out.print("table{border-collapse: collapse; border-width:3px;"
						+ "width: 300px; height:200px; text-align:center;}"
						+ " margin:50px auto;");
			out.print("</style>");
			out.print("<title>주민등록번호 정보사이트</title>");
		out.print("</head>");
		out.print("<body>");
			out.print("<table border=\"1\">");
				out.print("<tr>");
					out.print("<td>"+"주민번호"+"</td>");
					out.print("<td>"+jumin+"</td>");
				out.print("</tr>");
				out.print("<tr>");
					out.print("<td>성별</td>");
					out.print("<td>"+gender+"</td>");
				out.print("</tr>");
				out.print("<tr>");
					out.print("<td>계절</td>");
					out.print("<td>"+season+"</td>");
				out.print("</tr>");
			out.print("</table>");
		out.print("</body>");
		out.print("</html>");
		
	} // end of service

} // end of class
