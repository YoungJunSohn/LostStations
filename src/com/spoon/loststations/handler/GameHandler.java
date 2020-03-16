package com.spoon.loststations.handler;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spoon.loststations.service.GamesService;
import com.spoon.loststations.service.PlayLogsService;
import com.spoon.loststations.service.QuizInfosService;
import com.spoon.loststations.vo.Game;
import com.spoon.loststations.vo.GameUser;
import com.spoon.loststations.vo.PlayLog;
import com.spoon.loststations.vo.Protocol;
import com.spoon.loststations.vo.QuizInfo;
import com.spoon.loststations.vo.User;

public class GameHandler extends TextWebSocketHandler{
	private GamesService gamesService;
	private PlayLogsService playLogsService;
	private ObjectMapper mapper;
	private List<Game> games;
	
	public void setGamesService(GamesService gamesService) {
		this.gamesService = gamesService;
	}
	public void setPlayLogsService(PlayLogsService playLogsService) {
		this.playLogsService = playLogsService;
	}
	public void setGames(List<Game> games) {
		this.games = games;
	}
	public void setMapper(ObjectMapper mapper) {
		this.mapper = mapper;
	}

	
	
	//연결이 끊어질 때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("연결 끊김");
	}//afterConnectionClosed
	
	//연결이 시작될 때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("연결 시작");
		
	}//afterConnectionEstablished end
	
	
	
	
	
	
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		System.out.println("메세지 시작");
		System.out.println(message.getPayload());
		
		Protocol protocol = mapper.readValue(message.getPayload(), Protocol.class);
		
		switch (protocol.getCmd()) {
		case 1: //유저 방 매칭, 다 차면 유저 보내줌
			System.out.println("1시작");
			boolean isMatching = false;
			
			System.out.println("게임방수 : " +  games.size());
			
			
			for (Game game : games) {
				
				System.out.println("for문");
				
				//기존의 방들 중에서 빈 방을 찾음
				if(!game.isStatus()) { //게임이 대기중이고
				if(game.getUsers().size() < 3) { //유저가 2명이하이고
					System.out.println("빈방 : " + game.getNo());
					System.out.println("방유저수 : " + game.getUsers().size());
					
					//빈방 중 티어가 맞는 방을 찾음
					if(game.getTier()==protocol.getUser().getTier()) {
						isMatching = true;
						game.getUsers().put(session, protocol.getUser());
						
						System.out.println("티어맞음 방유저수 : " + game.getUsers().size());

						//방이 다 차면 유저정보 보내줌
						if(game.getUsers().size()==3) {
							System.out.println("방에 3명 참");
							game.setStatus(true);
							List<User> users = new Vector<User>();
							
							//방의 유저들 정보를 가져옴
							for(WebSocketSession userSession : game.getUsers().keySet()) {
								users.add(game.getUsers().get(userSession));
							}//for end
							
							//유저들정보, 문제정보들을 해당 방에 broadcast
							broadcast(game, new Protocol(1, game.getNo(), users));
						}//if end
						break; //for를 나감
					}//if end
				}//if end
				}//if end
			}//for end
			
			//for를 나왔을때 방을 못찾았으면 새로 만듬
			if(!isMatching) {
				Game game = getNewGame();
				
				game.getUsers().put(session, protocol.getUser());
				game.setTier(protocol.getUser().getTier());
				
				games.add(game);
				System.out.println("게임방 늘었음");
			}//if end
			
			System.out.println("1끝");
			System.out.println("게임방수 : " +  games.size());
			
			for (Game game : games) {
				System.out.println("게임방번호:" + game.getNo());
			}//for end
			
			break;
		case 2 : //퀴즈 하나 넘김
			System.out.println("2시작");
			protocol.setCmd(2);
			protocol.setQuizInfo(getQuiz());
			unicast(session, protocol);
			break;
		case 3: //넘어온 문제를 피격자한테 보냄 or 버림
			System.out.println("3시작");
			PlayLog playlog = new PlayLog();
			playlog.setGameNo(protocol.getGameNo());
			System.out.println("gameNo : "+protocol.getGameNo());
			playlog.setQiNo(protocol.getQuizInfo().getNo());
			System.out.println("qiNo : "+protocol.getQuizInfo().getNo());
			playlog.setSendUserNo(protocol.getUser().getNo());
			System.out.println("userNo : "+protocol.getUser().getNo());
			
			//공격했을 때(else는 버렸을 때)
			if(protocol.getUser().getReceiveUserNo()!=0) {
				System.out.println("공격로그 : "+protocol.getUser().getReceiveUserNo());
				playlog.setReceiveUserNo(protocol.getUser().getReceiveUserNo());
			}else {
				System.out.println("버림");
			}
			//공격했다는 로그 또는 버렸다는 로그 추가
			System.out.println("로그 추가");
			PlayLog playlogSave = registerPlayLog(playlog);
			protocol.setLogNo(playlogSave.getNo());
			System.out.println("로그 끝");
			
			
			//공격받는 쪽에 문제를 보내줌
			if(protocol.getUser().getReceiveUserNo()!=0) {
				//문제정보 넣어줘야 함
				protocol.setCmd(3);
				protocol.setQuizInfo(getAttackQuiz(protocol.getQuizInfo().getNo()));
				System.out.println("공격문제 : "+protocol.getQuizInfo().getNo());
				unicast(getSession(getGame(protocol.getGameNo()), protocol.getUser().getReceiveUserNo()), protocol);
			}
			break;
		case 4: //정답체크 넘어옴
			System.out.println("4시작");
			System.out.println("playLogNo : "+protocol.getLogNo()+", acCheck : "+protocol.getAcCheck());
			updatePlayLog(new PlayLog(protocol.getLogNo(), protocol.getAcCheck()));
			break;
		case 5: //hp 받음
			System.out.println("5시작");
			break;
		case 6: //죽음
			System.out.println("6시작");
			//유저가 죽으면 방에서 제거
			//registerGameUser
			Game nowGame = getGame(protocol.getGameNo());
			//죽은 유저를 방정보에서 없앰
			int UserSize = removeDiedUserByGame(nowGame, session);
			protocol.getGameUser().setRank(UserSize+1);
			//죽은 유저 정보를 GameUser Table에 추가(등수, 생존시간 등)
			registerGameUser(protocol.getGameUser());
			
			//죽은유저를 다른 유저들에게 알려줌
			protocol.setCmd(5);
			if(UserSize==1) { //혼자 남을 경우 승리했다는 표시
				protocol.getGameUser().setNo(0);
			}
			
			if(UserSize>0) {
				broadcast(nowGame, protocol);
			}else {
				//게임이 종료됐을 경우 해당 게임 삭제
				games.remove(nowGame);
			}
			break;
		}//switch end
	}//handleTextMessage end
	
	
	
	
	
	
	
	//한명의 유저에게 메세지 날림
	private void unicast(WebSocketSession session, Protocol protocol) throws Exception {
		
		//객체 -> String
		String json = mapper.writeValueAsString(protocol);
		
		session.sendMessage(new TextMessage(json));
	}//broadcast() end
	
	//한 방의 모든 유저들에게 메세지 날림
	private void broadcast(Game game, Protocol protocol) throws Exception {
		System.out.println("브로드케스팅");
		
		for(WebSocketSession session : game.getUsers().keySet()) {
			protocol.setQuizs(get6Quizs());
			unicast(session,protocol);
		}//for end
	}//broadcast() end
	
	
	
	
	
	
	private int registerGameUser(GameUser gameUser) {
		System.out.println("GameUser register 시작");
		return gamesService.register(gameUser);
	}
	
	//방에서 죽은 유저 제거
	private int removeDiedUserByGame(Game game, WebSocketSession session) {
		game.getUsers().remove(session);
		//방의 유저수 반환
		return game.getUsers().size();
	}//removeDiedUserByGame end
	
	//방을 만듬
	private Game getNewGame() {
		System.out.println("방생성 메서드 시작");
		Game game = new Game();
		gamesService.register(game);
		System.out.println("방생성 메서드 종료");
		return game;
	}//getNewGame() end
	
	//방번호로 방을 가져옴
	private Game getGame(int gameNo) {
		System.out.println("방검색 메서드 시작");
		Game nowGame = null;
		for(Game game:games) {
			if(game.getNo()==gameNo) {
				nowGame = game;
			}//if end
		}//for end
		System.out.println("방검색 메서드 종료");
		return nowGame;
	}//getGame end
	
	//해당유저의 session을 얻어옴
	private WebSocketSession getSession(Game game, int userNo) {
		System.out.println("유저 세션 검색 메서드 시작");
		for(WebSocketSession session:game.getUsers().keySet()) {
			if(game.getUsers().get(session).getNo()==userNo) {
				System.out.println("유저 세션 검색 메서드 종료");
				return session;
			}//if end
		}//for end
		System.out.println("유저 세션 검색 메서드 여기 오면 안됨 null넘어감");
		return null;
	}//getSession end
	
	//공격한 문제 가져오기
	private QuizInfo getAttackQuiz(int qiNo) {
		System.out.println("공격한 문제 가져오기 메서드 시작 : "+qiNo);
		QuizInfo quiz = gamesService.searchQuiz(qiNo);
		quiz.setChoices(gamesService.getchoices(quiz.getCrNo()));
		System.out.println("공격한 문제 가져오기 메서드 종료");
		return quiz;
	}
	
	//플레이로그 수정
		private void updatePlayLog(PlayLog playlog) {
			System.out.println("플레이로그 수정 메서드 시작");
			System.out.println("playlogNo : "+playlog.getNo()+", acCheck : "+playlog.getAcCheck());
				playLogsService.updatePlayLog(playlog);
			System.out.println("플레이로그 수정 메서드 종료");
		}//registerPlayLog end
	
	//플레이로그 생성
	private PlayLog registerPlayLog(PlayLog playlog) {
		System.out.println("플레이로그 생성 메서드 시작");
		if(playlog.getReceiveUserNo()>0) {
			playLogsService.registerAttack(playlog);
		}else {
			playLogsService.registerTrash(playlog);
		}
		System.out.println("playlogNo : "+playlog.getNo());
		System.out.println("플레이로그 생성 메서드 종료");
		return playlog;
	}//registerPlayLog end
	
	//게임시작시 문제 6개 얻어오는 메서드
	private List<QuizInfo> get6Quizs() {
		//문제 6개 얻어옴
		List<QuizInfo> quizs = gamesService.get6Quizs();
		
		return quizs;
	}//get6Quizs() end
	
	//문제 1개 얻어오는 메서드
	private QuizInfo getQuiz() {
		System.out.println("문제 1개 얻어오는 메서드 시작");
		
		QuizInfo quiz = gamesService.getQuiz();

		System.out.println("문제 1개 얻어오는 메서드 종료");
		return quiz;
	}//get6Quizs() end
	
}//GameHandler end