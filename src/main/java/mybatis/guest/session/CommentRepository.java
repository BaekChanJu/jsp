package mybatis.guest.session;

import java.io.*;
import java.util.*;

import mybatis.guest.model.Comment;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.*;

//원래 여기는 다오라 커넥션가져 오고 등등인데 아래 보면
public class CommentRepository 
{
	//	private final String namespace = "CommentMapper";

	private SqlSessionFactory getSqlSessionFactory() {
		
		InputStream inputStream;
		try {
			inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		} catch (IOException e) {
			throw new IllegalArgumentException(e);
		}
		SqlSessionFactory sessFactory =  new SqlSessionFactoryBuilder().build(inputStream);
		return sessFactory;
	}
	

	public List<Comment> selectComment(){
		//JDBC 에서 Connection - 연결객체라 부르던 이걸 여기서는?
		//SqlSession 이라고 부릅니다!
		//위 공장을 통해 커넥션을 열어줘!
		//마이바티즈로 인해 그냥 가져온거임 ~
		SqlSession session = getSqlSessionFactory().openSession();
		
		try{
			//selectList 여러개 받을때! 메퍼이름한번 보고오자
			//메퍼의 별칭과 VO클래스 저장한 별칭 두개 쓴거임
			return session.selectList("CommentMapper.selectComment");
		}finally {
			session.close(); //연결객체 반환임
		}
	}// end of  selectComment
	
	public Comment selectCommentByPK(int commentNo) {
		//기본적으로 세션얻어오기
		SqlSession session = getSqlSessionFactory().openSession();
		
		try{
			//해쉬맵 없어도 실행됨 조건비교용
			HashMap map = new HashMap();
			//commentNO라는 녀석의 commentNO 값
			map.put("commentNo", commentNo);
			
			Comment c = session.selectOne("CommentMapper.selectCommentByPK", map);
			return c;
		}finally {
			session.close(); //연결객체 반환임
		}
		
	}//end of selectCommentByPK
	
	
	public void insertComment(Comment c) {
		SqlSession session = getSqlSessionFactory().openSession();
		try{
			//입력은 insert
			//이름이 길면 이렇게 변수화 가능
			String statement = "CommentMapper.insertComment";
			//넘어온 값 c까지 받아주기 
			int  result = session.insert(statement, c);
			if(result>0) session.commit(); //마이바티즈는 자동커밋이 아님
		}finally {
			session.close(); //연결객체 반환임
		}
		
	}//end of  insertComment
	
	
	public void deleteComment(int cId) {
		SqlSession session = getSqlSessionFactory().openSession();
		try{
			//입력은 insert
			//이름이 길면 이렇게 변수화 가능
			String statement = "CommentMapper.deleteComment";
			//넘어온 값 c까지 받아주기 
			int  result = session.insert(statement, cId);
			if(result>0) session.commit(); //마이바티즈는 자동커밋이 아님
		}finally {
			session.close(); //연결객체 반환임
		}
		
	}//end of  insertComment
	
}
