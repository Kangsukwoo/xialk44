package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
		String user = "sukwoo";
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
	
	
	public int insertBoard(BoardDTO dto) {
		
		StringBuilder sql = null;
		sql = new StringBuilder();
		sql.append(" INSERT INTO board01(seq, id, name, title, content, passwd, grpno)");
		sql.append(" VALUES(seq_seq.nextval,?,?,?,?,?, (SELECT NVL(MAX(seq),0)+1 FROM board01))");
		
		int su = 0;
		
		try {
			con = this.getConnection();
			ps = con.prepareStatement(sql.toString());
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getPasswd());
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
		
	}//insertBoard() end
	
	public int count(String col, String word) {
		
		StringBuilder sql = null;
		int cnt = 0;
		sql = new StringBuilder();
		sql.append(" SELECT COUNT(*) AS cnt FROM board01") ;		
		
		try {			
			if(word.length()>=1) {
				String search="";
				if(col.equals("id")) {
					search += " WHERE id LIKE '%" + word + "%' ";
		          }else if(col.equals("title")) {
		            search += " WHERE title LIKE '%" + word + "%' ";
		          }else if(col.equals("content")) {
		            search += " WHERE content LIKE '%" + word + "%' ";
		          }else if(col.equals("title_content")) {
		            search += " WHERE title LIKE '%" + word + "%'";
		            search += " OR content LIKE '%" + word + "%'";
		          }        
		    	  sql.append(search);
				}//if end
			
			con = this.getConnection();
			ps = con.prepareStatement(sql.toString());
			rs = ps.executeQuery();		
			
			if(rs.next()) {
		        cnt =rs.getInt("cnt");
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
		return cnt;
		
		
	}//count() end
	
	public ArrayList<BoardDTO>list(String col, String word, int nowPage, int recordPerPage) {
		
		ArrayList<BoardDTO>list = null;
		
		int startRow = ((nowPage-1) * recordPerPage) + 1 ;
	    int endRow   = nowPage * recordPerPage;
	    
	    StringBuilder sql = null;
		sql = new StringBuilder();
	    
	    try {
	    	con = this.getConnection();
	    	
	    	word = word.trim();
	    	
	    	if(word.length()==0) { //검색을 하지 않는 경우
		        sql.append(" SELECT seq,id,name,title,hit,content, passwd, logtime, r");
		        sql.append(" FROM( SELECT seq,id,name,title,hit,content, passwd, logtime, rownum as r");
		        sql.append("                FROM ( SELECT seq,id,name,title,hit,content, passwd, logtime");
		        sql.append("                              FROM board01");
		        sql.append("                              ORDER BY grpno DESC, ansnum ASC))");
		        sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
		      } else {
		        //검색을 하는 경우
		        sql.append(" SELECT seq,id,name,title,hit,content, passwd, logtime, r");
		        sql.append("              FROM( SELECT seq,id,name,title,hit,content, passwd, logtime, rownum as r");
		        sql.append("                           FROM ( SELECT seq,id,name,title,hit,content, passwd, logtime");
		        sql.append("                                         FROM board01");
		        
		        String search="";
		        if(col.equals("id")) {
		          search += " WHERE id LIKE '%" + word + "%'";
		        } else if(col.equals("title")) {
		          search += " WHERE title LIKE '%" + word + "%'";
		        } else if(col.equals("content")) {
		          search += " WHERE content LIKE '%" + word + "%'";
		        } else if(col.equals("title_content")) {
		          search += " WHERE title LIKE '%" + word + "%'";
		          search += " OR content LIKE '%" + word + "%'";
		        }
		        
		        sql.append(search);        
		        
		        sql.append("              ORDER BY grpno DESC, ansnum ASC");
		        sql.append("           )");
		        sql.append("     )");
		        sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
		      }//if end
	    	
	    	ps = con.prepareStatement(sql.toString());
	    	rs = ps.executeQuery();	    	
	    	if(rs.next()) {
	    		list = new ArrayList<>();
	    		do {
	    			BoardDTO dto = new BoardDTO();
	    			dto.setSeq(rs.getInt("seq"));
	    			dto.setId(rs.getString("id"));
	    			dto.setName(rs.getString("name"));
	    			dto.setTitle(rs.getString("title"));
	    			dto.setContent(rs.getString("content"));
	    			dto.setPasswd(rs.getString("passwd"));	  
	    			dto.setLogtime(rs.getString("logtime")); 	
	    			dto.setHit(rs.getInt("hit"));
	    			list.add(dto);
	    			
	    		}while(rs.next());
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
	    
	    return list;
	    
	}//list end();
	
	public int increaseHit(int seq) {
		
		String sql = "UPDATE board01 SET hit=hit+1 WHERE seq=?";
		int su = 0;
		
		try {
		
		con = this.getConnection();
		ps = con.prepareStatement(sql);
		ps.setInt(1, seq);
		su = ps.executeUpdate();
		
		}catch (SQLException e) {
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
		
		
	}//increaseHit() end
	
	
	

}
