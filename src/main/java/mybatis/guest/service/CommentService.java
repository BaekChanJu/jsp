package mybatis.guest.service;

import java.util.*;

import mybatis.guest.model.Comment;
import mybatis.guest.session.CommentRepository;

public class CommentService {
	
	private static CommentService service;
	
	//그냥싱글톤
	private CommentService() {}
	public static CommentService getInstance(){
		if( service == null) service = new CommentService();
		return service;
	}
	
	// 모델단! 이제는 DAO가 아님
		//레포지토리를 사용함 - 요기를 DAO라 생각하자 
		//원래 다오란에서 막 sql 연동드라이브 뭐가있었음 이제는 마이바티즈로 오면서
		//레파지토리에서 진행
	//즉 다오이름이 레파지토리로 바뀐거임 걍ㄴ
	private CommentRepository reps = new CommentRepository();
	
	
	
	public List<Comment> selectComment(){
		
		//중간단 왜냐 서비스는 뭐처리하는 곳이아님 뷰 와 모델단 사이 중간역활
		 return reps.selectComment();
		
	}
	
	
	public Comment selectCommentByPrimaryKey(int cId) {
		return reps.selectCommentByPK(cId);
	}
	
	
	public void insertComment(Comment c) {
		reps.insertComment(c);
		
	}
	
	public void deleteComment(int cId) {
		reps.deleteComment(cId);
		
	}

}