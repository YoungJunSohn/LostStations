package com.spoon.loststations.controller;

import java.net.UnknownHostException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.spoon.loststations.service.AnswersService;
import com.spoon.loststations.service.ChoicesService;
import com.spoon.loststations.service.CommentsService;
import com.spoon.loststations.service.EMsService;
import com.spoon.loststations.service.LikesService;
import com.spoon.loststations.service.QuizInfosService;
import com.spoon.loststations.service.ReportsService;
import com.spoon.loststations.service.UsersService;
import com.spoon.loststations.vo.Cert;
import com.spoon.loststations.vo.Comment;
import com.spoon.loststations.vo.EM;
import com.spoon.loststations.vo.Like;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.Report;
import com.spoon.loststations.vo.User;

@RestController
@RequestMapping("/ajax")
public class AjaxController {
	private QuizInfosService quizInfosService;

	public void setQuizInfosService(QuizInfosService quizInfosService) {
		this.quizInfosService = quizInfosService;
	}
	
	private UsersService userservice;
	
	public void setUserservice(UsersService userservice) {
		this.userservice = userservice;
	}
	
	private AnswersService answersService;
	
	public void setAnswersService(AnswersService answersService) {
		this.answersService = answersService;
	}
	
	//wogus
	@RequestMapping(value="/inquiry/{no}/reply", method=RequestMethod.GET)
	public Map<String, Object> reply(@PathVariable int no) {
		
		return answersService.getReply(no);
	}
	
	//********************** 영준 start ****************************
	private ChoicesService choicesService;
	
	
	public void setChoicesService(ChoicesService choicesService) {
		this.choicesService = choicesService;
	}
		
		
		/* 채택 탭을 눌렀을 때 문제 리스트 출력 */
		@RequestMapping(value="/user/{no}/quiz/adopt/page/{adoptPageNo}", method=RequestMethod.GET)
		public Map<String, Object> selectUserAdoptQuizDetail(
				@PathVariable int no,
				@PathVariable int adoptPageNo,
				int userNo ,
				int qiNo){
			return choicesService.getList(adoptPageNo, userNo, qiNo);
		}
		/* 채택 탭의 문제를 눌렀을 때 해당 문제 디테일 출력 */
		@RequestMapping(value="/user/{no}/quiz/adopt/{qiNo}", method=RequestMethod.GET)
		public Map<String, Object> getDetail(
				@PathVariable int no,
				@PathVariable int qiNo){
			 	
				//System.out.println(no);
				System.out.println("ajax 컨트롤러에서 넘어가는 qiNo :"+qiNo);
			
			return choicesService.getDetail(qiNo);
		};
		
		/* 검증탭을 눌렀을 때 문제 리스트 출력 */
		@RequestMapping(value="/user/{no}/quiz/verify/page/{verifiPageNo}", method=RequestMethod.GET)
		public Map<String, Object> getVerifingList(
				@PathVariable int no, 
				@PathVariable int verifiPageNo, 
				int userNo, 
				int sort){
			
			return quizInfosService.getVerifingList(no, verifiPageNo, userNo, sort);
		}
		/* 프로필 사진 업로드 produces: 한글깨짐 방지 */
		@RequestMapping(value="/user/{no}/profile/upload", 
				method=RequestMethod.POST, produces="application/json;charset=UTF-8")
		public String uploadProfile(HttpServletRequest request,MultipartFile profile,
				@PathVariable int no,HttpSession session){
			
			return userservice.setProfile(no, request, profile,session);
		}//프로필 사진 업로드 end
		
		//프로필 사진 기본이미지로
		@RequestMapping(value="/user/{no}/profile",
				method=RequestMethod.POST,
				produces="application/json;charset=UTF-8")
		public String setDefaultImg(HttpSession session) {
			
			return userservice.setProfileDefault(session);
			
		}//프사내림 end
		
		
		//********************** 영준 end ****************************
	
	//********************** 수정 ****************************
	
	private ReportsService reportsService;
	private CommentsService commentsService;
	private LikesService likesService;
	private EMsService emsService;
	
	public void setReportsService(ReportsService reportsService) {
		this.reportsService = reportsService;
	}
	
	public void setCommentsService(CommentsService commentsService) {
		this.commentsService = commentsService;
	}
	
	public void setLikesService(LikesService likesService) {
		this.likesService = likesService;
	}
	
	public void setEmsService(EMsService emsService) {
		this.emsService = emsService;
	}
	
	@RequestMapping(value = "/report", method = RequestMethod.POST)
	public Map<String, Object> report(Report report) {
		return reportsService.getOne(report);
	}
	
	//댓글 등록
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public Map<String, Object> commentRegister(Comment comment) {
		return commentsService.register(comment);
	}
	
	//댓글 리스트 가져오기
	@RequestMapping(value = "/quiz/{no}/comment/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> commentList(@PathVariable int page,
			@PathVariable int no, int userNo) {
		return commentsService.commentList(page, no, userNo);
	}
	
	//댓글 좋아요
	@RequestMapping(value = "/like", method = RequestMethod.POST)
	public Map<String, Object> commentLikes(Like like, String clickType) {
		return likesService.likeUpdate(like,clickType);
	}
	
	//문제오류 등록
	@RequestMapping(value = "/errorComment", method = RequestMethod.POST)
	public boolean errerCommentRegister(int qiNo,int userNo,
			String type,  String category, String question,
			String explanationQ, int mcAnswer, String[] mcChoice,
			String mcErrorExplanation, String quizType,int oxAnswer, String oxErrorExplanation,String explanationE) {

		
		emsService.register(qiNo, userNo, type, category, question,
				 explanationQ,  mcAnswer,  mcChoice, mcErrorExplanation,
				 quizType, oxAnswer,  oxErrorExplanation, explanationE);
		
		return true;
	} 
	
	//오류 리스트 가져오기
	@RequestMapping(value = "/quiz/{no}/errorComment/page/{page}", method = RequestMethod.GET)
	public Map<String, Object> errorCommentList(@PathVariable int page,
			@PathVariable int no, int userNo) {
		return emsService.errorCommentList(page, no, userNo);
	}

	
	
	//********************** 수정 ****************************
	
	
	
	
	
	// 자기부분 주석달기

	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
	// 퀴즈리스트 가져오기
	@RequestMapping(value = "/quiz/page/{pageNo}", method = RequestMethod.GET)
	public Map<String, Object> quizList(@PathVariable int pageNo, PageVO pageVO) {
		return quizInfosService.getList(pageNo, pageVO);
	}

	// 메인 - 퀴즈 하나 랜덤 가져오기
	@RequestMapping(value = "/quiz/random", method = RequestMethod.GET)
	public Map<String, Object> mainQuizRandom() {
		return quizInfosService.getRandomQuiz();
	}
	// ㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡ//

	//BC
	
	@RequestMapping(value ="/check/nickname", method=RequestMethod.GET)
	public int CheckNickName(String nickname) {
		return userservice.selectCheckNickname(nickname);
	}
	
	@RequestMapping(value="/check/id", method=RequestMethod.GET)
	public int CheckId(String id) {
		return userservice.selectCheckId(id);
	}
	
	@RequestMapping(value="/check/nameId", method=RequestMethod.GET)
	public int checkNameId(User user,HttpServletRequest req) {
		
		return userservice.selectCheckNameId(user,req);
	}
	
}// AjaxController end
