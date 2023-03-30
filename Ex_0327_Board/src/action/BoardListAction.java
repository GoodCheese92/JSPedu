package action;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import util.Common;
import util.Paging;
import vo.BoardVO;

/**
 * Servlet implementation class BoardListAction
 */
@WebServlet("/board_list.do")
public class BoardListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		// 첫 화면에는 파라미터가 없을 수도 있기 때문에 오류가 안나기 위해 처리
		// board_list.do?page=2
		// board_list.do?		--> null
		// board_list.do?page=	--> empty
		int nowPage = 1;
		String page = request.getParameter("page"); // int로 받으면 null인지 empty인지 확인이 되지 않기 떄문에 String으로 받는다.
		if(page != null && !page.isEmpty()) {
			nowPage = Integer.parseInt(page);
		}
		
		// 한 페이지에 표시될 게시물의 시작과 끝 번호를 계산
		// 1페이지 : 1 ~ 5 까지의 게시글
		// 2페이지 : 6 ~ 10 까지의 게시글
		int start = (nowPage - 1) * Common.Board.BLOCKLIST + 1;
		int end = start + Common.Board.BLOCKLIST - 1;
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("end", end);
		
		// 검색관련 내용
		String search = request.getParameter("search"); // 카테고리
		String search_text = request.getParameter("search_text");
		
		// 검색어가 입력되어 있는 경우
		if (search != null && !search.equalsIgnoreCase("all")) {
			switch (search) {
			case "name_subject_content":
				map.put("name", search_text);
				map.put("subject", search_text);
				map.put("content", search_text);
				break;
			case "name":
				map.put("name", search_text);
				break;
			case "subject":
				map.put("subject", search_text);
				break;
			case "content":
				map.put("content", search_text);
				break;
			default:
				break;
			} // switch
		} // if
		
		// 전체목록 조회
		List<BoardVO> board_list = null; 
		BoardDAO dao = BoardDAO.getInstance();
		
		board_list = dao.select(map);
		
		// 페이지 메뉴 생성
		int row_total = dao.getRowTotal(map);
		
		// 하단 페이지 메뉴 생성
		String search_param = String.format("search=%s&search_text=%s", search, search_text); 
		
		String pageMenu = Paging.getPaging("board_list.do", nowPage, row_total, search_param, Common.Board.BLOCKLIST, Common.Board.BLOCKPAGE);
		
		// pageMenu를 바인딩
		request.setAttribute("pageMenu", pageMenu);
		
		// DB에서 받아온 list를 바인딩, 포워딩
		request.setAttribute("board_list", board_list);
		
		// 세션에 기록되어 있는 check 정보를 삭제
		request.getSession().removeAttribute("check");
		
		// 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("board_list.jsp");
		disp.forward(request, response);
		
	} // end of service()

} // end of class
