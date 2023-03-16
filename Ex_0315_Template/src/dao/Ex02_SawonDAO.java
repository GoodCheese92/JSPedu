package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import service.DBService;
import vo.Ex02_SawonVO;

public class Ex02_SawonDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static Ex02_SawonDAO single = null;
	
	private Ex02_SawonDAO() {

	} // end of constructor
	
	public static Ex02_SawonDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new Ex02_SawonDAO();
		//생성된 객체정보를 반환
		return single;
	} // end of getInstance()
	
	// 사원 정보를 조회하기 위한 메서드
	public List<Ex02_SawonVO> selectList() {

		List<Ex02_SawonVO> list = new ArrayList<Ex02_SawonVO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM sawon";
		
		try {
			//1.Connection얻어온다
			conn = DBService.getInstance().getConnection();
			//2.명령처리객체정보를 얻어오기
			pstmt = conn.prepareStatement(sql);

			//3.결과행 처리객체 얻어오기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Ex02_SawonVO vo = new Ex02_SawonVO();
				//현재레코드값=>Vo저장
				vo.setSabun(rs.getInt("sabun"));
				vo.setSaname(rs.getString("saname"));
				vo.setDeptno(rs.getInt("deptno"));
				vo.setSajob(rs.getString("sajob"));
				vo.setSahire(rs.getString("sahire"));
				
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
	} // end of selectList()
	
} // end of class
