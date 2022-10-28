package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import temp.EmpDAO;
import temp.EmpVO;

public class MemberDAO {
	
	
	
	private MemberDAO() throws Exception{ 
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	
	
	static MemberDAO memberDAO = null; 
	public static MemberDAO getInstance() throws Exception{
		//스태틱으로 선언한이유는 클래스로 접근하려고한거다 객체생성없이 jsp쪽 란에서
		//이안에 객체를 만든다 if 가 널일때로 그래서 생성된 객체를담은 empDAO 를 리턴해줌
		if(memberDAO == null)memberDAO = new MemberDAO(); //객체생성을 여따가 하는거임 함수안에다
		return memberDAO;
	}
	
	
	
	public void insert(MemberVO vo) throws Exception{
		//변수선언 먼저해두기
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {
		String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
	    String user = "scott";
	    String pass = "tiger";
	         
	    con = DriverManager.getConnection(url, user, pass);
	    
	    String sql = "INSERT INTO member(realname, nickname, myemail, myage)  VALUES(?, ?, ?, ?)";
	    
	    
	    stmt  = con.prepareStatement(sql);
	    
	    stmt.setString(1, vo.getRealname());
	    stmt.setString(2, vo.getNickname());
	    stmt.setString(3, vo.getMyemail());
	    stmt.setInt(4, vo.getMyage());
		
	    stmt.executeUpdate(); 
	    
		 } finally { 
	    	 stmt.close();
	         con.close();
	       
	    } //end try.catch
	    
	    
	    
	}//end of insert

	
	
}//end of main

