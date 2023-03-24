package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import service.MyBatisConnector;
import vo.GogekVO;

public class GogekDAO {
	// single-ton pattern: 
	// 객체1개만생성해서 지속적으로 서비스하자
	static GogekDAO single = null;

	public static GogekDAO getInstance() {
		//생성되지 않았으면 생성
		if (single == null)
			single = new GogekDAO();
		//생성된 객체정보를 반환
		return single;
	} // end of getInstance()
	
	SqlSessionFactory factory = null;
	
	private GogekDAO() {
		factory = MyBatisConnector.getInstance().getSessionFactory();
		
	} // end of constructor
	
	public List<GogekVO> select(){
		SqlSession sqlSession = factory.openSession();
		List<GogekVO> gogek_list = sqlSession.selectList("s.gogek_list");
		sqlSession.close();
		return gogek_list;
	} // end of select()
	
	public int delete(int idx) {
		SqlSession sqlSession = factory.openSession(true); // auto commit
		
		// sqlSession은 모든 메서드가 파라미터를 반드시 한개만 가질 수 있다.
		int res = sqlSession.delete("s.gogek_delete", idx);
		sqlSession.close();
		
		return res;
	}
	
} // end of class
