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
 * Servlet implementation class CheckIdAction
 */
@WebServlet("/check_id.do")
public class CheckIdAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check_id.do?id=aaa
		String id = request.getParameter("id");
		
		// 아이디 중복검사
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String res = "yes";
		
		// 중복이 있으면 yes
		if(vo == null) {
			// id로 가입이 가능한 상태
			res = "no";
		}
		
		// 결과 res를 콜백메서드로 전달(json 형태로)
		String resultStr = String.format("[{'result':'%s'}]", res);
		// json구조를 배열 구조로 변경, 그래야 제대로 json구조로 변경된다. 
		
		// resultStr을 콜백메서드로 전송
		response.getWriter().print(resultStr);
		
	} // end of service()

} // end of class
