package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.BoardVO;

public class BoardDAO {
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static BoardDAO single = null;

	public static BoardDAO getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new BoardDAO();
		// 생성된 객체정보를 반환
		return single;
	} // end of getInstance()

	SqlSessionFactory factory = null;

	private BoardDAO() {
		factory = MyBatisConnector.getInstance().getSessionFactory();
	} // end of constructor
	
	// 전체게시물 조회
	public List<BoardVO> select(){
		SqlSession sqlSession = factory.openSession();
		
		List<BoardVO> board_list = sqlSession.selectList("b.board_list");
		sqlSession.close();
		
		return board_list;
	} // end of select()
	
	// 특정 번호 게시물 조회
	public BoardVO select(int idx){
		SqlSession sqlSession = factory.openSession();
		
		BoardVO vo = sqlSession.selectOne("b.board_select", idx);
		sqlSession.close();
		
		return vo;
	} // end of select()
	
	// 게시물 작성물 추가
	public int insert(BoardVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int res = sqlSession.insert("b.board_insert", vo);
		sqlSession.close();
		
		return res;
	}

} // end of class
