package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;

/**
 * Servlet implementation class MemberDelAction
 */
@WebServlet("/delete.do")
public class MemberDelAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// delete.do?idx=2;
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int success_row = MemberDAO.getInstance().delete(idx);
		
		if(success_row == 1) {
			response.getWriter();
		}
		
	} // end of service

} // end of class
