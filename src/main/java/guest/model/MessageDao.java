package guest.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class MessageDao {

	// Single Pattern 
	private static MessageDao instance;
	
	// DB 연결시  관한 변수 
	private static final String 	dbDriver	=	"oracle.jdbc.driver.OracleDriver";
	private static final String		dbUrl		=	"jdbc:oracle:thin:@127.0.0.1:1521:xe";
	private static final String		dbUser		=	"scott";
	private static final String		dbPass		=	"tiger";
	
	
	
	
	//#####	 객체 생성하는 메소드 
		//싱글톤 패턴
	public static MessageDao	getInstance() throws MessageException{
		if( instance == null )
		{
			instance = new MessageDao();
		}
		return instance;
	}// end if getInstance
	
	
	
	
	private MessageDao() throws MessageException{
		try{
			
			/********************************************
				1. 오라클 드라이버를 로딩
					( DBCP 연결하면 삭제할 부분 )
			*/
		Class.forName(dbDriver);
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB 연결시 오류  : " + ex.toString() );	
		}
		
	}//end of MessageDao
	
	
	
	
	
	 //메세지를 입력하는 함수 - 입력하면 DB에 정보가 저장됨
	
	public void insert(Message rec) throws MessageException{
		Connection	 		con = null;
		PreparedStatement ps = null;
		try{

			// 1. 연결객체(Connection) 얻어오기
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
		         
		    con = DriverManager.getConnection(url, user, pass);
			// 2. sql 문장 만들기
		  	String sql = "INSERT INTO GuestTB(MESSAGE_ID,GUEST_NAME,PASSWORD,MESSAGE) VALUES(seq_guestTb_messageId.nextval,?,?,?)";
			// 3. 전송객체 얻어오기
		    ps  = con.prepareStatement(sql);
			// 4. 전송하기
		    ps.setString(1, rec.getGuestName());
		    ps.setString(2, rec.getPassword());
		    ps.setString(3, rec.getMessage());

		    
		    ps.executeUpdate(); 

	
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 입력시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}
	
	}//end of insert
	
	
	
	
	
	
	 //저장되었던  메세지 목록 전체를 얻어올 때 (인자가 없는)
	 
	public List<Message> selectList() throws MessageException{
		Connection	con = null;
		PreparedStatement ps = null;
		ResultSet rs = null; //SELECT문 일때만 사용되던 ResultSet
		List<Message> mList = new ArrayList<Message>(); //목록이 배열이기에
		boolean isEmpty = true;
		
		try{
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
			
		    con = DriverManager.getConnection(url, user, pass);
		   
		    
			String sql = "SELECT * FROM guesttb" ;
		 ps  = con.prepareStatement(sql);
		 rs = ps.executeQuery();

			while(rs.next()) {
				Message m = new Message();
				m.setMessageId(rs.getInt("MESSAGE_ID")); //sql의 명칭
				m.setGuestName(rs.getString("guest_Name"));
				m.setPassword(rs.getString("password"));
				m.setMessage(rs.getString("message"));
			
				mList.add(m); //만든 어레이 리스트에 붙히기
				isEmpty = false; //while문에 한번이라도 들어오면 false
				
			}
			
			//와일문 안돌았을경우 즉 트루로나왔을경우
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}//end of selectList - 인자없는
	
	
	
	
	

	/* -------------------------------------------------------
	 * 현재 페이지에 보여울 메세지 목록  얻어올 때 그 3개로 나눈
	 */
	public List<Message> selectList(int firstRow, int endRow) throws MessageException{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<Message> mList = new ArrayList<Message>();
		boolean isEmpty = true;
		
		//오버로딩 위는 인자가없음 여기는 있음
		try{
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
			
		    con = DriverManager.getConnection(url, user, pass);
		   
		    //어려운 sql ㅠ
			String sql = "SELECT * FROM guesttb WHERE message_id IN (select message_id from(select rownum as rnum,message_id from (select message_id  From guesttb order by message_id desc)) where rnum>=? and rnum<=?) ORDER BY message_id DESC" ;
		 ps  = con.prepareStatement(sql);
		 
		 ps.setInt(1, firstRow);
		 ps.setInt(2, endRow);
		 
		 rs = ps.executeQuery();

			while(rs.next()) {
				Message m = new Message();
				m.setMessageId(rs.getInt("MESSAGE_ID")); //sql의 명칭
				m.setGuestName(rs.getString("guest_Name"));
				m.setPassword(rs.getString("password"));
				m.setMessage(rs.getString("message"));
			
				mList.add(m);
				isEmpty = false; //while문에 한번이라도 들어오면 false
				
			}
			
			
			if( isEmpty ) return Collections.emptyList();
			
			return mList;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}////end of selectList - 인자있는 페이지수 넘기기용
	
	
	
	/* -------------------------------------------------------
	 * 메세지 전체 레코드 수를 검색
	 */
	
	public int getTotalCount() throws MessageException{
		Connection	 		con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		int count = 0; 

		try{
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
			
		    con = DriverManager.getConnection(url, user, pass);
		   
			
			String sql = "SELECT count(*) as CNT FROM guesttb";
			
			 ps  = con.prepareStatement(sql);
			 rs = ps.executeQuery();
			 
			 //별칭으로 만든 CNT녀석을 카운터에 담아서 리턴한다
			 // 아까 리설트와같이 이런녀석들 리턴할때 멤버변수로 초기화 해놓고 집어넣고 리턴하는 
			 //폼을 계속 보인다 기억하자
			if(rs.next()) {
				count =  rs.getInt("CNT"); 
			}
			

			return  count;
			
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 목록 검색시 오류  : " + ex.toString() );	
		} finally{
			if( rs   != null ) { try{ rs.close();  } catch(SQLException ex){} }
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}			
	}
	
	/*
	 * 메세지 번호와 비밀번호에 의해 메세지 삭제
	 */
	public int delete( int messageId, String password ) throws MessageException
	{
		int result = 0;
		Connection	 		con = null;
		PreparedStatement ps = null;
		try{
			String url = "jdbc:oracle:thin:@192.168.0.48:1521:xe"; //이방법 고정
		    String user = "scott";
		    String pass = "tiger";
		         
		    con = DriverManager.getConnection(url, user, pass);
			
			String sql = "DELETE FROM guesttb WHERE message_id=? AND password=?";
			
			ps  = con.prepareStatement(sql);
			
			//메세지 번호와 비밀번호에 의해 메세지 삭제가 되도록 에초에 메시지아이디는 히든이었고 패스워드칸은존재한다
				//당연히 2개를 받아와야 삭제를 하지!
			ps.setInt(1, messageId);
			ps.setString(2,password);
			
			//리설트에 전송을 넣어줘야 리턴을하지!!! 
			result = ps.executeUpdate(); 
			
			ps.close();
			
			return result;
		}catch( Exception ex ){
			throw new MessageException("방명록 ) DB에 삭제시 오류  : " + ex.toString() );	
		} finally{
			if( ps   != null ) { try{ ps.close();  } catch(SQLException ex){} }
			if( con  != null ) { try{ con.close(); } catch(SQLException ex){} }
		}		
	}
}
