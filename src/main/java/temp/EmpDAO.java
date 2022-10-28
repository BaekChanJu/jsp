package temp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class EmpDAO {

	//이 생성자함수 다른대서 못 가따쓰게 하려고 프라이빗으로선언함
	//jsp란에서 그래서 객체생성하면 오류남 당연히 못찾는거임 
	//그럼 클래스로 찾아오는 방법 싱글톤을 사용해야함
	private EmpDAO() throws Exception{ 
		//한번만하기위해 드라이버 로딩 생성자 안에 기술
		 Class.forName("oracle.jdbc.driver.OracleDriver");
	}
	
	

	static EmpDAO empDAO = null; //static은 스태틱만 접근가능하니 변수명앞에 스태틱
	public static EmpDAO getInstance() throws Exception{
		//스태틱으로 선언한이유는 클래스로 접근하려고한거다 객체생성없이 jsp쪽 란에서
		//이안에 객체를 만든다 if 가 널일때로 그래서 생성된 객체를담은 empDAO 를 리턴해줌
		if(empDAO == null)empDAO = new EmpDAO(); //객체생성을 여따가 하는거임 함수안에다
		return empDAO;
	}
	
	
	
	public void insert(EmpVO vo) throws Exception{
		//변수선언 먼저해두기
		Connection con = null;
		PreparedStatement stmt = null;
		
		try {

		//2.연결객체 얻오오기
		  String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
	      String user = "scott";
	      String pass = "tiger";
	         
	     con = DriverManager.getConnection(url, user, pass);
		//3.sql작성
	
	  	String sql = "INSERT INTO emp(empno, ename, deptno, job, sal)  VALUES(?, ?, ?, ?, ?)";
	  	
		//4.전송객체 얻어오기 ? 에 값지정
	    stmt  = con.prepareStatement(sql);
	     
	    stmt.setInt(1, vo.getEmpno());
	    stmt.setString(2, vo.getEname());
	    stmt.setInt(3, vo.getDeptno());
	    stmt.setString(4, vo.getJob());
	    stmt.setInt(5, vo.getSal());
	    
		//5.전송
	   stmt.executeUpdate(); 
		//6.닫기
    } finally { 
    	 stmt.close();
         con.close();
       
    } //end try.catch
}
}
