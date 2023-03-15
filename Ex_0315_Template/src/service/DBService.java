package service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBService {
	// DB 접속 과정을 처리할 클래스
	// single-ton pattern:
	// 객체1개만생성해서 지속적으로 서비스하자
	static DBService single = null;

	DataSource ds;

	private DBService() {
		try {
			InitialContext ic = new InitialContext();
			Context ctx = (Context) ic.lookup("java:comp/env");
			ds = (DataSource) ctx.lookup("jdbc/oracle_test");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // end of constructor()

	public static DBService getInstance() {
		// 생성되지 않았으면 생성
		if (single == null)
			single = new DBService();
		// 생성된 객체정보를 반환
		return single;
	} // end of getInstance()

	public Connection getConncetion() {
		Connection conn = null;

		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return conn;
	} // end of getConnection

} // end of class
