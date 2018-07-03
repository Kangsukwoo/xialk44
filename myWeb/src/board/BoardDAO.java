package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	
	Connection con = null;
	PreparedStatement ps = null;
	private ResultSet rs;
	
	//커넥션 풀
/*	private static DataSource ds;	
	static {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		}catch (NamingException e) {
			e.printStackTrace();
		}		
	}*/
	
	public BoardDAO() {
	//db연결
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("로딩 성공");
			}catch(ClassNotFoundException e){
				System.err.println("드라이버로딩실패");
				e.printStackTrace();
			}
	}
	
	private Connection getConnection() {
		String urI = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "XIALK44";
		String password = "1234";
					
		try {
			con = DriverManager.getConnection(urI, user, password);
			System.out.println("연결성공");
		}catch (SQLException e) {
			System.err.println("연결실패");
			e.printStackTrace();
		}
		
		return con;
		
	}//getConnection() end
	
	
	
	

}
