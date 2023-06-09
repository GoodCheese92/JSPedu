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
 * Servlet implementation class BoardReplyAction
 */
@WebServlet("/board_reply.do")
public class BoardReplyAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 댓글처리 서블릿
		request.setCharacterEncoding("utf-8");
		
		String page = request.getParameter("page");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		String ip = request.getRemoteAddr();

		BoardDAO dao = BoardDAO.getInstance();

		// 기준글 idx를 통해 댓글을 달고 싶은 원본글의 정보를 얻어온다.
		BoardVO baseVO = dao.selectOne(idx);

		// 기준글(baseVO)의 step보다 큰 값들은 모두 step = step + 1 처리
		dao.update_step(baseVO);

		// 댓글 정보를 VO에 저장
		BoardVO vo = new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		vo.setIp(ip);
		vo.setReadhit(0);

		// 댓글이 들어갈 위치 선정
		vo.setRef(baseVO.getRef());
		vo.setStep(baseVO.getStep() + 1);
		vo.setDepth(baseVO.getDepth() + 1);

		int res = dao.reply(vo);
		
		if (res == 1) {
			response.sendRedirect("board_list.do?page=" + page);
		}

	} // end of service

} // end of class
