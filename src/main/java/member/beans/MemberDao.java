package member.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDao {

	
	// DB 연결시  관한 변수 

	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String		dbUser		=	"scott";
	private static final String		dbPass		=	"tiger";

		
	private static MemberDao memberDao;
	
	public static MemberDao getInstance() throws MemberException
	{
		if( memberDao == null )
		{
			memberDao =  new MemberDao();
		}
		return memberDao;
	}
	

	private MemberDao() throws MemberException
	{
			
		try{
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
		}catch( Exception ex ){
			throw new MemberException("DB 연결시 오류  : " + ex.toString() );	
		}
	}
	
	/*******************************************
	 * * 회원관리테이블 MEMBERTEST 에  회원정보를 입력하는 함수
	 * @param rec
	 * @throws MemberException
	 */
	public void insertMember( Member rec ) throws MemberException
	{
		Connection con = null;
		PreparedStatement stmt = null;
		try {
			 // 0. 연결 객체 얻어오기	
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
		    
		    con = DriverManager.getConnection(url, user, pass);
			 // 1. sql 문장 만들기 ( insert문 )
		    String sql = "INSERT INTO memberTest(id, password, name, tel, addr)  VALUES(?, ?, ?, ?, ?)";
			 // 2. sql 전송 객체 만들기
		    stmt  = con.prepareStatement(sql);
		    
		    stmt.setString(1, rec.getId()  );
		    stmt.setString(2, rec.getPassword()  );
		    stmt.setString(3, rec.getName()  );
		    stmt.setString(4, rec.getTel()  );
		    stmt.setString(5, rec.getAddr()  );
	
		    
			 // 3. sql 전송
		    stmt.executeUpdate(); 
			 // 4. 객체 닫기
		    stmt.close();
	         con.close();  
		} catch ( Exception ex ){
			
			throw new MemberException("멤버 입력시 오류  : " + ex.toString() );			
		}			
	}
	
	/**********************************************************
	 * * 회원관리테이블 MEMBERTEST에서 기존의 id값과 중복되는지 확인하는 함수
	 */
	public boolean isDuplicatedId( String id ) throws MemberException
	{
		boolean flag = false;
		Connection con = null;
		PreparedStatement stmt = null;
		
		try{
			
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
		    
		    con = DriverManager.getConnection(url, user, pass);
		    
			
			String sql = "SELECT * FROM memberTest WHERE id =?";
			
			stmt = con.prepareStatement(sql);
			stmt.setString(1, id);
			
			ResultSet rs = stmt.executeQuery();

			
			if(rs.next()) flag = true;
			
			rs.close();
			stmt.close();
			con.close();
			
		}catch( Exception ex ){
			throw new MemberException("중복아이디 검사시 오류  : " + ex.toString() );			
		}
			
		return flag;
	}
}
