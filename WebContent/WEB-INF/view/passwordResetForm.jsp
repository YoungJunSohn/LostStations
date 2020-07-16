<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp"></c:import>
    <style>
        #wrap {
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
            height: 100px;
            font-size: 25px;
            color: #37474f;
            text-align: center;
            line-height: 100px;
            /*background-color: darkorchid;*/
        }
        #passwordResetFormWrap {
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
        #findPasswordForm input {
            width: 350px;
            height: 30px;
            background-color: #fff;
            text-indent: 10px;
            position: absolute;
            left: 350px;
        }
        #password {
            width: 260px;
            height: 30px;
            position: absolute;
            top: 145px;
            left: 220px;
        }
        #passwordTitle {
            position: absolute;
            top: 120px;
            left: 220px;
        }

        #passwordReconfirm {
            width: 260px;
            height: 30px;
            position: absolute;
            top: 250px;
            left: 220px;
        }
        #passwordReconfirmTitle {
            position: absolute;
            top: 225px;
            left: 220px;
        }
        .btn {
            width: 130px;
            height: 40px;
            position: absolute;
            top: 350px;
            margin-left: 100px;
            font-size: 15px;
        }
        .btn:hover {
            cursor: pointer;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            background-color: #f68500;
        }
        .send {
            left: 180px;
        }
        .msg {
            position: absolute;
            left: 220px;
            color: #F44336;
        }
        .msg.ok {
            color: #03A9F4;
        }
        #passwordConfirmMsg {
            top: 190px;
        }
        #passwordReconfirmMsg {
            top: 295px;
        }
    </style>
</head>
<body>
    <div id="wrap">
        <h1 id="logo">Lost Station</h1>
        <div id="passwordResetFormWrap">
            <h2 id="title">비 밀 번 호 변 경</h2>
            <form id="passwordResetForm" action="/user/password/reset" method="post">
            <input type="hidden" name="no" value="${no}"/>
                <fieldset>
                    <h3 id="passwordTitle">비밀번호</h3>
                    <input id="password" name="password" placeholder="비밀번호를 입력해주세요." type="password"/>
                    <div id="passwordConfirmMsg" class="msg current_password"></div>

                    <h3 id="passwordReconfirmTitle">비밀번호 재확인</h3>
                    <input id="passwordReconfirm" name="passwordReconfirm" placeholder="비밀번호를 위와 같이 입력하세요." type="password"/>
                    <div id="passwordReconfirmMsg"class="msg new_password"></div>

                    <button class="btn send" type="submit">비밀번호 변경</button>
                </fieldset>
            </form>
        </div>
    </div>
<script src="/js/jquery.js"></script>
<script>

    let $password = $("#password");
    let $passwordMsg = $(".current_password");
    // let passwordExp = /^[\w]{6,12}$/;
    let passwordExp = /^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;

    let $newPassword = $("#passwordReconfirm");
    let $passwordReconfirmMsg = $(".new_password");

    $password.val("").focus();

    function testPassword() {
        let password = $password.val();
        if(passwordExp.test(password)) {
            $passwordMsg.addClass("ok").text("좋은 비밀번호네요!");
            // console.log("Test");
            return true;
        }else {
            $passwordMsg.removeClass("ok").text("6~12글자 영어 또는 숫자 또는 혼합으로 입력하세요.");
            //$id.val("").focus();
            // console.log("hello~");
            return false;
        }//if_else end
    }
    $password.keyup(testPassword);
    // password 유효성 검사

    function testPasswordReconfirm() {
        let password = $password.val();
        let newPassword = $newPassword.val();
        //console.log(newPassword);
        if(password==newPassword) {
            $passwordReconfirmMsg.addClass("ok").text("비밀번호가 일치합니다.");
            // console.log("Test");
            return true;
        }else {
            $passwordReconfirmMsg.removeClass("ok").text("비밀번호가 일치하지 않습니다.");
            //$id.val("").focus();
            // console.log("hello~");
            return false;
        }//if_else end
    }
    $newPassword.keyup(testPasswordReconfirm);
    //newPassword 유효성 검사

    $("form").submit(function () {
        if(!testPassword()) return false;
        if(!testPasswordReconfirm()) return false;
    }); // return false; //submit이 불가능

</script>
</body>
</html>