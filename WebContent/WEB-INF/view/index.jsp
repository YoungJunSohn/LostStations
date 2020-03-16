<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp" />
    <link rel="stylesheet" href="/css/index.css">
    
</head>

<body>
    <h1 id="logo">Lost Stations</h1>
    
	</div><!--//bgPopup-->
    <div id="content">
        <div id="videoBox">
        <iframe width="600" height="330" src="https://www.youtube.com/embed/-Iy0xcJJw6I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <div id="loginForm">
            <form action="/session" method="post">
                <h2 class="title">Login</h2>
                <input id="emailInput" name="id"  placeholder="이메일을 입력하세요">
                <input type="password" name="password" placeholder="비밀번호를 입력하세요">
                <p class="msg">이메일이나 비밀번호를 다시 확인해주세요</p>
                <button id="loginBtn" class="btn" type="submit">로그인</button>
            </form>
                <a id="findPasswordLink" href="/user/password/find">비밀번호를 잊으셨나요?</a>
                <a id="signUpLink" href="/user">회원가입</a>
        </div><!--//loginForm-->
    </div><!--//content-->
    
    

<c:if test="${cmd != null }">
 <div id="bgPopup">
 <c:choose>
 <c:when test='${cmd.get("type").equals("P")}'>
<section id="passwordConfirmPopup">
        <button class="close_popup password_confirm"><i class="fas fa-window-close"></i></button>
        <div id="passwordChangePopup">
            ${cmd.get("message") }
        </div><!--//mailConfirm-->
    </section><!--//passwordConfirmPopup-->
    </c:when>
<c:otherwise>
    <section id="confirmPopup">
        <button class="close_popup email_confirm"><i class="fas fa-window-close"></i></button>
        <div id="mailConfirm">
             ${cmd.get("message") }
            <button id="mailLinkBtn" class="btn"><a href="http://www.${cmd.get('site') }" target="_blank">인증 메일 확인하러가기</a></button>
        </div><!--//mailConfirm-->
    </section><!--//confirmPopup-->
    </c:otherwise>
</c:choose>
	</div>
</c:if>
    <!---------------------------------------------   jquery import  ---------------------------------------------------->
    <script src="/js/jquery.js"></script>
    <script>
        /*변수 선언란*/
        let $closePopupBtn = $(".close_popup");
        let $bgPopup = $("#bgPopup");
        let $emailInput = $("#emailInput");
        let $loginForm = $("#loginForm form");
        
        //popup템플릿 선언
        //let popupTmp = _.template($("#popupTmp").html());
        
        /*유효성검사를 위한 정규 표현식*/
        let regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //이메일
        let regPassword = /^[0-9a-zA-Z]{8,16}$/; //비밀번호는 8~16자
        /*
        [0-9a-zA-Z] :  숫자, 소문자, 대문자
        */


        
       function focus(){
            $emailInput.focus();
       }//function focus end

        $closePopupBtn.on("click",function () {
            // alert();
            $bgPopup.css("display","none");
        }); //팝업제거버튼 클릭시 팝업 삭제

        //함수 호출
        focus();//접속하면 바로 로그인 인풋창에 포커스
        
        
        
        //로그인 버튼 클릭시 유효성검사
        $loginForm.on("submit", function (e) {
            //서버 개발시 추가할 것
            
            
            
            console.log("통과");
            
            //e.preventDefault();
        });


    </script>
</body>
</html>