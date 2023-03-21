package action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberListAction
 */
@WebServlet("/member_list.do")
public class MemberListAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원목록 가져오기
		List<MemberVO> member_list = MemberDAO.getInstance().selectList();
		
		// list를 request영역에 저장
		request.setAttribute("member_list", member_list); // 바인딩
		
		// 바인딩 된 정보를 출력하고자 하는 jsp로 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("member_list.jsp");
		disp.forward(request, response);
		
		// 저장하는 것 --> 바인딩, 저장한 것을 사용하는 곳 --> 포워딩
		
		
	} // end of service()

} // end of class
