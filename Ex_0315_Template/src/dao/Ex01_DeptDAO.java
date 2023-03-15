package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.Ex01_DeptVO;

public class Ex01_DeptDAO {
	// DAO(Data Access Object) : DB 접근을 목표로 하는 클래스
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Ex01_DeptDAO single = null;
	
	private Ex01_DeptDAO() {

	} // end of constructor
	
	public static Ex01_DeptDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Ex01_DeptDAO();
		//생성된 객체정보를 반환
		return single;
	}
	
	// 부서테이블 조회
	public List<Ex01_DeptVO> selectList() {

		List<Ex01_DeptVO> list = new ArrayList<Ex01_DeptVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";

		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConncetion();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Ex01_DeptVO vo = new Ex01_DeptVO();
				//현재레코드값=>Vo저장

				//ArrayList추가
				list.add(vo);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return list;
	}
} // end of class
