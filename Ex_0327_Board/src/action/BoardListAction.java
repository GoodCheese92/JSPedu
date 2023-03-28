package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/board_list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체목록 조회
		List<BoardVO> board_list = BoardDAO.getInstance().select();
		
		// DB에서 받아온 list를 바인딩, 포워딩
		request.setAttribute("board_list", board_list);
		
		// 세션에 기록되어 있는 check 정보를 삭제
		request.getSession().removeAttribute("check");
		
		// 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
	} // end of service()

} // end of class
