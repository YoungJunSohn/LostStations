<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.spoon.loststations.dao.ChoicesDAOImpl"%>
<%@page import="com.spoon.loststations.vo.Choice"%>
<%@page import="java.util.List"%>
<%@page import="com.spoon.loststations.dao.UsersDAOImpl"%>
<%@page import="com.spoon.loststations.vo.QuizInfo"%>
<%@page import="com.spoon.loststations.dao.QuizInfosDAOImpl"%>
<%@page import="com.spoon.loststations.util.PaginateUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Lost Stations</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="/css/quizDetailView.css" />
<c:import url="/WEB-INF/template/link.jsp"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>

	<div id="totalWrap">
		<section id="quizDetailBox">
			<section id="quizWrap">
			
				<h3 class="screen_out">문제</h3>
				<article id="quizDetailInfoBox">
					<div id="category">
					<c:choose>
						<c:when test="${quizDetailInfo.category==1}">
						<i class="fas fa-user-graduate"> 일반상식</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==2}">
						<i class="fas fa-flask"> 과학</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==3}">
						<i class="fas fa-dollar-sign"> 경제</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==4}">
						<i class="fas fa-balance-scale"> 법률</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==5}">
						<i class="fas fa-music"> 예술</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==6}">
						<i class="fas fa-basketball-ball"> 스포츠</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==7}">
						<i class="fas fa-landmark"> 역사</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==8}">
						<i class="fas fa-book"> 인문</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==9}">
						<i class="fas fa-globe-asia"> 지리</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==10}">
						<i class="fas fa-tv"> TV/영화/만화</i>
						</c:when>
						<c:when test="${quizDetailInfo.category==11}">
  				 		<i class="fas fa-gamepad"> 게임</i>
  				 		</c:when>
  				 		<c:when test="${quizDetailInfo.category==122}">
   						<i class="fab fa-android"> IT</i>
   						</c:when>
   						<c:when test="${quizDetailInfo.category==13}">
   						<i class="fas fa-user"> 인물</i>
   						</c:when>
   						<c:when test="${quizDetailInfo.category==14}">
   						<i class="fas fa-dog"> 생물</i>
   						</c:when>
						<c:when test="${quizDetailInfo.category==15}">
   						<i class="fas fa-syringe"> 의학</i>
   						</c:when>
                	</c:choose>
                </div>
                <span id="regDate" class="quiz_information">${quizDetailInfo.regdate}</span>
                <span id="views" class="quiz_information" ><i class="fas fa-eye"></i> ${quizDetailInfo.views}</span>
            </article><!--//quizDetailInfoBox-->
            <article id="quizBox">
                <p class="quiz">${quizDetailInfo.quizContent}</p>
                
                
                 <div id="modifier" class="writer"  data-value="${quizDetailInfo.nickname}">
                    <div class="modifier mark">채택</div>
                    <a href="/profile.jsp?no=${quizDetailInfo.userNo}">
                    <img src="/profileImage/${quizDetailInfo.profileImage}" alt="${quizDetailInfo.nickname}"/>
                    <img class="quiz_list_tier" src="/img/TierGrandMaster.png" width="15" height="15"/>
                    <div class="nick_name">${quizDetailInfo.nickname}</div>
                    </a>
                </div>

                
                <div id="writer" class="writer" data-value="${quizDetailInfo.nickname}">
                	<div class="a_writer mark">출제</div>
                    <a href="/profile.jsp?no=${quizDetailInfo.userNo}">
                    <img src="/profileImage/${quizDetailInfo.profileImage}" alt="${quizDetailInfo.nickname}"/>
                    <img class="quiz_list_tier" src="/img/TierGrandMaster.png" width="15" height="15"/>
                    <div class="nick_name">${quizDetailInfo.nickname}</div>
                    </a>
                </div>
            </article><!--//questionBox-->
				<article id="answerChoiceWrap">
					<h2 class="screen_out">정답표시박스</h2>
					<!--각 data-value 값을 표현식으로 작성할 것(값을 얻어오기 위함)-->
					<ul id="answerChoice">
					<c:choose>
					<c:when test='${quizDetailInfo.type=="MC"}'>
						
						<c:forEach items="${choiceList}" var="choice" varStatus="status">
							<li>
								<div class="choice <c:if test="${answer==-5}">on</c:if>">
									<input <c:if test="${answer!=-5&&answer==choice.no}">
										checked
										</c:if>
										id="choice${status.index+1}" data-index="${quizDetailInfo.chNo}" class="radio" name="choice"
										type="radio" value="${choice.no}"/>
									<label class="choice_label 
										<c:if test="${answer==choice.getNo()}">block</c:if>
										<c:if test="${answer!=-5}">
											<c:choose>
											<c:when test="${choice.no==quizDetailInfo.chNo}">
											correct correct_answer
											</c:when>
											<c:otherwise>
												wrong					
											</c:otherwise>
											</c:choose>
										</c:if>" data-value="${choice.content}" for="choice${status.index+1}">${choice.content}
									</label>
								</div> <!--//choice1-->
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<li>
							<div class="ox_answer_choice">
		                        <input
								<c:if test="${answer!=-5&&answer==0}">checked</c:if>
		                         type="radio" class="radio" id="oxChoice1" name="oxChoice1" data-index="${quizDetailInfo.chNo}" value="0">
		                        <label class="lbl2 o <c:if test="${answer==-5}">on</c:if>
		                        <c:if test="${answer!=-5}">
		                        	<c:choose>
									<c:when test="${0==quizDetailInfo.chNo}">
		                        		correct_answer
		                        	</c:when>
									<c:otherwise>
		                        		wrong
		                        	</c:otherwise>
									</c:choose>
		                        </c:if>" for="oxChoice1"><i class="material-icons">trip_origin</i></label>
	                    	</div>
						</li>
						<li>
							<div class="ox_answer_choice">
		                        <input
		                        <c:if test="${answer!=-5&&answer==(-1)}">checked</c:if>
		                         type="radio" class="radio" id="oxChoice2" name="oxChoice2" data-index="${quizDetailInfo.chNo}" value="-1">
		                        <label class="lbl2 <c:if test="${answer==-5}">on</c:if>
		                        <c:if test="${answer!=-5}">
		                        	<c:choose>
									<c:when test="${(-1)==quizDetailInfo.chNo}">
		                        		correct_answer
		                        	</c:when>
									<c:otherwise>
		                        		wrong
		                        	</c:otherwise>
									</c:choose>
		                        </c:if>
		                         " for="oxChoice2"><i class="fas fa-times"></i></label>
                    		</div>
						</li>
					</c:otherwise>
					</c:choose>
					</ul>
				</article>
				<!--//answerChoiceWrap end-->
			</section>
			<!--//quizWrap end-->
			<!--해설 -->
			<section id="commentaryBox">
	            <div id="commentaryTitle">해설</div>
	            <div class="commentaryContent"> ${quizDetailInfo.expContent}</div>
	            <div id="commentaryContentHide" 
	            <c:if test="${answer!=-5}">style="display: none"</c:if>>?</div>
        	</section><!--//commentaryBox-->

			<!--검증바, 신고하기 버튼-->
			<section id="verificationBarWrap">
				<div id="verificationBar">
				
					
					 <div class="like" >
        				<input id="disLike" type="radio" class="radio dislike like"   name="disLikeBox" value="D"/>
        				<label data-value="${no}" class="comment_like_box_input dislike_label 
	        				<c:if test="${comment.likeConfirm=='D'}">on</c:if>" 
	        				for="disLike">
	        				<i class="far fa-thumbs-down"></i> ${quizInfo.dislikes}
        				</label>
    				</div><!--disLikes-->

					
					<div class="box_wrap">
						<div class="count_spoon_bar_box">
							<div id="negativeCountSpoonBarBox">
								꺾가락
								<div id="negativeCountSpoonBar" data-value="${quizInfo.dislikes}">꺾가락</div>
							</div>
							<!--//negativeCountSpoonBarBox-->
						</div>
						<!--//count_spoon_bar-->
						<div class="count_spoon_bar_box">
							<div id="positiveCountSpoonBarBox">
								숟가락
								<div id="positiveCountSpoonBar" data-value="${quizInfo.likes}">숟가락</div>
							</div>
							<!--//positiveCountSpoonBarBox-->
						</div>
						<!--//count_spoon_bar-->
						
						
						
						
						
					<div class="like" >
        				<input id="like" type="radio" class="radio like"  name="likeBox" value="D"/>
        				<label data-value="${no}" class="comment_like_box_input like_label 
	        				<c:if test="${comment.likeConfirm=='L'}">on</c:if>" 
	        				for="like">
	        				<i class="far fa-thumbs-up"></i> ${quizInfo.likes}
        				</label>
    				</div><!--likes-->
					
					</div>
					<!--//box_wrap-->
				</div>
				<!--//verificationBar-->
				<button class="reportBtn" title="문제 신고하기">
					<i class="fas fa-bullhorn"></i>
				</button>
				<!--    신고완료 팝업     -->
				<div id="reportPopupConfirm">
					<div>
						<button id="reportPopupCloseBtn" class="cancel_btn">
							<i class="fas fa-window-close"></i>
						</button>
					</div>
					<div id="reportCompleteText">
						<!--
                    -->
						신고접수가 완료되었습니다.
					</div>
					<!--//reportCompleteText-->
				</div>
				<!--//popupReportConfirm -->
				<!--     신고하기 팝업       -->
				<div id="reportPopup">
					<div id="reportHeader">
						<div id="reportTitle">신고하기</div>
						<div id="reportedPerson">작성자 : ${quizInfo.nickname}</div>
					</div>
					<div id="reportContent">
						<div>
							<label class="choice_reason" for="report1">음란 또는 청소년에게
								부적합한 내용</label> <input id="report1" type="radio" name="report" value="a">
						</div>
						<div>
							<label class="choice_reason" for="report2">부적절한 홍보</label> <input
								id="report2" type="radio" name="report" value="a">
						</div>
						<div>
							<label class="choice_reason" for="report3">개인정보 노출</label> <input
								id="report3" type="radio" name="report" value="a">
						</div>
						<div>
							<label class="choice_reason" for="report4">저작권 및 명예훼손,
								기타권리 침해</label> <input id="report4" type="radio" name="report" value="a">
						</div>
					</div>
					<!--//reportContent-->
				
					<div id="reportFooter">
						<button class="btn cancel_btn">취소</button>
						<button id="reportSubmitBtn" class="btn">신고하기</button>
					</div>
					<!--//reportFooter-->
				</div>
				<!--//reportPopup -->
			</section>
			<!--// verificationBarWrap  -->


			<!--댓글/의견/오류-->
			<!--필터-->
			<div id="commentBoxWrap">
				<input type="radio" class="radio" id="opinionCommentBox"
					name="commentBox" value="" checked> <label
					class="box_info opinionCommentBox" for="opinionCommentBox">의견</label>
				<input type="radio" class="radio" id="errorCommentBox"
					name="commentBox" value=""> <label
					class="box_info errorCommentBox" for="errorCommentBox">오류</label>
			</div>
			<!--//totalCommentBox-->
			<!--댓글 목록-->
			<div id="commentListWrap" class="show">
				<ul id="commentList">

				</ul>
				<div id="commentPaginate" class="paginate">
					<a href="" title="이전 페이지로" id="prev"> <i
						class="fas fa-caret-left"></i><span class="screen_out">이전
							페이지</span></a> <a href="" title="1">1</a> <a href="" title="2">2</a> <a
						href="" title="3">3</a> <a href="" title="4">4</a> <a href=""
						title="5">5</a> <a href="" title="다음 페이지로" id="next"> <i
						class="fas fa-caret-right"></i> <span class="screen_out">다음
							페이지</span></a>
				</div>
				<!--//paginate-->
				<div id="commentRegisterFormWrap">
					<div id="CommentRegisterForm"></div>
					<form id="opinionCommentRegisterForm">
						<h3 class="screen_out">의견 댓글 등록</h3>
						<div id="opinionTxt" class="comment_form">
							<div class="comment_text_box">
								<textarea id="opinionContent" class="textarea"
									placeholder="의견을 작성해주세요"></textarea>
							</div>
							<div class="comment_register_btn">등록</div>
							<div id="writeMsg0" class="msg"></div>
						</div>
						<!--//commentForm-->
					</form>
					<!--//opinionCommentRegisterForm-->
				</div>
				<!--//commentRegisterFormWrap-->
			</div>
			<!--//commentListWrap-->
			<div id="errorCommentListWrap">
				<ul id="errorCommentList">

				</ul>
				<div id="errorPaginate" class="paginate">
					<a href="" title="이전 페이지로" id="prev"> <i
						class="fas fa-caret-left"></i><span class="screen_out">이전
							페이지</span></a> <a href="" title="1">1</a> <a href="" title="2">2</a> <a
						href="" title="3">3</a> <a href="" title="4">4</a> <a href=""
						title="5">5</a> <a href="" title="다음 페이지로" id="next"> <i
						class="fas fa-caret-right"></i> <span class="screen_out">다음
							페이지</span></a>
				</div>
				<div id="errorCommentRegisterFormWrap">
					<div id="errorTypeTab">
						<div id="errorType">
							<div>
								<input type="radio" class="radio" id="category16"
									name="category" checked> <label class="category_error"
									for="category16"><i class="fas fa-list-alt"></i> 카테고리</label>
							</div>
							<div>
								<input type="radio" class="radio" id="category17"
									name="category"> <label class="category_error"
									for="category17"><i class="far fa-question-circle"></i>
									문제</label>
							</div>
							<div>
								<input type="radio" class="radio" id="category18"
									name="category" data-type="${quizInfo.type}"> <label
									class="category_error" for="category18"><i
									class="fas fa-shapes"></i> OX/4지선다</label>
							</div>
							<div>
								<input type="radio" class="radio" id="category20"
									name="category"> <label class="category_error"
									for="category20"><i class="fas fa-chalkboard-teacher"></i>
									해설</label>
							</div>
						</div>
						<!--//errorType-->

						<form id="categoryErrorCommentForm">
							<div id="categorySelectWrap">
								<div class="error_type_title">카테고리 오류 제보</div>
								<input type="radio" class="radio" id="category1" name="category"
									value="1"> <label class="lbl category" for="category1"><i
									class="fas fa-user-graduate"></i> 일반상식</label> <input type="radio"
									class="radio" id="category2" name="category" value="2">
								<label class="lbl category" for="category2"><i
									class="fas fa-flask"></i> 과학</label> <input type="radio" class="radio"
									id="category3" name="category" value="3"> <label
									class="lbl category" for="category3"><i
									class="fas fa-dollar-sign"></i> 경제</label> <input type="radio"
									class="radio" id="category4" name="category" value="4">
								<label class="lbl category" for="category4"><i
									class="fas fa-balance-scale"></i> 법률</label> <input type="radio"
									class="radio" id="category5" name="category" value="5">
								<label class="lbl category" for="category5"><i
									class="fas fa-music"></i> 예술</label> <input type="radio" class="radio"
									id="category6" name="category" value="6"> <label
									class="lbl category" for="category6"><i
									class="fas fa-basketball-ball"></i> 스포츠</label> <input type="radio"
									class="radio" id="category7" name="category" value="7">
								<label class="lbl category" for="category7"><i
									class="fas fa-landmark"></i> 역사</label> <input type="radio"
									class="radio" id="category8" name="category" value="8">
								<label class="lbl category" for="category8"><i
									class="fas fa-book"></i> 인문</label> <input type="radio" class="radio"
									id="category9" name="category" value="9"> <label
									class="lbl category" for="category9"><i
									class="fas fa-globe-asia"></i> 지리</label> <input type="radio"
									class="radio" id="category10" name="category" value="10">
								<label class="lbl category" for="category10"><i
									class="fas fa-tv"></i> TV/영화/만화</label> <input type="radio"
									class="radio" id="category11" name="category" value="11">
								<label class="lbl category" for="category11"><i
									class="fas fa-gamepad"></i> 게임</label> <input type="radio"
									class="radio" id="category12" name="category" value="12">
								<label class="lbl category" for="category12"><i
									class="fab fa-android"></i> IT</label> <input type="radio"
									class="radio" id="category13" name="category" value="13">
								<label class="lbl category" for="category13"><i
									class="fas fa-user"></i> 인물</label> <input type="radio" class="radio"
									id="category14" name="category" value="14"> <label
									class="lbl category" for="category14"><i
									class="fas fa-dog"></i> 생물</label> <input type="radio" class="radio"
									id="category15" name="category" value="15"> <label
									class="lbl category" for="category15"><i
									class="fas fa-syringe"></i> 의학</label>
								<button id="cRegistBtn" class="register_confirm_btn" type="submit">등록</button>
								<div id="writeMsg1" class="msg"></div>
							</div>
							<!--//categorySelectWrap-->
						</form>

						<form id="quizContent">
							<div id="quizContentText">
								<div class="error_type_title">문제 오류 제보</div>
								<div>
									<!--                            **************************-->
									<textarea id="qError" class="quiz_contents textarea txt"
										name="contents" placeholder="문제를 작성해주세요."></textarea>
									<div class="quiz_contents_size_wrap">
										<span class="quiz_contents_size">0</span>/150
									</div>
									<!--                        *******************************************-->
								</div>
								<div class="error_type_title">해설 또는 설명</div>
								<div class="commentary_error">
									<!--      요기                      -->
									<textarea id="eError" class="commentary textarea txt"
										name="commentary" placeholder="해설 또는 설명을 작성해주세요."></textarea>
									<div class="quiz_commentary_size_wrap">
										<span class="quiz_commentary_size">0</span>/300
									</div>
									<!--                            -->
								</div>
								<!--//commentaryError-->
								<button id="qRegistBtn" class="register_confirm_btn" type="submit">등록</button>
								<div id="writeMsg2" class="msg"></div>
							</div>
						</form>
						<!--//quizContentText-->


						<form id="oxTypeErrorForm">
							<div id="oxTypeSelect">
								<div class="error_type_title">OX퀴즈 오류 제보</div>
								<div class="type_box">
									<div class="type_wrap">
										<input id="typeO" class="radio" type="radio" name="oxAnswer"
											value="0" /> <label class="typeO ox_type" for="typeO">O</label>
									</div>
									<div class="type_wrap">
										<input id="typeX" class=" radio " type="radio" name="oxAnswer"
											value="-1" /> <label class="typeX ox_type" for="typeX">X</label>
									</div>
								</div>
							</div>
							<!--//quizTypeSelect-->
							<div class="error_type_title">해설 또는 설명</div>
							<div class="commentary_error">
								<!--                            -->
								<textarea id="oxErrorExplanation"
									class="commentary textarea txt" name="commentary"
									placeholder="해설 또는 설명을 작성해주세요."></textarea>
								<div class="quiz_commentary_size_wrap">
									<span class="quiz_commentary_size">0</span>/300
								</div>
								<!--                            -->
							</div>
							<!--//commentaryError-->
							<button id="oxRegisterBtn" class="register_confirm_btn" type="submit">등록</button>
							<div id="writeMsg3" class="msg"></div>
						</form>
						<!--//quizTypeErrorForm-->

						<form id="multipleChoiceErrorForm">
							<div id="multipleTypeSelect">
								<div class="error_type_title">4지선다 오류 제보</div>
								<div id="choice1Wrap" class="four_choice">
									<input type="radio" class="radio txt" id="choice01"
										name="mcAnswer" value="0"> <label class="lbl"
										for="choice01"><i class="fas fa-check"></i></label> <input
										id="choice1Contents" class="mc_choice txt" name="mcChoice"
										placeholder="보기를 작성해주세요." />
								</div>
								<div id="choice2Wrap" class="four_choice">
									<input type="radio" class="radio txt" id="choice02"
										name="mcAnswer" value="1"> <label class="lbl"
										for="choice02"><i class="fas fa-check"></i></label> <input
										id="choice2Contents" class="mc_choice txt" name="mcChoice"
										placeholder="보기를 작성해주세요." />
								</div>
								<div id="choice3Wrap" class="four_choice">
									<input type="radio" class="radio txt" id="choice03"
										name="mcAnswer" value="2"> <label class="lbl"
										for="choice03"><i class="fas fa-check"></i></label> <input
										id="choice3Contents" class="mc_choice txt" name="mcChoice"
										placeholder="보기를 작성해주세요." />
								</div>
								<div id="choice4Wrap" class="four_choice">
									<input type="radio" class="radio txt" id="choice04"
										name="mcAnswer" value="3"> <label class="lbl"
										for="choice04"><i class="fas fa-check"></i></label> <input
										id="choice4Contents" class="mc_choice txt" name="mcChoice"
										placeholder="보기를 작성해주세요." />
								</div>
							</div>
							<!--//multipleTypeSelect-->
							<div class="error_type_title">해설 또는 설명</div>
							<div class="commentary_error">
								<!--                            -->
								<textarea id="mcErrorExplanation"
									class="commentary textarea txt" name="commentary"
									placeholder="해설 또는 설명을 작성해주세요."></textarea>
								<div class="quiz_commentary_size_wrap">
									<span class="quiz_commentary_size">0</span>/300
								</div>
								<!--                            -->
							</div>
							<!--//commentaryError-->
							<button id="mcRegisterBtn" class="register_confirm_btn" type="submit">등록</button>
							<div id="writeMsg4" class="msg"></div>
						</form>
						<!--//multipleChoiceErrorForm-->

						<form id="commentaryErrorForm">
							<div class="error_type_title">해설 오류 수정</div>
							<div class="commentary_error">
								<!--                            -->
								<textarea id="exError" class="commentary textarea txt"
									name="commentary" placeholder="해설 또는 설명을 작성해주세요."></textarea>
								<div class="quiz_commentary_size_wrap">
									<span class="quiz_commentary_size">0</span>/300
								</div>
								<!--                            -->
							</div>
							<!--//commentaryError-->
							<button id="eRegistBtn" class="register_confirm_btn" type="submit">등록</button>
							<div id="writeMsg5" class="msg"></div>
						</form>
						<!--//commentaryErrorForm-->
					</div>
				</div>
				<!--//errorCommentRegisterForm-->
			</div>
	</div>
	<!--//errorCommentRegisterForm--> <!--//quizDetailBox(content) end-->
	<div id="backToListBtn">
		<a href="quizList.jsp">목록으로 가기</a>
	</div>
	<!--//totalWrap-->
	
	<c:import url="/WEB-INF/template/footer.jsp"/>
	

	<!-- 의견 댓글 -->
	<script type="text/template" id="commentTmp">
<@_.each(comments, function(comment, index){@>
<li>
<div class="comment_writer">
	<a href="/profile.jsp?no=<@=comment.userNo@>">
		<div class="comment_profile_image" style="background-image :url(/profileImage/<@=comment.profileImage@>)"></div>
    	<div class="comment_nick_name"><@=comment.nickname@></div>
	</a>
    <@ if(${quizInfo.userNo}==comment.userNo) { @>
    <div class="writer_mark">출제자</div>
	<@ } @>
    
</div><!--//comment_writer end-->
<div class="comment_info">
        <div class="comment_reg_date"><@=moment(comment.regdate).format("YYYY-MM-DD")@></div>
    </div>
<div class="verify_comment_wrap">

    <div class="disLikeBox" >
        <input id="disLikeBoxInput1" type="radio" class="radio dislike"   name="disLikeBox" value="D"/>
        <label data-value="<@=comment.no@>" class="comment_like_box_input dislike_label <@if(comment.likeConfirm=="D") {@>on<@}@>" for="disLikeBoxInput1"><i class="far fa-thumbs-down"></i> <@=comment.dislikes@></label>
    </div><!--disLikeBox-->

    <div class="like_box" >
        <input id="likeBoxInput1" type="radio" class="radio like" name="likeBox" value="L"/>
        <label data-value="<@=comment.no@>" class="comment_like_box_input like_label <@if(comment.likeConfirm=="L") {@>on<@}@>" for="likeBoxInput1"><i class="far fa-thumbs-up"></i> <@=comment.likes@></label>
    </div><!--disLikeBox-->

</div><!--//verify_comment_wrap end-->

<!--댓글 내용 작성란-->
<div class="comment_text"><@=comment.content@></div>
<!--댓글갯수, 신고하기버튼-->
<div class="recomment_count_box">
    <button class="comment_report reportBtn" title="댓글 신고하기">
        <i class="fas fa-bullhorn"></i>
    </button>
</div>
</li>
<@})@>
</script>


	<!-- 오류 댓글 -->
	<script type="text/template" id="errorCommentTmp">
<@_.each(errorComments, function(errorComment, index){@>
<li>
<div class="comment_writer">
	<a href="/profile.jsp?no=<@=errorComment.userNo@>">
    	<div class="comment_profile_image" style="background-image :url(/profileImage/<@=errorComment.profileImage@>)"></div>
    	<div class="comment_nick_name"><@=errorComment.nickname@></div>
	</a>
	<@ if(${quizInfo.userNo}==errorComment.userNo) { @>
    <div class="writer_mark">출제자</div>
	<@ } @>
</div><!--//comment_writer end-->
<div class="comment_info">
    <div class="comment_reg_date"><@=moment(errorComment.regdate).format("YYYY-MM-DD")@></div>
</div>
<div class="verify_comment_wrap">
    <div class="disLikeBox" >
        <input id="disLikeBoxInput1" type="radio" class="radio dislike" name="disLikeBox"/>
        <label data-value="<@=errorComment.no@>" class="comment_like_box_input dislike_label <@if(errorComment.likeConfirm=="D"){@>on<@}@> error_likeDislike" for="disLikeBoxInput1"><i class="far fa-thumbs-down"></i> <@=errorComment.dislikes@></label>
    </div><!--disLikeBox-->
    <div class="like_box" >
        <input id="likeBoxInput1" type="radio" class="radio like" name="likeBox"/>
        <label data-value="<@=errorComment.no@>" class="comment_like_box_input like_label <@if(errorComment.likeConfirm=="L"){@>on<@}@> error_likeDislike " for="likeBoxInput1"><i class="far fa-thumbs-up"></i> <@=errorComment.likes@></label>
    </div><!--disLikeBox-->
</div><!--//verify_comment_wrap end-->

	<@ if(errorComment.categoryNo > 0) {@>
		<!-- 카테고리 오류 -->
		<div class="user_text comment_text6">
	        <div class="category_error_selected <@ if(errorComment.categoryNo==1){ @> selected <@ }@>"><i class="fas fa-user-graduate"></i> 일반상식</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==2){ @> selected <@ }@>"><i class="fas fa-flask"></i> 과학</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==3){ @> selected <@ }@>"><i class="fas fa-dollar-sign"></i> 경제</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==4){ @> selected <@ }@>"><i class="fas fa-balance-scale"></i> 법률</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==5){ @> selected <@ }@>"><i class="fas fa-music"></i> 예술</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==6){ @> selected <@ }@>"><i class="fas fa-basketball-ball"></i> 스포츠</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==7){ @> selected <@ }@>"><i class="fas fa-landmark"></i> 역사</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==8){ @> selected <@ }@>"><i class="fas fa-book"></i> 인문</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==9){ @> selected <@ }@>"><i class="fas fa-globe-asia"></i> 지리</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==10){ @> selected <@ }@>"><i class="fas fa-tv"></i> TV/영화/만화</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==11){ @> selected <@ }@>"><i class="fas fa-gamepad"></i> 게임</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==12){ @> selected <@ }@>"><i class="fab fa-android"></i> IT</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==13){ @> selected <@ }@>"><i class="fas fa-user"></i> 인물</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==14){ @> selected <@ }@>"><i class="fas fa-dog"></i> 생물</div>
	        <div class="category_error_selected <@ if(errorComment.categoryNo==15){ @> selected <@ }@>"><i class="fas fa-syringe"></i> 의학</div>
	    </div><!--//userQuestion2-->
	
	<@ }else if(errorComment.quizContent!=null) {@>

		<!-- 문제 오류 -->
		<div class="user_text comment_text3"><@=errorComment.quizContent@></div>
	    <div class="user_commentary comment_text3 non_view"><@=errorComment.expContent@></div>
		<div class="commentary_view_btn">설명/해설</div>

	<@ }else if(errorComment.correctContent > 0 && errorComment.choiceContent !=null) {@>
		<!-- 사지선다형 보기 오류 -->
		<div class="user_text comment_text5">
		<@_.each(errorComment.choiceContent, function(choice, index){@>
	        <div class="comment_multiple_choice <@ if(errorComment.correctContent == choice.no){ @>selected<@ }@>"><@=choice.content@></div>
		<@ })@>
	    </div>
	    <div class="user_commentary comment_text3 non_view"><@=errorComment.expContent@></div>
		<div class="commentary_view_btn">설명/해설</div>
	<@ }else if(errorComment.correctContent > -2 && errorComment.correctContent < 1 && errorComment.choiceContent ==null) {@>

		<!-- OX 보기 오류 -->
		<div class="user_text comment_text4">
	        <div class="comment_ox_choice <@ if(errorComment.correctContent == 0){ @> selected <@ }@>">O</div>
	        <div class="comment_ox_choice <@ if(errorComment.correctContent == -1){ @> selected <@ }@>">X</div>
	    </div><!--//userQuestion2-->
	    <div class="user_commentary comment_text3 non_view"><@=errorComment.expContent@></div>
		<div class="commentary_view_btn">설명/해설</div>
	
<@ }else if(errorComment.quizContent ==null && errorComment.correctContent < -1 && errorComment.expContent !=null) { @>
		<!-- 해설 오류 -->
		<div class="comment_text2"><@=errorComment.expContent@></div>
<@}@>
<@if(${quizInfo.userNo}==${loginUser.no }) { @>

	<button form="errorAdoptForm<@=index@>" class="comment_choice_btn">채택</button>
	<form id="errorAdoptForm<@=index@>" action="/quiz/${no}" method="post">
		<input type="hidden" name="_method" value="PUT" />
		<input type="hidden" name="emNo" value="<@=errorComment.no@>"/>
	</form>

<@}@>
	<div class="recomment_count_box">
    	<button class="comment_report reportBtn" title="댓글 신고하기">
      	  <i class="fas fa-bullhorn"></i>
   		</button>
	</div>
</li>
<@})@>
</script>

	<script src="/js/jquery.js"></script>
	<script src="/js/template.js"></script>
	<script src="/js/moment-with-locales.js"></script>
	<script src="/js/underscore-min.js"></script>

	<script>
	_.templateSettings = {
			interpolate : /\<\@\=(.+?)\@\>/gim,
			evaluate : /\<\@([\s\S]+?)\@\>/gim,
			escape : /\<\@\-(.+?)\@\>/gim
		};
	

		/*변수 선언란*/
		let $answerRadio = $("#answerChoice .radio");
		let $choice_label = $(".choice_label");
		let answerNum = -3;//나중에 db에서 정답보기 번호를 표현식으로 넣어줄 것
		let answerText = -1;
		let flag = true;
		let reportFlag = true;
		let flag2 = true;
		let flag10 = true;
		let userAnswer = -1;
		let userAnswerText = 2;
		let $commentaryContentHide = $("#commentaryBox #commentaryContentHide");
		let $quizReportBtn = $("#verificationBarWrap .reportBtn");
		let $reportPopup = $("#reportPopup");
		let $reportSubmitBtn = $("#reportSubmitBtn");
		let $reportPopupConfirm = $("#reportPopupConfirm");
		let $cancel_btn = $(".cancel_btn");
		let $negativeCountSpoonBar = $("#negativeCountSpoonBar");
		let $positiveCountSpoonBar = $("#positiveCountSpoonBar");
		let likeCount = 0;
		let $commentReportBtn = $("#commentList .reportBtn");
		let $errorTypeRadio = $("#errorType input");
		let $errorCommentRegisterFormWrap = $("#errorCommentRegisterFormWrap");
		let $commentRegisterBtn = $("#commentRegisterFormWrap .comment_register");
		let $opinion = $("#opinion");
		let $error = $("#error");
		
		let userNo = $(".user_info").attr("data-no");
		
		let $registerBtn = $(".comment_register_btn");

		let $commentProfile = $(".comment_profile_image, .comment_nick_name");
		//profile.jsp로 이동
		$commentProfile.on("click", function() {
			location.href = "profile.jsp";
		})//$commentProfile click() end
		
		
		let $prevChoice;
		/*함수 및 이벤트*/
		/*정답 클릭 시 이벤트 - 정답보기/답 색깔 표시 및 추가적인 클릭 방지*/
		$answerRadio.on("click", function() {
			$(".choice").removeClass("on");
			$(".lbl2").removeClass("on");
			
			/*플래그 이용하여 추가적인 표시 방지*/
			if (flag) {
				flag = false;
				answerNum = this.dataset.index;
				userAnswer = $(this).val();
				console.log(answerNum);
				console.log(userAnswer);
				//userAnswerText = $choice_label.eq(userAnswer).data("value");
				//answerText = $choice_label.eq(answerNum).data("value");
				$("#answerChoice li label").addClass("block");
				
				console.log($(this).get(0));
				
				/*정답표시 효과*/
				if (answerNum == userAnswer) {
					$(this).next().addClass("correct").addClass("correct_answer");
				} else {
					$(this).next().addClass("wrong");
					for(let i =1;i<5;i++){
						let $choice = $("#choice"+i);
						if($choice.val()==$choice.attr("data-index")) {
							$choice.next().addClass("correct_answer");
						}
					}
					for(let i =1;i<3;i++){
						let $choice = $("#oxChoice"+i);
						if($choice.val()==$choice.attr("data-index")) {
							$choice.next().addClass("correct_answer");
						}
					}
				}//if else answer-correct end
				$prevChoice = $(this);
				/*정답 선택 이후 해설 표시*/
				$commentaryContentHide.fadeOut(400);
			} else {
				$answerRadio.prop("checked", false);
				$prevChoice.prop("checked", true);
			}//if else flag end
		});//answerClick end
		
		
		let contentType = "";
		/*신고 버튼 클릭 시 팝업창 띄움*/
		$quizReportBtn.on("click", function() {
			reportChoiceInit();
			if (reportFlag) {
				reportFlag = false;
				$reportPopup.addClass("on");
				// contentType을 Q -> 문제신고
				contentType = "Q";
				
				$cancel_btn.on("click", function() {
					$reportPopup.removeClass("on");
					reportFlag = true;
				});//cancelBtn click fn end
			} else {
				alert("이미 신고하신 작성자입니다.");
			}//if  reportFlag end
		});//quizReportBtn click fn end
		
		/* 신고하기 버튼 클릭시 */
		$reportSubmitBtn.on("click", function() {
			// 신고 사유 초기화
			let reasonType = "";
			
			if($("#report1").is(":checked")) {
				reasonType = 'O'; // 1번째가 체크되었을때 신고사유타입 = O
			} else if($("#report2").is(":checked")) {
				reasonType = 'I'; // 2번째가 체크되었을때 신고사유타입 = I
			} else if($("#report3").is(":checked")) {
				reasonType = 'P'; // 3번째가 체크되었을때 신고사유타입 = P
			} else if($("#report4").is(":checked")) {
				reasonType = 'D'; // 4번째가 체크되었을때 신고사유타입 = D
			}
			console.log(contentType);
			
			$.ajax({
				url : "/ajax/report",
				dataType : "json",
				data: {
					userNo : ${loginUser.no},
					contentType : contentType,
					contentNo : ${no},
					reasonType: reasonType
				},
				type : "POST",
				error : function() {
					alert("서비스 점검중입니다.");
				}, // error end
				success : function(json) {
					if(json.result == 0) {
						$("#reportCompleteText").text("이미 신고하신 작성자입니다.");
					} 
				} // success end
			}); // ajax() end
			$reportPopup.removeClass("on");
			$reportPopupConfirm.css("display", "block");
			$cancel_btn.on("click", function() {
				$reportPopupConfirm.css("display", "none");
			})//cancel_btn on click end;
		});//reportSubmitBtn.on clock end

		//막대기 좋아요 싫어요 - 수정이
		function countLike() {
			let calculateCount = $positiveCountSpoonBar.attr("data-value")
					- $negativeCountSpoonBar.attr("data-value");

			if (calculateCount < 0) {
				$positiveCountSpoonBar.css("width", "0px");
				calculateCount = calculateCount * (-1) * 18;
				$negativeCountSpoonBar.css("width", calculateCount + "px");
			} else if (calculateCount > 0) {
				$negativeCountSpoonBar.css("width", "0px");
				calculateCount = calculateCount * 18;
				$positiveCountSpoonBar.css("width", calculateCount + "px");
			} else if(calculateCount==0) {
				$negativeCountSpoonBar.css("width", "10px");
				$positiveCountSpoonBar.css("width", "10px");
			}//if else end
		}//fn like end
		countLike(); // 최초 1회 실행

		$cancel_btn.on("click", function() {
			$reportPopup.removeClass("on");
			flag2 = true;
		});//cancelBtn click fn end
		
		$reportSubmitBtn.on("click", function() {
			// alert();
			$reportPopup.removeClass("on");
			$reportPopupConfirm.css("display", "block");
		});//reportSubmitBtn on click end
		
		$cancel_btn.on("click", function() {
			$reportPopupConfirm.css("display", "none");
		})//cancel_btn.on click end
		//퀴즈 신고
		
		
		
	//*********************** 수정이 여기서부터 계속 ********************************	
		
		
		
		$commentReportBtn.on("click", function() {
			if (flag2) {
				flag2 = false;
				$reportPopup.addClass("on");
			} else {
				alert("이미 신고하신 작성자입니다.");
			}//if  flag end
		});//quizReportBtn click fn end

		//오류 수정 댓글 달기

		$opinion.on("click", function() {
			$errorCommentRegisterFormWrap.hide();
			$("#opinionCommentRegisterForm").show();
		}); // commentregisterFormWrap error

		$error.on("click", function() {
			$errorCommentRegisterFormWrap.show();
			$("#opinionCommentRegisterForm").hide();
		}); // commentregisterFormWrap error

		$errorTypeRadio.on("change", function() {
			$("#errorTypeTab form").hide();
			if ($("#category16").is(":checked")) {
				$("#categoryErrorCommentForm").show();
			} else if ($("#category17").is(":checked")) {
				$("#quizContent").show();
			} else if ($("#category18").is(":checked")) {

				quizType = this.dataset.type;

				if (quizType == "OX") {

					$("#oxTypeErrorForm").show();

				} else {

					$("#multipleChoiceErrorForm").show();
				}
			} else if ($("#category20").is(":checked")) {
				$("#commentaryErrorForm").show();
			}//if else end

		});//errorTypeRadio change fn end

		$("body").on("click", ".commentary_view_btn", function() {
			$this = $(this);
			$this.parent().find(".user_text").toggleClass("non_view");
			$this.parent().find(".user_commentary").toggleClass("non_view");
		})//commentarybtn click fn end

		//******************  글자수제한  *************************************************

		const $quiz_contents = $(".quiz_contents");
		const $quiz_contents_size = $(".quiz_contents_size");
		const $commentary = $(".commentary");
		const $quiz_commentary_size = $(".quiz_commentary_size");

		//문제작성 팝업에서 문제 글자 수 제한
		$quiz_contents.keyup(function() {
			$this = $(this);
			let text = $this.val();
			let size = text.length;
			if (size >= 150) {
				$this.val(text.substr(0, 150));
			}
			$this.next().find(".quiz_contents_size").text(size);
		});//quiz_contents() end

		//해설 글자 수 제한
		$commentary.keyup(function() {
			$this = $(this);
			let text = $this.val();
			let size = text.length;
			if (size >= 300) {
				$this.val(text.substr(0, 300));
			}
			$this.next().find(".quiz_commentary_size").text(size);
		});//commentary() end

		//******************  글자수제한  *************************************************

		//재현이
		let commentTmp = _.template($("#commentTmp").html());
		let errorCommentTmp = _.template($("#errorCommentTmp").html());

		let $opinionCommentBox = $("#opinionCommentBox");
		let $errorCommentBox = $("#errorCommentBox");
		let quizType = "";
		//let $writeMsg4 = $("#writeMsg4");
		let $msg = $(".msg");
		let $commentPaginate = $("#commentPaginate");
		let $errorPaginate = $("#errorPaginate");

		$oxTypeErrorForm = $("#oxTypeErrorForm");
		$opinionTxt = $("#opinionTxt");
		
		let commentPageNo = 1;
		let errorPageNo = 1;

		$opinionCommentBox.click(function() {
			commentPageNo = 1;
			getCommentList();

			$(".show").removeClass("show");
			$("#commentListWrap").addClass("show");

			$("#opinionTxt").show();

			$("#opinionCommentRegisterForm").css("height", 200);
			$("#errorCommentRegisterFormWrap").css("display", "none");

		}); //opinionCommentBox click() end

		$errorCommentBox.click(function() {
			errorPageNo = 1;
			getErrorCommentList();
			$(".show").removeClass("show");
			$("#errorCommentListWrap").addClass("show");

			$("#opinionTxt").css("display", "none");

			$("#opinionCommentRegisterForm").css("height", 0);
			
			if(${quizInfo.userNo==loginUser.no}) {
				$("#errorCommentRegisterFormWrap").hide();
			} else {
				$("#errorCommentRegisterFormWrap").show();
			}
		}); //errorCommentBox click() end

		//의견댓글목록~
		function getCommentList() {
			$.ajax({
				url : "/ajax/quiz/${no}/comment/page/"+commentPageNo,
				dataType : "json",
				data: {
					userNo : ${loginUser.no}
				},
				type : "get",
				error : function() {
					alert("Error");
				}, // error end
				success : function(json) {
					//console.log("getCommentList");
					$("#commentList").html(commentTmp({"comments" : json.list}));
					$commentPaginate.html(json.paginate);
					//paginate
				} // success end
			}); // ajax() end
		} // getCommentList() end
		getCommentList(); // 의견~한번호출

		//의견댓글의 paginate를 눌렀을 때
	    $commentPaginate.on("click", "a", function (e) {
	    	e.preventDefault();
	    	commentPageNo = this.dataset.no;
	    	getCommentList();
		})//$commentPaginate click end
		
		//오류댓글의 paginate를 눌렀을 때
	    $errorPaginate.on("click", "a", function (e) {
	    	e.preventDefault();
	    	errorPageNo = this.dataset.no;
	    	getErrorCommentList();
		})//$errorPaginate click end
		
		// 의견댓글등록~
		$opinionContent = $("#opinionContent");

		$registerBtn.click(function() {
			contentValue = $opinionContent.val();
			//console.log(contentValue);
			if (contentValue == "") {
				$msg.show().addClass('no').text("의견을 작성해주세요.");
				return false;
			}
			getCommentRegister();
		}); //commentRegisterBtn click() end
		let contentValue = 0;
		// 의견댓글등록~
		function getCommentRegister() {
			$.ajax({
				url : "/ajax/comment",
				dataType : "json",
				data : {
					qiNo :${no},
					content : contentValue,
					userNo : ${loginUser.no}
				},
				type : "post",
				error : function(xhr, error, code) {
					alert("서버 점검중입니다.");
				}, // error end
				success : function(json) {
					if (json) {
						getCommentList();
						$opinionContent.val("");
						$msg.hide().removeClass('no').text("");
					} else {
						alert("안지워짐");
					}
				} // success end
			}); // ajax() end
		} // getCommentList() end

		function getErrorCommentList() {
			//alert("test");
			$.ajax({
				url : "/ajax/quiz/${no}/errorComment/page/"+errorPageNo,
				dataType : "json",
				data : {
					userNo : ${loginUser.no}
				},
				type : "get",
				error : function() {
					alert("Error");
				}, // error end
				success : function(json) {
					console.log(json);
					$("#errorCommentList").html(errorCommentTmp({"errorComments" : json.list}));
					$errorPaginate.html(json.paginate);
				} // success end
			}); // ajax() end
		} // getErrorCommentList() end
		//getErrorCommentList(); // 의견~한번호출

		// 타입이 C인오류 수정(카테고리)
		let $categoryErrorCommentForm = $("#categoryErrorCommentForm");
		
		
		$categoryErrorCommentForm.submit(function() {
			let category = $("#categorySelectWrap .radio:checked").val();
			if (!$("#categorySelectWrap input").is(":checked")) {
				$msg.show().addClass('no').text("카테고리를 선택해주세요.");
				//alert("카테고리 선택하자^^");
				return false;
			}
			//console.log(category);
			$.ajax({
				url : "/ajax/errorComment",
				dataType : "json",
				data : {
					qiNo :${no},
					userNo : ${loginUser.no},
					type : 'C',
					category : category,
					
					question : "",
					explanationQ : "",
					mcAnswer : 0,
					mcChoice : [],
					mcErrorExplanation : "",
					quizType : "",
					oxAnswer : 10,
					oxErrorExplanation : "",
					explanationE : ""
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					alert(json);
					$("#errorCommentList").append(errorCommentTmp({"errorComments" : json}));
					$("#categorySelectWrap input").prop("checked", false);
					getErrorCommentList();
					$(window).scrollTop(843);
				}// success 
			}); //ajax() end
		}); // $cRegistBtn click() end

		// 타입이 Q인오류 수정(문제, 해설)
		let $question = $("#qError");
		let $explain = $("#eError");

		$("#quizContent").submit(function() {
			question = $question.val();
			if (question == "") {
				//alert("문제를 작성해주세요");
				$msg.show().addClass('no').text("문제를 작성해주세요.");
				return false;
			}
			explanationQ = $explain.val();
			if (explanationQ == "") {
				//alert("해설을 작성해주세요");
				$msg.show().addClass('no').text("해설을 작성해주세요.");
				return false;
			}
			//console.log(question);
			//console.log(explanationQ);
			$.ajax({
				url : "/ajax/errorComment",
				dataType : "json",
				data : {
					qiNo :${no},
					userNo : ${loginUser.no },
					type : 'Q',
					question : question,
					explanationQ : explanationQ,
					
					category : "",
					mcAnswer : 0,
					mcChoice : [],
					mcErrorExplanation : "",
					quizType : "",
					oxAnswer : 10,
					oxErrorExplanation : "",
					explanationE : ""
					
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					$("#errorCommentList").append(errorCommentTmp({"errorComments" : json}));
					getErrorCommentList();
					$question.val("");
					$explain.val("");
					$(window).scrollTop(843);
				}// success 
			}); //ajax() end
		}); //qRegistBtn click() end

		//타입이 A인 오류 수정(4지선다형)
		let $multipleChoiceErrorForm = $("#multipleChoiceErrorForm");
		let $mcErrorExplanation = $("#mcErrorExplanation");
		let $mcChoice = $(".mc_choice");

		$multipleChoiceErrorForm.submit(function() {
			let mcAnswer = $(".four_choice .radio:checked").val();
			alert("mcAnswer:"+mcAnswer);
			if (!$(".four_choice input").is(":checked")) {
				$msg.show().addClass('no').text("정답체크를 해주세요.");
				//alert("정답체크는 좀 하자");
				return false;
			}
			let mcChoice = [];

			$mcChoice.each(function() {
				mcChoice.push($(this).val());
			});
			//console.log(mcChoice);

			// 4지선다형 에러 설명
			mcErrorExplanation = $mcErrorExplanation.val();
			//console.log(mcErrorExplanation);

			if (mcErrorExplanation == "") {
				$msg.show().addClass('no').text("해설을 작성해주세요.");
				//alert("해설을 작성해주세오");
				return false;
			}

			$.ajax({
				url : "/ajax/errorComment",
				dataType : "json",
				traditional : true,
				data : {
					qiNo :${no},
					userNo : ${loginUser.no},
					mcAnswer : mcAnswer,
					mcChoice : mcChoice,
					mcErrorExplanation : mcErrorExplanation,
					quizType : quizType,
					type : 'A',
					
					category : "",
					question : "",
					explanationQ : "",
					oxAnswer : 10,
					oxErrorExplanation : "",
					explanationE : ""
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					$("#errorCommentList").append(errorCommentTmp({"errorComments" : json}));
					getErrorCommentList();
					$(".four_choice .radio").prop("checked", false);
					$(".mc_choice").val("");
					$mcErrorExplanation.val('');
					$msg.removeClass('no').text('');
					$(window).scrollTop(843);
				}// success 
			}); //ajax() end
		});

		//타입이 A인 오류 수정(OX)
		let $oxErrorExplanation = $("#oxErrorExplanation");
		$oxTypeErrorForm.submit(function() {
			// OX중 체크된 라디오의 값이 정답
			let oxAnswer = $(".type_wrap .radio:checked").val();
			//console.log(oxAnswer);
			if (!$(".type_wrap input").is(":checked")) {
				$msg.show().addClass('no').text("정답체크를 해주세요.");
				return false;
			}

			// OX 에러 설명
			oxErrorExplanation = $oxErrorExplanation.val();
			//console.log(oxErrorExplanation);
			if (oxErrorExplanation == "") {
				$msg.show().addClass('no').text("해설을 작성해주세요.");
				return false;
			}
			$.ajax({
				url : "/ajax/errorComment",
				dataType : "json",
				data : {
					qiNo :${no},
					userNo : ${loginUser.no},
					oxAnswer : oxAnswer,
					oxErrorExplanation : oxErrorExplanation,
					type : 'A',
					quizType : quizType,
					
					category : "",
					question : "",
					explanationQ : "",
					mcAnswer : 0,
					mcChoice : [],
					mcErrorExplanation : "",
					explanationE : ""
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					$("#errorCommentList").append(errorCommentTmp({"errorComments" : json}));
					getErrorCommentList();
					$(".type_wrap .radio").prop("checked", false);
					$oxErrorExplanation.val('');
					$(window).scrollTop(843);
				}// success 
			}); //ajax() end
		});

		//타입이 E인 오류 수정
		let $explanation = $("#exError");
		let $commentaryErrorForm = $("#commentaryErrorForm");

		$commentaryErrorForm.submit(function() {
			explanationE = $explanation.val();
			//console.log(explanationE);

			if (explanationE == "") {
				//alert("해설을 작성해주세요");
				$msg.show().addClass('no').text("해설을 작성해주세요.");
				return false;
			}
			$.ajax({
				url : "/ajax/errorComment",
				dataType : "json",
				data : {
					qiNo :${no},
					userNo : ${loginUser.no },
					explanationE : explanationE,
					type : 'E',
					
					category : "",
					question : "",
					explanationQ : "",
					mcAnswer : 0,
					mcChoice : [],
					mcErrorExplanation : "",
					quizType : "",
					oxAnswer : 10,
					oxErrorExplanation : "",
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					$("#errorCommentList").append(errorCommentTmp({"errorComments":json}));
					getErrorCommentList();
					$explanation.val("");
					$(window).scrollTop(843);
				}// success 
			}); //ajax() end
		}); // eRegistBtn click() end

		// 다른 탭 이동 후 선택 및 내용 초기화
		$errorType = $("#errorType");
		$errorType.click(function() {
			// 카테고리
			$("#categorySelectWrap input").prop("checked", false);

			// 문제 및 해설
			$question.val("");
			$explain.val("");

			// 사지선다 
			$(".four_choice .radio").prop("checked", false);
			$(".mc_choice").val("");
			$mcErrorExplanation.val('');

			// OX
			$(".type_wrap .radio").prop("checked", false);
			$oxErrorExplanation.val('');

			// 해설
			$explanation.val("");

			// 유효성검사 사라짐
			$msg.removeClass('no').text('');
		}); // commentBoxWrap click() end


		$("#commentList").on("click", ".comment_report", function () {
			$reportPopup.addClass("on");
			contentType = "C";
			reportChoiceInit();
			
		});
		
		$("#errorCommentList").on("click", ".comment_report", function () {
			$reportPopup.addClass("on");
			contentType = "E";
			reportChoiceInit();
		});
		
		$reportReason = $(".report_reason");
		function reportChoiceInit() {
			$reportReason.prop("checked", false);
			$("#report1").prop("checked", true);
		}
		
		// 퀴즈, 의견, 댓글에 대한 좋아요, 싫어요 //
		// 좋아요가 눌려있는지, 안눌려있는지 판단 - 눌려있을때: checked, 안눌려있을때: unchecked
		let clickType = "unchecked"; // default: unchecked
		let contentNo = 0;
		
		$("#verificationBar").on("click", ".comment_like_box_input", function () {
			// 부모와 자식요소를 사용하여 해당 댓글의 손가락을 판단
			if($(this).hasClass("on")) { 	// 클릭한 손가락에 on이 있으면
				// 클릭한 손가락의 부모요소 verify_comment_wrap의 자식요소에서 comment_like_box_input를 찾아 on을 지움
				$(this).parents("#verificationBarWrap").children().find(".comment_like_box_input").removeClass("on");
				clickType = "checked";      // 클릭타입을 checked
				
			} else {						// 클릭한 손가락에 on이 없으면
				$(this).parents("#verificationBarWrap").children().find(".comment_like_box_input").removeClass("on");		
				$(this).addClass("on");		// comment_like_box_input한테 on을 붙임
				clickType = "unchecked";	// 클릭타입을 unchecked
			}
			
			if($(this).hasClass("dislike_label")) { // dislike_label가 있으면 
				type = "D";							// 타입: D(싫어요)
			} else {								// dislike_label가 없으면 
				type = "L";							// 타입: L(좋아요)
			}
			contentType = "Q";
			contentNo = this.dataset.value;
			doLike($(this).parents("#verificationBarWrap"));
		}); // comment_like_box_input click() end
		
		
		
		$("#commentList").on("click", ".comment_like_box_input", function () {
			// 부모와 자식요소를 사용하여 해당 댓글의 손가락을 판단
			
			if($(this).hasClass("on")) { 	// 클릭한 손가락에 on이 있으면
				// 클릭한 손가락의 부모요소 verify_comment_wrap의 자식요소에서 comment_like_box_input를 찾아 on을 지움
				$(this).parents("#verify").children().find(".comment_like_box_input").removeClass("on");
				clickType = "checked";      // 클릭타입을 checked
				
			} else {						// 클릭한 손가락에 on이 없으면
				$(this).parents(".verify_comment_wrap").children().find(".comment_like_box_input").removeClass("on");		
				$(this).addClass("on");		// comment_like_box_input한테 on을 붙임
				clickType = "unchecked";	// 클릭타입을 unchecked
			}
			
			if($(this).hasClass("dislike_label")) { // dislike_label가 있으면 
				type = "D";							// 타입: D(싫어요)
			} else {								// dislike_label가 없으면 
				type = "L";							// 타입: L(좋아요)
			}
			contentType = "C";
			contentNo = this.dataset.value;
			doLike($(this).parents(".verify_comment_wrap"));
		}); // comment_like_box_input click() end
		
		
		$("#errorCommentList").on("click", ".comment_like_box_input", function () {
			// 부모와 자식요소를 사용하여 해당 댓글의 손가락을 판단
			if($(this).hasClass("on")) { 	// 클릭한 손가락에 on이 있으면
				// 클릭한 손가락의 부모요소 verify_comment_wrap의 자식요소에서 comment_like_box_input를 찾아 on을 지움
				$(this).parents(".verify_comment_wrap").children().find(".comment_like_box_input").removeClass("on");
				clickType = "checked";      // 클릭타입을 checked
				
			} else {						// 클릭한 손가락에 on이 없으면
				$(this).parents(".verify_comment_wrap").children().find(".comment_like_box_input").removeClass("on");		
				$(this).addClass("on");		// comment_like_box_input한테 on을 붙임
				clickType = "unchecked";	// 클릭타입을 unchecked
			}
			
			if($(this).hasClass("dislike_label")) { // dislike_label가 있으면 
				type = "D";							// 타입: D(싫어요)
			} else {								// dislike_label가 없으면 
				type = "L";							// 타입: L(좋아요)
			}
			contentType = "E";
			contentNo = this.dataset.value;
			doLike($(this).parents(".verify_comment_wrap"));
		}); // comment_like_box_input click() end
		
		// 좋아요 눌렀을때 처리하는 함수
		function doLike($currentComment) {
			console.log(contentType);
			console.log(contentNo);
			console.log(type); //타입이 정의가 되지 않음
			$.ajax({
				url : "/ajax/like",
				dataType : "json",
				data : {
					userNo : ${loginUser.no},
					type: type, // 좋아요가 눌릴 경우 무조건 D or L이기 때문에
					contentType : contentType,
					contentNo : contentNo,
					clickType : clickType
				},
				type : "post",
				error : function() {
					alert("서버 점검 중~");
				}, // error
				success : function(json) {
					console.log(json);
					if(contentType=="C") {
						//console.log(json);
						$currentComment.children().find(".comment_like_box_input.dislike_label").html('<i class="far fa-thumbs-down"></i> '+json.dislikeCount);
						$currentComment.children().find(".comment_like_box_input.like_label").html('<i class="far fa-thumbs-up"></i> '+json.likeCount);
					} else if(contentType=="E"){
						// 오류
						$currentComment.children().find(".comment_like_box_input.dislike_label").html('<i class="far fa-thumbs-down"></i> '+json.dislikeCount);
						$currentComment.children().find(".comment_like_box_input.like_label").html('<i class="far fa-thumbs-up"></i> '+json.likeCount);
					} else if(contentType=="Q"){
						$currentComment.children().find(".comment_like_box_input.dislike_label").html('<i class="far fa-thumbs-down"></i> '+json.dislikeCount);
						$currentComment.children().find(".comment_like_box_input.like_label").html('<i class="far fa-thumbs-up"></i> '+json.likeCount);
						
						$positiveCountSpoonBar.attr("data-value",json.likeCount);
						$negativeCountSpoonBar.attr("data-value",json.dislikeCount);
						
						countLike();
					}//if~else end - 의견, 오류, 문제에 따른 손가락들
					if (clickType=="unchecked") { 
						clickType="checked";
					} else {
						clickType="unchecked";
					} //if~else end - 클릭 타입 바꿔주기
				}// success 
			}); //ajax() end
		}//doLike() end
		
		
	</script>
</body>
</html>