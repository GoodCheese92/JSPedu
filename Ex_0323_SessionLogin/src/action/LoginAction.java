package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDAO;
import vo.MemberVO;

/**
 * Servlet implementation class LoginAction
 */
@WebServlet("/login.do")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// login.do?id=hong&pwd=1111
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		// id 검색에 성공했다면 현재 vo에는 name, pwd 등의 정보가 포함되어 있는 상태
		MemberVO vo = MemberDAO.getInstance().selectOne(id);
		
		String param = "";
		
		if(vo == null) {
			// 아이디가 존재하지 않는 경우
			param = "no_id";
			response.getWriter().print(param);
			return;
		}
		
		// 비밀번호 일치 여부 확인
		if(!vo.getPwd().equals(pwd)) {
			param = "no_pwd";
			response.getWriter().print(param);
			return;
		}
		
		// 아이디와 비밀번호에 문제가 없다면, vo정보를 session영역에 저장
		HttpSession session = request.getSession(); // 세션객체 생성
		
		// 세션은 서버의 메모리(ram)를 사용하기 때문에 많이 사용할 수록 브라우저를 느리게 만든다.
		session.setAttribute("user", vo);
		
		// 세션의 유지시간 30분으로 기본세팅 되어있다.
		// setMaxInactiveInterval을 통해 초단위로 유지시간을 변경해 줄 수 있다.
		// session.setMaxInactiveInterval(60 * 60); // 파라미터에 초가 들어간다.
		
		response.getWriter().print(param);
		
	} // end of service

} // end of class
