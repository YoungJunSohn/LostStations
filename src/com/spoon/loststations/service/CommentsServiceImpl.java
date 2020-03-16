package com.spoon.loststations.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.CommentsDAO;
import com.spoon.loststations.dao.LikesDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.Like;
import com.spoon.loststations.vo.PageVO;

@Service
public class CommentsServiceImpl implements CommentsService{
	
	private CommentsDAO commentsDAO;
	private PaginateUtil paginateUtil;
	private LikesDAO likesDAO;
	
	public void setCommentsDAO(CommentsDAO commentsDAO) {
		this.commentsDAO = commentsDAO;
	}
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	public void setLikesDAO(LikesDAO likesDAO) {
		this.likesDAO = likesDAO;
	}
	
	//의견 입력
	@Override
	public Map<String, Object> register(Comment comment) {
		
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		map.put("comments", commentsDAO.insert(comment));
		
		return map;
	}
	
	//의견 리스트 불러오기
	@Override
	public Map<String, Object> commentList(int page, int qiNo, int userNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		
		int pageNo = 1;
		if(page!=0) {
			try {
				pageNo = page;
			}catch(Exception e) {
				System.out.println("숫자넣어!!");
			}//try~catch end
		}//if end
		int numPage = 5; //페이지에 보여질 게시물 수	
		int numBlock = 5; //페이지에 보여질 블록 수
		
		PageVO pageVO = new PageVO(pageNo,numPage);	
		pageVO.setQiNo(qiNo);
		
		String url = "quizDetailView.jsp";
		String param = "pageNo=";
		
		List<Comment> list = commentsDAO.selectList(pageVO);
		
		//좋아요부분
		Like like = new Like();
		like.setUserNo(userNo);
		like.setContentType("C"); // 의견에 대한 타입
		
		// 댓글 하나하나에 대한 좋아요 타입 setting
		for(Comment comment : list) {
			
			like.setContentNo(comment.getNo());
			Like likeOne = likesDAO.selectOne(like);
			
			if(likeOne!=null) { // 좋아요 누른게 있을 경우
				comment.setLikeConfirm(likeOne.getType()); // 좋아요, 싫어요 타입을 얻은 후 세팅(L,D)
			} else { // 좋아요 누른게 없을 경우
				comment.setLikeConfirm("N"); // 타입 세팅을 N으로
			}//if ~ else end
		}//for end
		
		map.put("list", list);
				
		int total = commentsDAO.selectListTotal(qiNo);
		
		String paginate = paginateUtil.getPaginate(pageNo, total, numPage, numBlock, url, param);

		map.put("paginate", paginate);
		
		return map;
	}

}
