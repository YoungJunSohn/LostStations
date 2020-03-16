<%@page import="com.spoon.loststations.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header id="header">
    <div class="aux">
        <a href="/main"><h1 id="logo">Lost Station</h1></a>
        <div id="gnb">
            <ul>
                <li><a class="quiz_link" href="/quiz">문제평가</a></li>
                <li><a class="ranking_link" href="/user/ranking/play/page/1">랭킹</a></li>
                <li><a class="game_info_link" href="/inquiry/page/1">Q & A</a></li>
            </ul>
            <div id="sub">
                <ul id="rankingMenu">
                    <li><a href="/user/ranking/play/page/1">플레이</a></li>
                    <li><a href="/user/ranking/register/page/1">출제</a></li>
                    <li><a  href="/user/ranking/verify/page/1">검증</a></li>
                </ul>
                <ul id="gameInfoMenu">
                    <li><a href="/inquiry/page/1">목 록</a></li>
                    <li><a href="/inquiry/write">질문하기</a></li>
                </ul>
            </div>
            <div id="gnbBorderEffect"></div>
        </div><!-- //gnb -->
        <div id="profileBox">
            <div id="alarm"><i class="fas fa-bell"></i>
                <div id="news">
                    <header id="newsHeader">
                        <h1>새소식</h1>
                    </header><!--//newsHeader-->
                    <div id="newsList">
                        <ul>
                            <li>숟가락 파이팅 할수있다!!!
                                <div id="newsListTime">3분전</div>
                            </li>
                            <li>누군가 당신의 문제에 좋아요를 눌렀습니다.</li>
                            <li>누군가 당신의 문제에 싫어요를 눌렀습니다.</li>
                            <li>당신의 문제가 채택되었습니다.</li>
                            <li>재미키동님이 당신의 문제에 댓글을 남겼습니다.</li>
                            <li>재미키동님이 당신의 문제에 오류수정을 남겼습니다</li>
                            <li>당신의 오류수정이 채택되었습니다.</li>
                        </ul>
                    </div><!--//newsList-->
                </div><!--//news-->
            </div><!--//alarm-->
            <div id="profileImage" data-no="${loginUser.no }">
                <a href="/user/${loginUser.no }"><img alt="profile" src="/profileImage/${loginUser.profileImage }" title="${loginUser.nickname }" width="60" height="60"/></a>
            </div><!--//profileImage-->
        </div><!--//profileBox-->
        <div id="gameStartBtn"><a href="/game">GAME START</a></div><!--//gameStarBtn-->
       
        <button form="logoutForm" id="logoutBtn">로그아웃</button>
        <form id="logoutForm" action="/session" method="post">
        	<input type="hidden" name="_method" value="DELETE"/>
        </form>
        
    </div><!--//header-->
    <div id="subHoverLine"></div>
</header>
<main id="content">