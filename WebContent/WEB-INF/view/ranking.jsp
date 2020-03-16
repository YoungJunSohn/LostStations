<%@page import="com.spoon.loststations.dao.PlayLogsDAOImpl"%>
<%@page import="com.spoon.loststations.util.PaginateUtil"%>
<%@page import="java.util.List"%>
<%@page import="com.spoon.loststations.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/ranking.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<main id="content">
    <h2 class="screen_out">랭킹</h2>
    <div id="menuWrap">
        <ul>
            <li id="playRanking" class=${type=="play"? "on" : ""}><a href="/user/ranking/play/page/1">플레이</a></li>
            <li id="writeRanking" class=${type=="register"? "on" : ""}><a href="/user/ranking/register/page/1">출제</a></li>
            <li id="verificationRanking" class=${type=="verify"? "on" : ""}><a href="/user/ranking/verify/page/1">검증</a></li>
        </ul>
        <div id="searchBox">
            <input id="searchInput" name="nickname" placeholder="닉네임">
            <button id="searchBtn" class="btn">검색</button>
        </div><!--//searchBox-->
    </div><!--//menuWrap-->
    <div id="rankingWrap">
    <c:choose>
    
    	<c:when test='${type=="play"}'>
    	<!-- ///////////////플레이랭킹/////////////// -->
       	<div id="playRankingTab">
            <h3 class="screen_out">플레이 랭킹</h3>
            <c:if test="${!top3List.isEmpty()}">
            <div class="topRankingBox">
                <div class="rank">1</div>
                <a href="/user/${top3List.get(0).no}"><img src="/profileImage/${top3List.get(0).profileImage}" alt="profileImage" class="profile_image" width="140" height="140">
                <div class="nickname">${top3List.get(0).nickname}</div></a>
                
                <div class="tier top_ranking" >
                <c:choose>
	            	<c:when test="${top3List.get(0).playScore<=1000}">
	                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
	               	</c:when>
	                <c:when test="${top3List.get(0).playScore<=1500}">
	                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
	                </c:when>	
	                <c:when test="${top3List.get(0).playScore<=2000}">
	                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(0).playScore<=2500}">
	                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(0).playScore<=3000}">
	                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(0).playScore<=3500}">
	                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
	                </c:when>
	                <c:otherwise>
	                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
	                </c:otherwise>
	            </c:choose> 
                </div>
                <div class="winning_rate top_ranking">
                    <div class="title">승률</div>
                    <div class="bar_graph">
                        <div class="winning_rate_text" data-value="${top3List.get(0).winRate}%">${top3List.get(0).winRate}%</div>
                    </div><!--//bar_graph-->
                </div><!--//winning_rate second_ranking-->
                <div class="correct_rate top_ranking">
                    <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(0).correctRate}</span> %</div>
                <div class="avg_rank top_ranking">
                <div class="title">평균 등수</div><!--
                --><span class="avg_rank_text">${top3List.get(0).avgRank}</span> 등</div>
<!--                <div class="kill_num top_ranking">-->
<!--                    <div class="title">킬 수</div>&lt;!&ndash;-->
<!--                &ndash;&gt;<span class="kill_num_text">123</span> 킬</div>-->
<!--                <div class="avg_survival_time top_ranking">-->
<!--                    <div class="title">평균 생존시간</div>&lt;!&ndash;-->
<!--                &ndash;&gt;<span class="avg_survival_time_text">5분30초</span></div>-->
                <div id="playRankingChart">
                    <canvas id="playBar" width="460" height="200"></canvas>
                </div><!--writeRankingChart-->
            </div><!--//topRankingBox-->
            <div class="second_ranking_box">
                <div class="second_inner left">
                    <div class="rank">2</div>
                    <div class="profile_box">
                        <a href="/user/${top3List.get(1).no}"><img src="/profileImage/${top3List.get(1).profileImage}" alt="profileImage" class="profile_image" width="110" height="110">
                        <div class="nickname">${top3List.get(1).nickname}</div></a>
                    </div><!--//profile_box-->
                    <div class="tier second_ranking">
	                <c:choose>
		            	<c:when test="${top3List.get(1).playScore<=1000}">
		                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
		               	</c:when>
		                <c:when test="${top3List.get(1).playScore<=1500}">
		                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
		                </c:when>	
		                <c:when test="${top3List.get(1).playScore<=2000}">
		                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(1).playScore<=2500}">
		                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(1).playScore<=3000}">
		                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(1).playScore<=3500}">
		                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
		                </c:when>
		                <c:otherwise>
		                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
		                </c:otherwise>
		            </c:choose> 
                    </div>
                    <div class="winning_rate second_ranking">
                        <div class="title">승률</div>
                        <div class="bar_graph">
                            <div class="winning_rate_text" data-value="${top3List.get(1).winRate}%">${top3List.get(1).winRate}%</div>
                        </div><!--//bar_graph-->
                    </div><!--//winning_rate second_ranking-->
                    <div class="correct_rate second_ranking">
                        <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(1).correctRate}</span>%</div>
                    <div class="avg_rank second_ranking">
                        <div class="title">평균 등수</div><!--
                --><span class="avg_rank_text">${top3List.get(1).avgRank}</span>등</div>
                </div><!--//second_inner-->
                
                <div class="second_inner right">
                    <div >
                        <div class="rank">3</div>
                        <div class="profile_box">
                            <a href="/user/${top3List.get(2).no}"><img src="/profileImage/${top3List.get(2).profileImage}" alt="profileImage" class="profile_image" width="110" height="110">
                            <div class="nickname">${top3List.get(2).nickname}</div></a>
                        </div><!--//profile_box-->
                        <div class="tier second_ranking">
                        <c:choose>
			            	<c:when test="${top3List.get(2).playScore<=1000}">
			                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
			               	</c:when>
			                <c:when test="${top3List.get(2).playScore<=1500}">
			                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
			                </c:when>	
			                <c:when test="${top3List.get(2).playScore<=2000}">
			                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
			                </c:when>
			                <c:when test="${top3List.get(2).playScore<=2500}">
			                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
			                </c:when>
			                <c:when test="${top3List.get(2).playScore<=3000}">
			                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
			                </c:when>
			                <c:when test="${top3List.get(2).playScore<=3500}">
			                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
			                </c:when>
			                <c:otherwise>
			                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
			                </c:otherwise>
			            </c:choose>
                        </div>
                        <div class="winning_rate second_ranking">
                            <div class="title">승률</div>
                            <div class="bar_graph">
                                <div class="winning_rate_text" data-value="${top3List.get(2).winRate}%">${top3List.get(2).winRate}%</div>
                            </div><!--//bar_graph-->
                        </div><!--//winning_rate second_ranking-->
                        <div class="correct_rate second_ranking">
                            <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(2).correctRate}</span> %</div>
                        <div class="avg_rank second_ranking">
                            <div class="title">평균 등수</div><!--
                --><span class="avg_rank_text">${top3List.get(2).avgRank}</span> 등</div>
                    </div><!---->
                </div><!--//second_inner-->
            </div><!--//second_ranking_box-->
            </c:if>
            <div class="third_box">
        	<c:forEach items="${playUsers}" var="user">
            <div class="player_box">
                <div class="third_inner">
                    <div class="rank">${user.rank}</div>
                    <div class="profile_box">
                        <a href="/user/${user.no}">
                            <img src="/profileImage/${user.profileImage}" alt="profileImage" class="profile_image" width="80" height="80">
                            <div class="nickname">
                            <c:choose>
				            	<c:when test="${user.playScore<=1000}">
				                	<img class="tier other_ranking" src="/img/TierBronze.png" width="24" height="20"></img>${user.nickname}
				               	</c:when>
				                <c:when test="${user.playScore<=1500}">
				                	<img class="tier other_ranking" src="/img/TierSilver.png" width="24" height="20"></img>${user.nickname}
				                </c:when>	
				                <c:when test="${user.playScore<=2000}">
				                	<img class="tier other_ranking" src="/img/TierGold.png" width="24" height="20"></img>${user.nickname}
				                </c:when>
				                <c:when test="${user.playScore<=2500}">
				                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="24" height="20"></img>${user.nickname}
				                </c:when>
				                <c:when test="${user.playScore<=3000}">
				                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="24" height="20"></img>${user.nickname}
				                </c:when>
				                <c:when test="${user.playScore<=3500}">
				                	<img class="tier other_ranking" src="/img/TierMaster.png" width="24" height="20"></img>${user.nickname}
				                </c:when>
				                <c:otherwise>
				                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="24" height="20"></img>${user.nickname}
				                </c:otherwise>
				                
				            </c:choose>
							</div>
                        </a>
                    </div><!--//profile_box-->
                    <div class="winning_rate other_ranking">
                        <div class="title">승률</div>
                        <div class="bar_graph">
                        	<div class="winning_rate_text"
                        		data-value="${user.winRate}">
                        		${user.winRate}%
                        	</div>
                        </div>
                    </div><!--adopt_num-->
                </div><!--//third_inners-->
            </div><!--//player_box-->
            </c:forEach>
        </div><!--//third_box-->
    	</div>
    	</c:when>
    	
    	<c:when test='${type=="register"}'>
        <!-- ///////////////출제랭킹/////////////// -->
        <div id="writeRankingTab">
        <h3 class="screen_out">출제 랭킹</h3>
        <c:if test="${page==1}">
        <div class="topRankingBox">
            <div class="rank">1</div>
            <a href="/user/${top3List.get(0).no}">
	            <img src="/profileImage/${top3List.get(0).profileImage}" 
	            alt="profileImage" class="profile_image" width="140" height="140">
                <div class="nickname">${top3List.get(0).nickname}</div></a>
            <div class="tier top_ranking">
            <c:choose>
            	<c:when test="${top3List.get(0).registrationScore<=1000}">
                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
               	</c:when>
                <c:when test="${top3List.get(0).registrationScore<=1500}">
                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
                </c:when>	
                <c:when test="${top3List.get(0).registrationScore<=2000}">
                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
                </c:when>
                <c:when test="${top3List.get(0).registrationScore<=2500}">
                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
                </c:when>
                <c:when test="${top3List.get(0).registrationScore<=3000}">
                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
                </c:when>
                <c:when test="${top3List.get(0).registrationScore<=3500}">
                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
                </c:when>
                <c:otherwise>
                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
                </c:otherwise>
            </c:choose>    
            </div>
            <div class="adopt_num top_ranking">
                <div class="title">채택된 문제 수</div><!--
                --><span class="adopt_num_text">${top3List.get(0).countVerifiedQuiz}</span> 개</div>
            <div class="adopt_rate top_ranking">
                <div class="title">채택률</div><!--
                --><span class="adopt_rate_text">${top3List.get(0).percentageOfVerification}</span> %</div>
            <div class="correct_rate top_ranking">
                <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(0).otherUserCorrectRate}</span> %</div>
            <div id="writeRankingChart">
                <canvas id="writeDonut" width="460" height="200"></canvas>
            </div><!--writeRankingChart-->
        </div><!--//topRankingBox-->

        <div class="second_ranking_box">
            <div class="second_inner left">
                <div class="rank">2</div>
                <div class="profile_box">
                    <a href="/user/${top3List.get(1).no}"><img src="/profileImage/${top3List.get(1).profileImage}"  alt="profileImage" class="profile_image" width="110" height="110">
                        <div class="nickname">${top3List.get(1).nickname}</div></a>
                </div><!--//profile_box-->
                <div class="tier second_ranking">
                <c:choose>
	            	<c:when test="${top3List.get(1).registrationScore<=1000}">
	                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
	               	</c:when>
	                <c:when test="${top3List.get(1).registrationScore<=1500}">
	                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
	                </c:when>	
	                <c:when test="${top3List.get(1).registrationScore<=2000}">
	                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(1).registrationScore<=2500}">
	                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(1).registrationScore<=3000}">
	                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
	                </c:when>
	                <c:when test="${top3List.get(1).registrationScore<=3500}">
	                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
	                </c:when>
	                <c:otherwise>
	                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
	                </c:otherwise>
          	  	</c:choose>  
                </div>
                <div class="adopt_num second_ranking">
                    <div class="title">채택된 문제 수</div><!--
                --><span class="adopt_num_text">${top3List.get(1).countVerifiedQuiz}</span> 개</div>
                <div class="adopt_rate second_ranking">
                    <div class="title">채택률</div><!--
                --><span class="adopt_rate_text">${top3List.get(1).percentageOfVerification}</span> %</div>
                <div class="correct_rate second_ranking">
                    <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(1).otherUserCorrectRate}</span> %</div>
            </div><!--//second_inner-->

            <div class="second_inner right">
                <div >
                    <div class="rank">3</div>
                    <div class="profile_box">
                        <a href="/user/${top3List.get(2).no}"><img src="/profileImage/${top3List.get(2).profileImage}" class="profile_image" width="110" height="110">
                            <div class="nickname">${top3List.get(2).nickname}</div></a>
                    </div><!--//profile_box-->
                    <div class="tier second_ranking">
                   <c:choose>
		            	<c:when test="${top3List.get(2).registrationScore<=1000}">
		                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
		               	</c:when>
		                <c:when test="${top3List.get(2).registrationScore<=1500}">
		                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
		                </c:when>	
		                <c:when test="${top3List.get(2).registrationScore<=2000}">
		                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(2).registrationScore<=2500}">
		                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(2).registrationScore<=3000}">
		                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
		                </c:when>
		                <c:when test="${top3List.get(2).registrationScore<=3500}">
		                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
		                </c:when>
		                <c:otherwise>
		                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
		                </c:otherwise>
          	  		</c:choose>
                    </div>
                    <div class="adopt_num second_ranking">
                        <div class="title">채택된 문제 수</div><!--
                --><span class="adopt_num_text">${top3List.get(2).countVerifiedQuiz}</span> 개</div>
                    <div class="adopt_rate second_ranking">
                        <div class="title">채택률</div><!--
                --><span class="adopt_rate_text">${top3List.get(2).percentageOfVerification}</span> %</div>
                    <div class="correct_rate second_ranking">
                        <div class="title">정답률</div><!--
                --><span class="correct_rate_text">${top3List.get(2).otherUserCorrectRate}</span> %</div>
                </div><!---->
            </div><!--//second_inner-->
        </div><!--//second_ranking_box-->
        </c:if>
        <div class="third_box">
        <c:forEach items="${registers}" var="user">
            <div class="player_box">
                <div class="third_inner">
                    <div class="rank">${user.rank}</div>
                    <div class="profile_box">
                        <a href="/user/${user.no}">
                            <img src="/profileImage/${user.profileImage}" alt="profileImage" class="profile_image" width="80" height="80">
                            <div class="nickname">
                            <c:choose>
				                	<c:when test="${user.registrationScore<1000}">
				                	<img class="tier other_ranking" src="/img/TierBronze.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.registrationScore<1500}">
				                	<img class="tier other_ranking" src="/img/TierSilver.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.registrationScore<2000}">
				                	<img class="tier other_ranking" src="/img/TierGold.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.registrationScore<2500}">
				                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.registrationScore<3000}">
				                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.registrationScore<3500}">
				                	<img class="tier other_ranking" src="/img/TierMaster.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:otherwise>
				                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="24" height="20"></img>
				                	</c:otherwise>
				                </c:choose>
								${user.nickname}
							</div>
                        </a>
                    </div><!--//profile_box-->
                    <div class="adopt_num other_ranking">
                        <div class="title">채택된 문제 수</div>
                        <div class="adopt_num_text">${user.countVerifiedQuiz}개</div>
                    </div><!--adopt_num-->
                </div><!--//third_inners-->
            </div><!--//player_box-->
            </c:forEach>
        </div><!--//third_box-->
    	</div><!--//writeRankingTab-->
    	</c:when>
    	
    	<c:otherwise>
      	<!-- ///////////////검증랭킹/////////////// -->
        <div id="verificationRankingTab">
        <h3 class="screen_out">검증 랭킹</h3>
        <c:if test="${page==1}">
        <div class="topRankingBox">
                <div class="rank">1</div>
                <a href="/user/${top3List.get(0).no}"><img src="/profileImage/${top3List.get(0).profileImage}" alt="profileImage" class="profile_image" width="140" height="140">
                    <div class="nickname">${top3List.get(0).nickname}</div></a>
                <div class="tier top_ranking">
                <c:choose>
                	<c:when test="${top3List.get(0).verificationScore<1500}">
                	<img class="tier other_ranking" src="/img/TierBronze.png" width="180" height="120"></img>
                	</c:when>
                	<c:when test="${top3List.get(0).verificationScore<1750}">
                	<img class="tier other_ranking" src="/img/TierSilver.png" width="180" height="120"></img>
                	</c:when>
                	<c:when test="${top3List.get(0).verificationScore<2000}">
                	<img class="tier other_ranking" src="/img/TierGold.png" width="180" height="120"></img>
                	</c:when>
                	<c:when test="${top3List.get(0).verificationScore<2500}">
                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="180" height="120"></img>
                	</c:when>
                	<c:when test="${top3List.get(0).verificationScore<3000}">
                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="180" height="120"></img>
                	</c:when>
                	<c:when test="${top3List.get(0).verificationScore<3500}">
                	<img class="tier other_ranking" src="/img/TierMaster.png" width="180" height="120"></img>
                	</c:when>
                	<c:otherwise>
                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="180" height="120"></img>
                	</c:otherwise>
                </c:choose>
                </div>
                <div class="error_adopt_num top_ranking">
                    <div class="title">오류 채택 수</div><!--
                --><span class="error_adopt_text"></span>${top3List.get(0).errorCount}개</div>
                <div class="verification_adopt_num top_ranking">
                    <div class="title">검증문제 채택 수</div><!--
                --><span class="verification_adopt_text">${top3List.get(0).verifyQuizAdoptCount}</span> 개</div>
                <div class="verification_num top_ranking">
                    <div class="title">검증한 문제 수</div><!--
                --><span class="verification_text">${top3List.get(0).verifyQuizCount}  </span> 개</div>
            </div><!--//topRankingBox-->

        <div class="second_ranking_box">
                <div class="second_inner left">
                    <div class="rank">2</div>
                    <div class="profile_box">
                        <a href="/user/${top3List.get(1).no}"><img src="/profileImage/${top3List.get(1).profileImage}" alt="profileImage" class="profile_image" width="110" height="110">
                            <div class="nickname">${top3List.get(1).nickname}</div></a>
                    </div><!--//profile_box-->
                    <div class="tier second_ranking">
                    <c:choose>
                	<c:when test="${top3List.get(1).verificationScore<1000}">
                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
                	</c:when>
                	<c:when test="${top3List.get(1).verificationScore<1500}">
                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
                	</c:when>
                	<c:when test="${top3List.get(1).verificationScore<2000}">
                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
                	</c:when>
                	<c:when test="${top3List.get(1).verificationScore<2500}">
                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
                	</c:when>
                	<c:when test="${top3List.get(1).verificationScore<3000}">
                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
                	</c:when>
                	<c:when test="${top3List.get(1).verificationScore<3500}">
                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
                	</c:when>
                	<c:otherwise>
                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
                	</c:otherwise>
                </c:choose>
                </div>
                    <div class="error_adopt_num second_ranking">
                        <div class="title">오류 채택 수</div><!--
                --><span class="error_adopt_text">${top3List.get(1).errorCount}</span> 개</div>
                    <div class="verification_adopt_num second_ranking">
                        <div class="title">검증문제 채택 수</div><!--
                --><span class="verification_adopt_text">${top3List.get(1).verifyQuizAdoptCount}</span> 개</div>
                    <div class="verification_num second_ranking">
                        <div class="title">검증한 문제 수</div><!--
                --><span class="verification_text">${top3List.get(1).verifyQuizCount}</span> 개</div>
                </div><!--//second_inner-->

                <div class="second_inner right">
                    <div >
                        <div class="rank">3</div>
                        <div class="profile_box">
                            <a href="/user/${top3List.get(2).no}"><img src="/profileImage/${top3List.get(2).profileImage}" alt="profileImage" class="profile_image" width="110" height="110">
                                <div class="nickname">${top3List.get(2).nickname}</div></a>
                        </div><!--//profile_box-->
                        <div class="tier second_ranking">
                        <c:choose>
		                	<c:when test="${top3List.get(2).verificationScore<1000}">
		                	<img class="tier other_ranking" src="/img/TierBronze.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:when test="${top3List.get(2).verificationScore<1500}">
		                	<img class="tier other_ranking" src="/img/TierSilver.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:when test="${top3List.get(2).verificationScore<2000}">
		                	<img class="tier other_ranking" src="/img/TierGold.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:when test="${top3List.get(2).verificationScore<2500}">
		                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:when test="${top3List.get(2).verificationScore<3000}">
		                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:when test="${top3List.get(2).verificationScore<3500}">
		                	<img class="tier other_ranking" src="/img/TierMaster.png" width="130" height="70"></img>
		                	</c:when>
		                	<c:otherwise>
		                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="130" height="70"></img>
		                	</c:otherwise>
		                </c:choose>
                        </div>
                        <div class="error_adopt_num second_ranking">
                            <div class="title">오류 채택 수</div><!--
                    --><span class="error_adopt_text">${top3List.get(2).errorCount}</span> 개</div>
                        <div class="verification_adopt_num second_ranking">
                            <div class="title">검증문제 채택 수</div><!--
                    --><span class="verification_adopt_text">${top3List.get(2).errorCount}</span> 개</div>
                        <div class="verification_num second_ranking">
                            <div class="title">검증한 문제 수</div><!--
                    --><span class="verification_text">${top3List.get(2).errorCount}</span> 개</div>
                    </div><!---->
                </div><!--//second_inner-->
            </div><!--//second_ranking_box-->
		</c:if>
        <div class="third_box">
                <c:forEach items="${verifiers}" var="user">
                <div class="player_box">
                    <div class="third_inner">
                        <div class="rank">${user.rank}</div>
                        <div class="profile_box">
                            <a href="/user/${user.no}">
                                <img src="/profileImage/${user.profileImage}" alt="profileImage" class="profile_image" width="80" height="80">
                                <div class="nickname">
                                <c:choose>
				                	<c:when test="${user.verificationScore<1000}">
				                	<img class="tier other_ranking" src="/img/TierBronze.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.verificationScore<1500}">
				                	<img class="tier other_ranking" src="/img/TierSilver.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.verificationScore<2000}">
				                	<img class="tier other_ranking" src="/img/TierGold.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.verificationScore<2500}">
				                	<img class="tier other_ranking" src="/img/TierPlatinum.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.verificationScore<3000}">
				                	<img class="tier other_ranking" src="/img/TierDiamond.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:when test="${user.verificationScore<3500}">
				                	<img class="tier other_ranking" src="/img/TierMaster.png" width="24" height="20"></img>
				                	</c:when>
				                	<c:otherwise>
				                	<img class="tier other_ranking" src="/img/TierGrandMaster.png" width="24" height="20"></img>
				                	</c:otherwise>
				                </c:choose>
								${user.nickname}
								</div>
                            </a>
                        </div><!--//profile_box-->
                        <div class="error_adopt_num other_ranking">
                            <div class="title">오류 채택 수</div>
                            <div class="error_adopt_num_text">${user.errorCount}개</div>
                        </div><!--error_adopt_num-->
                    </div><!--//third_inners-->
                </div><!--//player_box-->
                </c:forEach>
            </div><!--//third_box-->
        </div><!--//verificationRankingTab-->
		</c:otherwise>
		
	</c:choose>
    <div id="paginate">
        ${paginate}
    </div><!--//paginate-->
    </div><!--//rankingWrap-->

	
    <!--                   빈 페이지                    -->
    <div id="searchFailWrap">
        <div id="searchFailBox">
            <p><i class="fas fa-exclamation-circle"></i></p>
            <span id="searchFailText">랭킹을 집계중입니다.</span>
        </div><!--//searchFailBox-->
    </div><!--//searchFailWrap-->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="/js/template.js"></script>
<script>
    let $menuWrapLi = $("#menuWrap li");
    let $playRanking = $('#playRanking');
    let $writeRanking = $('#writeRanking');
    let $playRankingTab = $('#playRankingTab');
    let $writeRankingTab = $('#writeRankingTab');
    let $verificationRankingTab = $('#verificationRankingTab');
    let $searchBtn = $('#searchBtn');
    let $searchInput = $('#searchInput');
    let $searchFailWrap = $('#searchFailWrap');
    let $searchFailWrapSpan = $('#searchFailWrap span');
    let $rankingWrap = $('#rankingWrap');


    let $playerBoxWinnigRateText = $(".player_box .winning_rate_text");
    let $topRankingBoxWinnigRateText = $(".topRankingBox .winning_rate_text");
    let $secondrankingBoxWinnigRateText = $(".second_ranking_box .winning_rate_text");
    let text = "0%";
    let textval = 0;
    let value = 0;



    setWinnigRateBar();
    function setWinnigRateBar(){

        $topRankingBoxWinnigRateText.each(function () {
            value = 0;
            text = this.dataset.value;
            textval = text.substr(0, text.length-1);
                $(this).css("width",text).text(text);

            // console.log("살려줘");
            // let valueIncrease = setInterval(function () {
            //     value = value+text/100;
            //     console.log("안끝난다");
            // },2);//setInterval() end
            // clearInterval(valueIncrease);

            if(textval < 40) {
                $(this).css("text-indent", "-40px");
            }
        })//playerBoxWinningRateText.each() end

        $secondrankingBoxWinnigRateText.each(function () {
            text = this.dataset.value;
            textval = text.substr(0, text.length-1);
            $(this).css("width",text).text(text);
            if(textval < 40) {
                $(this).css("text-indent", "-40px");
            }
        })//playerBoxWinningRateText.each() end

        $playerBoxWinnigRateText.each(function () {
            text = this.dataset.value;
            textval = text.substr(0, text.length-1);
            $(this).css("width",text).text(text);
            if(textval < 40) {
                $(this).css("text-indent", "-38px");
            }
        })//playerBoxWinningRateText.each() end

    }//setWinnigRateBar end


    //writeRankingChart 차트관련
    let $writeDonut = $("#writeDonut");
    let writeDonutData = {
        datasets: [{
            data: [59,43,0,0,4,
                2,0,3,5,0,
                0,3,4,0,0],
            backgroundColor: ['#EF9A9A', '#B0BEC5', '#CE93D8',
                '#E6EE9C', '#9FA8DA', '#90CAF9',
                '#F48FB1', '#C5E1A5', '#FFAB91',
                '#A5D6A7', '#80DEEA', '#B39DDB',
                '#FFF59D', '#80CBC4', '#BCAAA4']
        }],
        labels: [
            "일반상식", "과학", "경제", "법률", "예술",
            "스포츠", "역사", "인문", "지리", "TV/영화/만화",
            "게임", "IT", "인물", "생물", "의학"
        ]
    };//donutData end
    let writeDonutChart = new Chart($writeDonut, {
        type: 'doughnut',
        data: writeDonutData,
        options: {
            title: {
                display: true,
                text: "카테고리별 채택된 문제 개수",
                fontSize: 16
            },
            cutoutPercentage: 0, // 도넛 가운데 구멍 크기(50은 기본 0은 꽉 막힘)
            rotation: 0.5 * Math.PI, // 시작 각도 변경 (기본: -0.5 * Math.PI)
            animation: {animateScale: true, animateRotate: true}// 차트 나타날 때 애니메이션
        }
    });//donutChart end

    //검색 결과가 없을 때 함수
    function searchFail() {
        let text = $searchInput.val();
        if(!text) {
            $rankingWrap.hide();
            $searchFailWrap.show();
            if($playRanking.hasClass('on')) {
                $searchFailWrapSpan.text("게임 플레이 기록이 없습니다.");
            } else if($writeRanking.hasClass('on')) {
                $searchFailWrapSpan.text("문제를 출제한 기록이 없습니다.");
            } else {
                $searchFailWrapSpan.text("문제를 검증한 기록이 없습니다.");
            }//if(onClass) end
        }//if(기록x) end
    }//searchFail() end
    //검색창 input에서 엔터를 눌렀을 때
    $searchInput.on('keydown', function (e) {
        if(e.keyCode==13) {
            searchFail();
        }//if end
    });//searchInput end

    $searchBtn.on('click',searchFail);
    //searchBtn.click end

    

</script>
</body>
</html>