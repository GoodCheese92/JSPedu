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
 * Servlet implementation class BoardInsertAction
 */
@WebServlet("/board_insert.do")
public class BoardInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();
		int readhit = 0;
		int step = 0;
		int depth = 0;
		
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setReadhit(readhit);
		vo.setStep(step);
		vo.setDepth(depth);
		
		int res = BoardDAO.getInstance().insert(vo);
		
		if(res == 1) {
			response.sendRedirect("board_list.do");
		}
		
	} // end of service

} // end of class
