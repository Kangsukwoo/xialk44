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
	
	//Ŀ�ؼ� Ǯ
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
	//db����
			try {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				System.out.println("�ε� ����");
			}catch(ClassNotFoundException e){
				System.err.println("����̹��ε�����");
				e.printStackTrace();
			}
	}
	
	private Connection getConnection() {
		String urI = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "XIALK44";
		String password = "1234";
					
		try {
			con = DriverManager.getConnection(urI, user, password);
			System.out.println("���Ἲ��");
		}catch (SQLException e) {
			System.err.println("�������");
			e.printStackTrace();
		}
		
		return con;
		
	}//getConnection() end
	
	
	
	

}
