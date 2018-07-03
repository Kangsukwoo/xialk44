package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	
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
	
	public MemberDAO() {
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
	
	public boolean insert(MemberDTO dto) {
		boolean check = false;
		
		String sql = "insert into member01 values(member01_seq.nextval,?,?,?,?,?,?,?)";
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getTel1());
			ps.setString(6, dto.getTel2());
			ps.setString(7, dto.getTel3());
			int su = ps.executeUpdate();
			if(su != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return check;
	}//insert() end

	
	public String login(MemberDTO dto) {
		String sql = "SELECT name FROM member01 WHERE id=? AND password=?";		
		String name = null;
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			rs = ps.executeQuery();					
			
			if(rs.next()) {
				name = rs.getString("name");
			}			
		}catch (SQLException e) {
		e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return name;	
	}//login() end	
	
	
	public MemberDTO memberInfo(String id) {		
		
		MemberDTO dto=null;
		String sql = "SELECT no, name, id, email, tel1, tel2, tel3 FROM member01 where id=?";
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);			
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			if(rs.next()){
				dto = new MemberDTO();
				dto.setNo(rs.getInt("no"));
				dto.setName(rs.getString("name"));				
				dto.setId(rs.getString("id"));
				dto.setEmail(rs.getString("email"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
			}			
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(con!=null) con.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		return dto;			
	}//select() end
	
	public boolean delete(String id) {
		
		String sql = "DELETE FROM member01 WHERE id = ?";
		
		boolean check = false;
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, id);
			System.out.println(id);
			if(ps.executeUpdate() != 0) {
				check = true;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return check;
		
	}//delete() end
	
	public int updateMember(MemberDTO dto) {
		
		String sql = "UPDATE member01 SET password = ?, name = ?, email = ?,tel1 = ?,tel2 = ?,tel3 = ? where no = ?";
			
		int su = 0;
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPassword());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getTel1());
			ps.setString(5, dto.getTel2());
			ps.setString(6, dto.getTel3());
			ps.setInt(7, dto.getNo());
			su = ps.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps != null) ps.close();
				if(con != null) con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return su;
		
	}//updateMember() end
	
	
		
}
