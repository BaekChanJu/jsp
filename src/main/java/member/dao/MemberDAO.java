package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class MemberDAO {
	
	private MemberDAO() throws Exception{
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
	}
	
	//스태틱으로 만들어서 클래스로 접근하게 하는것임 그럼 메인란에서 객체생성없이 호출로 가져올 수있음
	//스태틱의 특성을 활용한거임
	//아직 맴버다오 객체생성을 안해서 사용을 할수없으니 객체생성 폼을 만들자

	static MemberDAO memberDAO = null; 
	public static MemberDAO getInstance() throws Exception{
		//스태틱으로 선언한이유는 클래스로 접근하려고한거다 객체생성없이 jsp쪽 란에서
		//이안에 객체를 만든다 if 가 널일때로 그래서 생성된 객체를담은 empDAO 를 리턴해줌
		if(memberDAO == null)memberDAO = new MemberDAO(); //객체생성을 여따가 하는거임 함수안에다
		return memberDAO;
	}
	
	
	
	public void insert(MemberVO vo) throws Exception{
		Connection con = null;
		PreparedStatement stmt = null;
		
		
		try { 
			
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
		         
		    con = DriverManager.getConnection(url, user, pass);
			
		    String sql = "INSERT INTO member(realname, nickname, myemail, myage)  VALUES(?, ?, ?, ?)";
		    
		    
		    stmt  = con.prepareStatement(sql);
		    
		    //이미 아까 객체만들면서 셋으로 값들을 저장했으니 ? 에는 게터로 값을 가져와 주면되는거구나!
		    stmt.setString(1, vo.getRealname());
		    stmt.setString(2, vo.getNickname());
		    stmt.setString(3, vo.getMyemail());
		    stmt.setInt(4, vo.getMyage());
			
		    stmt.executeUpdate(); 
			
		
			
		} finally { 
	    	 stmt.close();
	         con.close();
	       
	    } //end try.catch
	}
	
	
}//end of main

