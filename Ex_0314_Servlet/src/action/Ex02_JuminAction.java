package action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Ex02_Jumin
 */
@WebServlet("/jumin.do")
public class Ex02_JuminAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jumin.do?jumin=801111-2222222
		String jumin = request.getParameter("jumin");
		char gender = jumin.charAt(7); // '1' '2' '3' '4'
		String genResult = "남자";
		
		// '1'은 아스키코드로 홀수이다.
		if(gender % 2 == 0) {
			genResult = "여자";
		}
		
		String season = jumin.substring(2, 4);
		String seasonResult = "";
		switch(season) {
		case "01": case "02": case "12":
			seasonResult = "겨울";
			break;
		case "03": case "04": case "05":
			seasonResult = "봄";
			break;
		case "06": case "07": case "08":
			seasonResult = "여름";
			break;
		case "09": case "10": case "11":
			seasonResult = "가을";
			break;
		}
		
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		
		out.print("<html>");
			out.print("<body>");
				out.print("<table border='1' align='center'>");
					out.print("<tr align='center'>");
						out.print("<td>주민번호</td>");
						out.printf("<td>%s</td>", jumin);
					out.print("</tr>");
					out.print("<tr align='center'>");
						out.print("<td>성별</td>");
						out.printf("<td>%s</td>", genResult);
					out.print("</tr>");
					out.print("<tr align='center'>");
						out.print("<td>계절</td>");
						out.printf("<td>%s</td>", seasonResult);
					out.print("</tr>");
				out.print("</table>");
			out.print("</body>");
		out.print("</html>");
	} // end of service

} // end of class
