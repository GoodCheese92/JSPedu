package action;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class FileUploadAction
 */
@WebServlet("/upload.do")
public class FileUploadAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String web_path = "/upload/";
		// 현재 프로젝트(WebApplication)를 관리하는 객체
		ServletContext app = request.getServletContext();
		
		// 상대경로 -> 절대경로로 변환
		String path = app.getRealPath(web_path);
		System.out.println("절대경로" + path);
		
		// 상대경로가 생기면 이름이 같은 폴더가 절대경로에도 생긴다!!
		// 클라이언트가 업로드하는 사진과 개발자가 쓰는 파일이 겹치지 않기 위해서
		
		// String path = "c:/upload";
		int max_size = 1024 * 1024 * 100; // 최대 업로드 용량
		
		// 파일을 포함한 업로드를 처리하기 위한 객체
		// cos.jar 라이브러리에 있는 클래스
		// 파일을 포함한 파라미터가 넘어온다면 MultipartRequest로 받아야 한다.
		MultipartRequest mr = new MultipartRequest(request, path, max_size, "utf-8", new DefaultFileRenamePolicy());
		// path : 저장경로, max_size : 최대 업로드 용량, "utf-8"은 한글 넘어오는 경우를 대비해서 설정
		// DefaultFileRenamePolicy() : 동일파일명 정책, 파일명이 중복됐을 때 파일명을 자동으로 변경해주는 클래스
		
		// 업로드된 파일 정보 얻어오기
		String filename = "no_file";
		
		File f = mr.getFile("photo");
		if(f != null) {
			filename = f.getName(); // 업로드 된 파일의 이름
		}
		
		// 파일 형식이 아닌 일반 파라미터 수신
		// String title = request.getParameter("title"); X
		String title = mr.getParameter("title"); // O
		
		// 파일 이름과 제목을 바인딩
		request.setAttribute("title", title);
		request.setAttribute("filename", filename);
		
		// 포워딩
		RequestDispatcher disp = request.getRequestDispatcher("ex01_result.jsp");
		disp.forward(request, response);
		
	} // end of service()

} // end of class
