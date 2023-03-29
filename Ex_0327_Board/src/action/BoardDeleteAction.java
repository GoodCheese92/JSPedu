package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardDeleteAction
 */
@WebServlet("/board_del.do")
public class BoardDeleteAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// board_del.do?idx=3
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		int res = BoardDAO.getInstance().update_delInfo(idx);
		
		// 삭제(된 것처럼)가 완료되었는지에 대한 결과를 콜백메서드로 보낸다.
		response.getWriter().print(res);
		
	} // end of service()

} // end of class
