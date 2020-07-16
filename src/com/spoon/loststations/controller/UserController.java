package com.spoon.loststations.controller;

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spoon.loststations.service.CertsService;
import com.spoon.loststations.service.UsersService;
import com.spoon.loststations.vo.Cert;
import com.spoon.loststations.vo.User;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


@Controller
public class UserController {

	private UsersService usersService;
	private CertsService certsService;

	public void setUserService(UsersService usersService) {
		this.usersService =usersService;
	}

	public void setCertsService(CertsService certsService) {
		this.certsService = certsService;
	}

	
	
	@RequestMapping(value = "/user", method = RequestMethod.GET)
	public String signUpForm() {

		return "signUpForm";
	}

	@RequestMapping(value = "/user", method = RequestMethod.POST)
	public String signUp(User user, Cert cert,HttpServletRequest req, RedirectAttributes ra)
			throws UnknownHostException {

		
		usersService.insertUser(user);
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		
		
		UUID uuid = UUID.randomUUID();
		System.out.println("UUID:" + uuid.toString());
		
		//// cert.code = max 16자리 --> 36자리 이상으로 바꿔야함 데이터 베이스 고치기.
		String code = uuid.toString();
		
		cert.setUserNo(user.getNo());
		cert.setCode(code);
		certsService.insert(cert);
		
		String ip = InetAddress.getLocalHost().getHostAddress();
		
		String host = "smtp.gmail.com"; 

		//SMTP(Simple Mail Transfer Protocol 제작)
		
		//1. 메일 발신 정보 입력
		final String username = "jbpspoon"; //발신자의 아이디
		final String userpassword = "loststation!"; //발신자의 비밀번호
		
		//SMTP서버와 통신하는 포트(gmail : 465, naver : 587)
		int port = 465;
		
		//메일 정보 변수화
		String recipient = "sohnyj37@gmail.com"; //받는 사람의 메일주소
		
		String subject = "LostStations"; //메일 제목
		
		String body = "<h2>LostStations 에 회원가입을 해주셔서 감사합니다.</h2>"
				+ "<br/><h3> 아래의 링크를 클릭하여 계정을 활성화 해주세요.</h3>"
				+"<br/><a href=\"http://"+ip+"/authentication/userNo/"+user.getNo()+"/code/"+code+"\">로그인 페이지로 가기</a>"; //메일 내용 입력해주세요. 
		
		
		//2. 정보를 담기 위한 객체 생성 // SMTP 서버 정보 설정
		Properties props = System.getProperties();  
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", port);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", host);
		
		//3. Session 생성 
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un=username; 
			String pw=userpassword;
			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw); 
				}
			});
		
		session.setDebug(true); //for debug 
		
		//4. Message 클래스의 객체를 사용하여 수신자, 내용, 제목의 메시지를 작성
		Message mimeMessage = new MimeMessage(session);  
		try {
			mimeMessage.setFrom(new InternetAddress("jbpspoon@naver.com"));
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅 //.TO 외에 .CC(참조) .BCC(숨은참조) 도 있음 
			mimeMessage.setSubject(subject); //제목셋팅 
			//mimeMessage.setText(body); //내용셋팅
			mimeMessage.setContent(body,"text/html; charset=UTF-8"); //내용셋팅 (마크업을 사용하기위해 setText가 아니라 setContent사용) 
			
			//전송
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
			System.out.println("test");
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요. 
		
		
		
		//세션을 생성한다
		
		//HashMap은 Map을 구현한다.
		Map<String, String> cmd = new HashMap<String, String>();
		
		//map은 key와 value로 쌍을 이루어 존재한다.
		cmd.put("type", "S");
		cmd.put("message", user.getId()+" 으로 인증 메일을 보냈습니다.<br/>인증 메일의 링크를 클릭하면 회원가입이 완료됩니다.");
		cmd.put("site",user.getId().substring(user.getId().indexOf("@")+1));
		
		
		ra.addFlashAttribute("cmd", cmd);
		
				
		return "redirect:/index";
	}
	
	@RequestMapping(value="/authentication/userNo/{no}/code/{code}", method=RequestMethod.GET)
	public String authenitication(@PathVariable String code, @PathVariable int no, HttpSession session, Model model) {
		
				
		model.addAttribute("user",usersService.selectByNo(no));
		System.out.println(no);
		System.out.println(code);
		certsService.delete(no);
		
		return "authentication";
	}

	@RequestMapping(value="/authetication", method=RequestMethod.GET)
	public String authenitication() {
		

		
		return "index";
	}
	
	@RequestMapping(value="/session",method=RequestMethod.DELETE)
	public String logout(@RequestHeader String referer, HttpSession session) {
		session.removeAttribute(User.LOGIN_USER);
		//session.invalidate();
		return "redirect:/index";
	}
	
	@RequestMapping(value = "/session", method = RequestMethod.POST)
	public String login(User user, HttpSession session) {

		User loginUser = usersService.login(user);
		System.out.println(user.getId());
		System.out.println(user.getPassword());

		if (loginUser != null) {
			session.setAttribute(User.LOGIN_USER, loginUser);

			return "redirect:/main";
		} else {

			return "redirect:https://www.naver.com";
		}

	}

	@RequestMapping(value = "/user/password/find", method = RequestMethod.GET)
	public String passwordFindForm() {

		return "passwordFind";
	}
	
	
	@RequestMapping(value="/user/{no}/password/reset",method=RequestMethod.GET)
	public String passwordResetForm(@PathVariable int no) {
		
		return "passwordResetForm";
	}

	@RequestMapping(value="/user/password/reset", method=RequestMethod.POST)
	public String passwordReset(User user, int no, RedirectAttributes ra) {
		
		
		usersService.updatePassword(user);
		certsService.delete(user.getNo());
		
		User user2 = usersService.selectByNo(no);
		
		System.out.println(user2.getName());
		System.out.println(user2.getId());
		Map<String, String> cmd = new ConcurrentHashMap<String, String>();
		
		cmd.put("type", "P");
		cmd.put("message",user2.getId()+"님의 비밀번호 변경이 완료 되었습니다.");
		
		ra.addFlashAttribute("cmd", cmd);
	
		
		return "redirect:/index";
	}
	
}
