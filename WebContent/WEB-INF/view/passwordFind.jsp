<%@page import="java.io.Console"%>
<%@page import="com.spoon.loststations.vo.User"%>
<%@page import="com.spoon.loststations.dao.UsersDAOImpl"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp"/>

    <style>
        #section {
            width: 900px;
            height: 700px;
            margin: auto;
            /*background-color: cadetblue;*/
            position: relative;
            top: 60px;
        }
        #logo {
            width: 900px;
            height: 110px;
            /*background-color: cornflowerblue;*/
            background-image: url("/img/logoMain2.png");
            background-position: 130px;
            background-size: 70%;
            background-repeat: no-repeat;
            text-indent: -9999px;
            overflow: hidden;
        }
        #title {
            width: 500px;
            height: 100px;
            font-size: 25px;
            color: #37474f;
            text-align: center;
            line-height: 100px;
            margin: auto;
            /*background-color: darkorchid;*/
        }
        #passwordFindFormWrap {
            width: 700px;
            height: 450px;
            border: 1px solid #37474f;
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left: -360px;
            margin-top: -200px;
            font-family: 'Noto Sans KR', sans-serif;
        }
        #passwordFindForm input {
            width: 300px;
            height: 30px;
            background-color: #fff;
            text-indent: 10px;
            position: absolute;
            left: 200px;
        }
        #name {
            top: 130px;
        }
        #id {
            top: 200px;
        }
        .btn {
            width: 130px;
            height: 40px;
            position: absolute;
            top: 330px;
            font-size: 15px;
        }
        .cancel {
            left: 200px;
            padding: 0;
        }
        .send {
            left: 370px;
        }
        .msg {
            position: absolute;
            top: 250px;
            left: 210px;
        }
        /*팝업시 반투명한 검은 창으로 로고 가려지게*/
        #bgPopup {
            width:100%;
            height:100%;
            /*반투명한 검은창으로 랩*/
            position:fixed;
            background-color:rgba(0,0,0,0.7);
            z-index:1;
            display: none;
        }

        /*  인증메일 보냈다는 팝업  */
        body #sendPopup{
            width: 600px;
            height: 350px;
            background-color:#fff;
            /*수평수직 가운데 정렬*/
            position:absolute;
            top:50%;
            left:50%;
            margin: -175px 0 0 -300px;
        }
        #popupMsg {
            width: 600px;
            height: 100px;
            background-color: #ffffff;
            text-align: center;
            line-height: 50px;
            margin-top: 80px;
            color: #37474f;
        }

        /*이메일 인증확인링크 버튼*/
        #mailLinkBtn{
            width: 200px;
            height: 60px;
            background-color: #37474f;
            color: white;
            border-radius: 5px;
            position:absolute;
            top: 250px;
            left: 200px;
        }
        #mailLinkBtn a {
            display: block;
            position: absolute;
            width: 195px;
            height: 55px;
            text-decoration: none;
            color: white;
            text-align: center;
            line-height: 55px;
            top: -0px;
            left: -0px;
            background-color: transparent;
        }
        .cancel a {
            display: block;
            height: 40px;
            line-height: 40px;
            text-decoration: none;
            color: #fff;
        }
    </style>
</head>
<body>
    <div id="bgPopup">
        <div id="sendPopup">
            <div id="popupMsg">
                         
            </div><!--//popupMsg-->
            <button id="mailLinkBtn" class="btn">
            	<a  href="/" target="_blank">인증 메일 확인하러가기</a>
            </button>
        </div><!--//sendPopup-->
    </div><!--//bgPopup-->

    <div id="section">
        <h1 id="logo">Lost Station</h1>
        <div id="passwordFindFormWrap">
            <h2 id="title">비 밀 번 호  찾 기</h2>
            <form id="passwordFindForm" action="/user/password/find" method="post">
                <fieldset>
                    <input id="name" name="name" placeholder="이름을 입력하세요."/>
                    <input id="id" name="id" placeholder="이메일을 입력하세요."/>
                    <div class="msg"></div>
                    <button class="btn cancel" ty><a href="/">취 소</a></button>
                    <button class="btn send" type="submit">인증 메일 보내기</button>
                </fieldset>
            </form>
        </div><!--//passwordFindFormWrap-->
    </div><!--//section-->

<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>

    let $bgPopup = $("#bgPopup");
    let $name = $("#name");
    let $id = $("#id");
    let $passwordFindForm = $("#passwordFindForm");
    let $popupMsg = $("#popupMsg");
    let $mailLinkBtn = $("#mailLinkBtn a");

  	
    //이름, 아이디로 가입한 회원인지 검사
    $passwordFindForm.on("submit",function (e) {
        let name = $name.val();
        let id = $id.val();
        let site = id.substring(id.indexOf("@")+1);
        
        //alert("test");
        e.preventDefault();
        $.ajax({
            url:"/ajax/check/nameId",
            dataType:"json",
            type:"get",
            data:{name:name, id:id},
            error:function () {
                alert("서버점검중입니다.");
            },
            success:function (data) {
            	console.log(data);
            	
            	 if(data >= 1) {
            		 //alert("성공!"); 
            		 $popupMsg.html(id+" 으로 인증 메일을 보냈습니다.<br/>인증 메일의 링크를 클릭하여 비밀번호를 변경하세요.");
            		 $mailLinkBtn.attr("href","https://www."+site);
            		 $bgPopup.show();      		 
            		 e.preventDefault();
                 	 return true;
                 }else {
                	 //alert("막아주세요");
                	 $(".msg").text("존재하지 않는 아이디입니다.");
                 	 return false;
                 }
            	
            }//success end
        });//$.ajax() end
        //e.preventDefault();
    });//click() end

</script>
</body>
</html>