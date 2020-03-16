package com.spoon.loststations.service;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.CommentsDAO;
import com.spoon.loststations.dao.EMsDAO;
import com.spoon.loststations.dao.LikesDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.EM;
import com.spoon.loststations.vo.Like;
import com.spoon.loststations.vo.QuizInfo;

@Service
public class LikesServiceImpl implements LikesService {
	
	private LikesDAO likesDAO;
	private QuizInfosDAO quizInfosDAO;
	private CommentsDAO commentsDAO;
	private EMsDAO emsDAO;
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}
	
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	
	public void setEmsDAO(EMsDAO emsDAO) {
		this.emsDAO = emsDAO;
	}
	
	@Override
	public int likeUpdate(Like like) {
		
		likesDAO.delete(like);
		
		likesDAO.insert(like);
		
		quizInfosDAO.updateLikes(like.getContentNo());
		
		quizInfosDAO.updateDislikes(like.getContentNo());
		
		return 0;
	}
	
	@Override
	public Map<String, Object> likeUpdate(Like like, String clickType) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int resultDelete = likesDAO.delete(like); // delete 수행 후
		int resultInsert = 0;
		if (clickType.equals("unchecked")) { // 좋아요가 눌렸는지, 안눌렸는지 판단 후 눌렸으면
			resultInsert = likesDAO.insert(like); 
		} 
		
		like.setType("L");  // 타입을 Like로 세팅
		int likeCount = likesDAO.selectCount(like); // Like 개수를 받아온다
		
		like.setType("D"); // 타입을 Dislike로 세팅
		int dislikeCount = likesDAO.selectCount(like); // Dislike 개수를 받아온다
		
		
		if (like.getContentType().equals("C")) {
			Comment comment = new Comment();
			comment.setNo(like.getContentNo());
			comment.setLikes(likeCount);
			comment.setDislikes(dislikeCount);
			
			commentsDAO.update(comment);
		}else if(like.getContentType().equals("E")) {
			
			EM em = new EM();
			em.setNo(like.getContentNo());
			em.setLikes(likeCount);
			em.setDislikes(dislikeCount);
			
			emsDAO.likeUpdate(em);
		}else {
			quizInfosDAO.updateLikes(like.getContentNo());
			quizInfosDAO.updateDislikes(like.getContentNo());
			
			QuizInfo quizInfo = quizInfosDAO.selectOne(like.getContentNo());
			likeCount = quizInfo.getLikes();
			dislikeCount = quizInfo.getDislikes();
		}
		
		
		map.put("resultDelete", resultDelete);
		map.put("resultInsert", resultInsert);
		map.put("likeCount", likeCount);
		map.put("dislikeCount", dislikeCount);
		
		return map;
	}
	
	

}
