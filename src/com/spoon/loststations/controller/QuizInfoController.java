package com.spoon.loststations.controller;

import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spoon.loststations.service.QuizInfosService;
import com.spoon.loststations.service.UsersService;
import com.spoon.loststations.vo.QuizExp;
import com.spoon.loststations.vo.QuizInfo;

@Controller
public class QuizInfoController {
	
	private QuizInfosService quizInfosService;
	UsersService usersService;
	
	public void setUsersService(UsersService usersService) {
		this.usersService = usersService;
	}
	public void setQuizInfosService(QuizInfosService quizInfosService) {
		this.quizInfosService = quizInfosService;
	}
	
	
	
	//************************* 수정 ***************************
	//퀴즈 디테일 정보 가져오기
	@RequestMapping(value="/quiz/{no}",method=RequestMethod.GET)
	public String quizInfoGetOne(@PathVariable int no) {

		//퀴즈 리스트에서 넘어왔으면 answer에 -5를 넣어준다.
		//(-5는 보기번호 1,2,3,4를 제외한 값으로 정해준것이다.)
		return "redirect:/quiz/"+no+"/answer/-5";
	}
	
	//메인에서 문제 보기를 클릭하여 접근했을 때
	@RequestMapping(value= {"/quiz/{no}/answer/{answer}",},method=RequestMethod.GET)
	public String answerCheck(Model model,
			@PathVariable int answer,
			@PathVariable int no,
			HttpSession session) {
		
		//조회수 증가
		Set<Integer> quizNos = (Set)session.getAttribute("quizNos");
		quizInfosService.updateViews(no, quizNos, session);
		
		model.addAllAttributes(quizInfosService.getOneByQiNo(no));
		
		return "quizDetailView";
	}
	
	//************************* 수정 ***************************
	
	//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//
		//메인 페이지
		@RequestMapping(value="/main",method=RequestMethod.GET)
		public void main(Model model) {
			model.addAllAttributes(usersService.getTopRanking());
			//return "main";
		}
		
		
		//퀴즈리스트 페이지
		@RequestMapping(value="/quiz",method=RequestMethod.GET)
		public String quizList() {
			return "quizList";
		}
		//메인에서 카테고리 눌러서 퀴즈리스트로 들어올 때
		@RequestMapping(value="/quiz/category/{categoryNo}",method=RequestMethod.GET)
		public String quizList(@PathVariable int categoryNo, Model model) {
			//model.addAttribute("categoryNo", categoryNo);
			return "quizList";
		}
		//퀴즈 등록
		@RequestMapping(value="/quiz",method=RequestMethod.POST)
		public String quizWrite(QuizInfo quizInfo, QuizExp quizExp, int chNo, String exp, String choice1,String choice2,String choice3,String choice4) {
				quizInfosService.write(quizInfo,quizExp,chNo,exp,choice1,choice2,choice3,choice4);
			return "redirect:/quiz/"+quizInfo.getNo();
		}
		//ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ동호ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ//

}
