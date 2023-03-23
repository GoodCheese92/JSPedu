package action;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.PhotoDAO;
import vo.PhotoVO;

/**
 * Servlet implementation class PhotoListAction
 */
// 서버를 죽이면 절대경로가 변경되므로 꼭 백업 후 서버를 죽이도록 하자
@WebServlet("/list.do")
public class PhotoListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 전체목록 조회
		List<PhotoVO> list = PhotoDAO.getInstance().selectList();
		
		// 조회를 마친 list를 request영역에 바인딩
		request.setAttribute("list", list);
		
		// 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("photo_list.jsp");
		disp.forward(request, response);
		
	} // end of service()

} // end of class
