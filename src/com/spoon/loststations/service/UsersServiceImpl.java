package com.spoon.loststations.service;

import java.io.File;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.spoon.loststations.dao.CertsDAO;
import com.spoon.loststations.dao.UsersDAO;
import com.spoon.loststations.util.PaginateUtil;
import com.spoon.loststations.util.ResizeImageUtil;
import com.spoon.loststations.vo.Cert;
import com.spoon.loststations.vo.PageVO;
import com.spoon.loststations.vo.User;

public class UsersServiceImpl implements UsersService {
	private UsersDAO usersDAO;
	private CertsDAO certsDAO;

	public void setUsersDAO(UsersDAO usersDAO) {
		this.usersDAO = usersDAO;
	}
	
	public void setCertsDAO(CertsDAO certsDAO) {
		this.certsDAO = certsDAO;
	}

	@Override
	public Map<String, Object> getTopRanking() {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();

		map.put("playTop", usersDAO.selectPlayTop());
		map.put("registerTop", usersDAO.selectRegisterTop());
		map.put("verifiTop", usersDAO.selectVerifiTop());

		return map;
	}

	@Override
	public User login(User user) {
		// TODO Auto-generated method stub
		return usersDAO.selectLogin(user);
	}

	@Override
	public int insertUser(User user) {
		// TODO Auto-generated method stub
		return usersDAO.insert(user);
	}

	@Override
	public int selectCheckId(String id) {
		// TODO Auto-generated method stub
		return usersDAO.selectCheckId(id);
	}

	@Override
	public int selectCheckNickname(String nickname) {
		// TODO Auto-generated method stub
		return usersDAO.selectCheckNickname(nickname);
	}

	@Override
	public User selectByNo(int no) {
		// TODO Auto-generated method stub
		return usersDAO.selectByNo(no);
	}
	
	@Override
	public int selectCheckNameId(User user,HttpServletRequest req) {
		// TODO Auto-generated method stub
		
		int count = usersDAO.selectCheckNameId(user);
		
		if(count==0) {
			return 0;
		}else {
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID : "+uuid.toString());
			
			String code = uuid.toString();

			User user2 = usersDAO.selectUserInfo(user);

			System.out.println(user2.getNo());
			
			Cert cert = new Cert();
			
			cert.setUserNo(user2.getNo());
			cert.setCode(code);
			
			certsDAO.insert(cert);
			
			
			String ip = null;
			try {
				ip = InetAddress.getLocalHost().getHostAddress();
			} catch (UnknownHostException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			//System.out.println(ip);
					

			// 네이버일 경우 smtp.naver.com 을 입력합니다. 
			// Google일 경우 smtp.gmail.com 을 입력합니다. 
			String host = "smtp.naver.com"; 
			final String username = "jbpspoon"; //네이버 아이디를 입력해주세요. @nave.com은 입력하지 마시구요. 
			final String userpassword = "woalzlehd!"; //네이버 이메일 비밀번호를 입력해주세요. 
			
			int port=465; //포트번호 // 메일 내용 
			String recipient = "max91128@naver.com"; //받는 사람의 메일주소를 입력해주세요. 
			//String recipient = id; //받는 사람의 메일주소를 입력해주세요. 
			String subject = "LostStations"; //메일 제목 입력해주세요. 
			String body = "<h2>LostStations 비밀번호 변경</h2>"
					+ "<br/><h3> 아래의 링크를 클릭하여 비밀번호 변경 페이지로 이동하세요.</h3>"
					+"<br/><a href=\"http://"+ip+"/user/"+user2.getNo()+"/password/reset\">비밀번호 변경 페이지로 가기</a>"; //메일 내용 입력해주세요. 
			
			Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정 
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true"); 
			props.put("mail.smtp.ssl.trust", host); //Session 생성 
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un=username; 
				String pw=userpassword;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw); 
					}
				}); 
			session.setDebug(true); //for debug 
			Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
			try {
				mimeMessage.setFrom(new InternetAddress("jbpspoon@naver.com"));
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
				mimeMessage.setSubject(subject); //제목셋팅 
				//mimeMessage.setText(body); //내용셋팅
				mimeMessage.setContent(body,"text/html; charset=UTF-8"); //내용셋팅 (마크업을 사용하기위해 setText가 아니라 setContent사용) 
				Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
				System.out.println("test");
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
			
			
			
			//세션을 생성한다
			HttpSession popupSession = req.getSession();
			
			popupSession.setAttribute("sendId", user.getId());
			
			
			return 1;
			
		}
		
	}

	@Override
	public int updatePassword(User user) {
		// TODO Auto-generated method stub
		return usersDAO.updatePassword(user);
	}

	@Override
	public User selectUserInfo(User user) {
		// TODO Auto-generated method stub
		return usersDAO.selectUserInfo(user);
		
	}
	
	
	/**************************  영준 start  ***************************/
	private ResizeImageUtil imageUtil;
	
	public void setImageUtil(ResizeImageUtil imageUtil) {
		this.imageUtil = imageUtil;
	}

	@Override
	public Map<String, Object> uploadProfile(int no) {
		Map<String, Object> map = new ConcurrentHashMap<String, Object>();
		return map;
	}
	
	@Override
	public String setProfileDefault(HttpSession session) {
		
		User loginUser = (User)session.getAttribute(User.LOGIN_USER);
		loginUser.setProfileImage("default.jpg");
		int result = usersDAO.updateProfileImage(loginUser);
		
		return "{\"result\":\""+result+"개 사진 변경 완료!\"}";
	}
	
	@Override
	public String setProfile(int no,HttpServletRequest request, MultipartFile profile,HttpSession session) {

		//1. 실제 경로 얻기
		ServletContext application = request.getServletContext();
		//2. 루트 경로 얻어옴
		String root = application.getRealPath("");
		//System.out.println(root);
		//3. upload 폴더 경로 및 profile 폴더 경로
		//System.out.println("");
		String uploadPath = root+"upload"+File.separator;
		//System.out.println("업로드폴더 경로"+uploadPath);
		//System.out.println("");
		String profilePath = root+"profileImage"+File.separator;
		//System.out.println("프로파일폴더 경로"+profilePath);
		//4. file rename 처리
		String rename = UUID.randomUUID().toString()+profile.getOriginalFilename();
		//System.out.println("파일 이름 UUID : "+rename);
		//5. 경로+파일명
		String fullPath=uploadPath+rename;
		//6. 이동할 파일을 생성
		File file = new File(fullPath);
		//7. 실제 이동
		try {
			profile.transferTo(file);//업로드 폴더로 이동
		//8. 썸네일 이미지처리(fileResize)
			imageUtil.resize(fullPath, profilePath+rename, 100);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		User user = new User();
		user.setNo(no);
		user.setProfileImage(rename);
		
		usersDAO.updateProfileImage(user);
		
		User loginUser = (User)session.getAttribute(User.LOGIN_USER);
		
		loginUser.setProfileImage(rename);
		
		return "{\"fileName\":\""+rename+"\"}";
	}
	/**************************  영준 end  ***************************/
////////////////////////ㅈㅎ///////////////////////////
	
	private PaginateUtil paginateUtil;
	
	public void setPaginateUtil(PaginateUtil paginateUtil) {
		this.paginateUtil = paginateUtil;
	}
	
	@Override
	public Map<String, Object> getRegisterRanking(int page) {
	// TODO Auto-generated method stub
	
	int numPage = 10; //페이지에 보여질 게시물 수
	PageVO pageVO = new PageVO();
	
	pageVO.setEnd(page*numPage+3);
	
	pageVO.setStart(pageVO.getEnd() - (numPage-1));
	
	if(page > 1){
	numPage = 20;
	pageVO.setEnd(page*numPage-7);
	pageVO.setStart(pageVO.getEnd() - (numPage-1));
	}
	
	Map<String, Object> map = new ConcurrentHashMap<String, Object>();
	
	int total = usersDAO.selectUserListTotal()+7;
	
	List<User> topRegisters = new ArrayList<User>();
	List<User> otherRegisters = usersDAO.quizRegisterRankng(pageVO);
	
	if (page==1) {
	topRegisters = usersDAO.quizRegisterRankng(new PageVO(1,3));
	for(User user : topRegisters) {
	
	user.setCountVerifiedQuiz(usersDAO.selectCountVerifiedQuiz(user.getNo()));
	user.setPercentageOfVerification(usersDAO.selectPercentageOfVerification(user.getNo()));
	user.setOtherUserCorrectRate(usersDAO.selectOtherUserCorrectRate(user.getNo()));
	}
	}
	
	for(User user : otherRegisters) {
	user.setCountVerifiedQuiz(usersDAO.selectCountVerifiedQuiz(user.getNo()));
	}
	
	map.put("registers", otherRegisters);
	map.put("top3List", topRegisters);
	map.put("paginate", paginateUtil.getPaginate(page, total, numPage, 5, "/user/ranking/register"));
	
	return map;
	}
///////////////////////ㅈㅎ///////////////////////////

}
