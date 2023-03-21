package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class MemberInsertAction
 */
@WebServlet("/insert.do")
public class MemberInsertAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// insert.do?id=aaa&pwd=1111&....
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		// DAO로 전달할 파라미터들을 vo로 묶자
		MemberVO vo = new MemberVO();
		vo.setId(id);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setAddr(addr);
		
		int n = MemberDAO.getInstance().insert(vo);
		// System.out.println(n);
		if(n == 1) {
			// 모든 정보를 가져올 수 있는 페이지로 가야 한다.
			response.sendRedirect("member_list.do");
		}
		
	} // end of service()

} // end of class
