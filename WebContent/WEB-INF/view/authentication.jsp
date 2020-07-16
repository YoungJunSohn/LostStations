<%@page import="com.spoon.loststations.dao.UsersDAO"%>
<%@page import="com.spoon.loststations.vo.User"%>
<%@page import="com.spoon.loststations.dao.CertsDAO"%>
<%@page import="com.spoon.loststations.vo.Cert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    
    <c:import url="/WEB-INF/template/link.jsp" />

    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            user-select: none;
        }
        #logo {
            background-image: url(/img/logoMain2.png);
            background-position: 0 33px;
            background-size: 635px;
            background-repeat: no-repeat;
            width: 630px;
            height: 210px;
            text-indent: -9999px;
            overflow: hidden;
            margin: auto;
            float: none;
        }
        a {
            text-decoration: none;
            text-align: center;
            line-height: 60px;
            display: block;
            width: 200px;
            height: 60px;
            margin: 0 auto;
        }
        #auMsg {
            text-align: center;
            line-height: 200px;
            font-size: 20px;
            margin: 70px 0;
            /*background-color: blue;*/
        }
        .btn {
            cursor: pointer;
            border: transparent;
            background-color: #37474f;
            color: #fff;
            user-select: none;
            border: none;
            outline: none;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #f68500;
            font-weight: bold;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</head>
<body>
    <h1 id="logo">Lost Stations</h1>
    <div id="content">
        <div id="section">
            <h2 class="screen_out">이메일 인증</h2>
            <div id="auMsg"><span id="nickname">${user.nickname}</span>님의 이메일 인증이 완료되었습니다.</div>
            <a href="/" class="btn">로그인 하러가기</a>
        </div>
    </div><!--//content-->

<script src="/js/jquery.js"></script>
<script>

</script>
</body>
</html>