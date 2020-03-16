package com.spoon.loststations.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Service;

import com.spoon.loststations.dao.ChoicesDAO;
import com.spoon.loststations.dao.QuizInfosDAO;
import com.spoon.loststations.dao.UsersDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.vo.Choice;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.QuizInfo;
import com.spoon.loststations.vo.User;

@Service
public class ChoicesServiceImpl implements ChoicesService {

	private ChoicesDAO choicesDAO;
	private QuizInfosDAO quizInfosDAO;
	private UsersDAO usersDAO;
	private PaginateUtil paginateUtil;

	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}

	public void setQuizInfosDAO(QuizInfosDAO quizInfosDAO) {
		this.quizInfosDAO = quizInfosDAO;
	}

	public void setChoicesDAO(ChoicesDAO choicesDAO) {
		this.choicesDAO = choicesDAO;
	}

	/**************************** 영준 start **********************************/

	/* 채택 탭을 눌렀을 때 리스트 출력 */
	@Override
	public Map<String, Object> getList(int userNo, int adoptPageNo, int qiNo) {

		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		int numPage = 5;
		int sort = 1;

		PageVO pageVO = new PageVO(adoptPageNo, numPage, sort, userNo);

		int total = quizInfosDAO.selectUserAdoptQuizListTotal(userNo);

		String paginate = paginateUtil.getPaginate(adoptPageNo, total, numPage, 5, "");

		map.put("quizList", quizInfosDAO.selectUserAdoptQuizList(pageVO));
		map.put("paginate", paginate);

		return map;
	}

	/* 채택 탭의 문제를 눌렀을 때 디테일 출력 */
	@Override
	public Map<String, Object> getDetail(int qiNo) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		System.out.println("요청받은 문제 번호는 :"+qiNo);
		QuizInfo qi = quizInfosDAO.selectOne(qiNo);
		System.out.println("문제 정보를 가져옵니다 :" + qi.getCrNo());

		List<Choice> choices = null;

		if (qi.getCrNo() > 0) {
			choices = choicesDAO.selectChoiceList(qi.getCrNo());
		}

		map.put("choices", choices);

		return map;
	}
	/**************************** 영준 end **********************************/
}
