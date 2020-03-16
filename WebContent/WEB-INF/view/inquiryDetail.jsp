<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:if test="${inquiry==null}">
	<c:redirect url="/inquiry/page/1"/>
</c:if>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Q & A</title>
	<c:import url="/WEB-INF/template/link.jsp"/>
	<link rel="stylesheet" href="/css/inquiryDetail.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
	<h2 class="screen_out">게시물 보기</h2>
	<div class="total_wrap">
		<h3 class="screen_out">Q & A 제목</h3>
		<div class="question_titleWrap">
			<div class="profile_box">
				<div class="profile_image">
					<img src="/profileImage/${inquiry.profileImage}" alt="프로필이미지">
				</div>
				<div class="tier">
					<img alt="실버" src="/img/TierSilver.png">
				</div>
				<strong class="nickname">${inquiry.nickname}</strong>
			</div>
			<div class="title_box">
				<div>${inquiry.title}</div>
			</div>
			<time class="regdate_box">
				<fmt:formatDate pattern="YYYY년 MM월 dd일 hh시 mm분" value="${inquiry.regdate}"/>
			</time>
		</div><!-- //question_titleWrap -->
		
		<h3 class="screen_out">Q & A 내용</h3>
		<div class="question_contentWrap">
			<div class="content_box">
				<div>${inquiry.content}</div>
			</div>
			<c:choose>
				<c:when test="${loginUser.no!=9999}">
					<div class="user_btn_box">
						<a href="/inquiry/${inquiry.no}/modify" class="btn">수정</a>
						<button form="deleteForm" class="btn">삭제</button>
						<a href="/inquiry/page/1" class="btn">목록으로</a>
						<form id="deleteForm" action="/inquiry" method="post">
							<input type="hidden" name="_method" value="delete">
							<input type="hidden" name="no" value="${inquiry.no}">
						</form>
					</div><!-- //user_btn_box -->	
				</c:when>
				<c:otherwise>
					<div class="amin_btn_box">
						<button form="deleteForm">삭제</button>
						<a href="/inquiry/page/1"><button>목록으로</button></a>
						<form id="deleteForm" action="/inquiry" method="post">
							<input type="hidden" name="_method" value="delete">
							<input type="hidden" name="no" value="${inquiry.no}">
						</form>
					</div><!-- //amin_btn_box -->
				</c:otherwise>
			</c:choose>
		</div><!-- //question_contentWrap -->
		
		<h3 class="screen_out">Q & A 댓글</h3>
		<div class="question_replyWrap">
		<c:if test="${loginUser.no==9999}">
			<div class="reply_box">
				<form action="/answer" method="post">
					<input type="hidden" name="iNo" value="${inquiry.no}">
					<div>
						<textarea class="reply_register" name="content" placeholder="댓글쓰세요~"></textarea>
						<button class="reply_registerBtn"><i class="fas fa-pencil-alt"></i> 답글 쓰기</button>
					</div>
				</form>
			</div><!-- //reply_box -->
		</c:if>	
			<div id="replies" class="replies">
				<!-- //repliesTmp -->
			</div><!-- //replies -->
		</div><!-- //question_replyWrap -->
	</div><!-- //total_wrap -->
	
<script type="text/template" id="repliesTmp">
<@if(reply==null) {@>
<%--
<div class="no_reply">댓글이 아직 없습니다.</div>
--%>
<@} else {@>
<ul>
	<li>
		<div id="replyProfileBox" class="reply_profile_box">
			<img class="reply_profile_image" src="/profileImage/<@=reply.profileImage@>" alt="프로필이미지">
			<!-- <img class="reply_tier" src="/img/TierSilver.png" alt="티어"> -->
			<strong class="reply_nickname"><@=reply.nickname@></strong>
			<div class="reply_regdate"><@=moment(reply.regdate).format('YYYY년 MM월 DD일') @></div>
			<div class="reply_content"><@=reply.content@></div>
		</div><!-- //reply_profile_box -->
	</li>
</ul>	
<@}@>
</script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/jquery.js"></script>
<script>
	//한국 시간으로 변경
	moment.locale("ko");
	
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

	const repliesTmp = _.template($("#repliesTmp").html());
	
	let inquiryNo = ${inquiry.no};
	let $replies = $("#replies");
	
	function getReplies() {
		$.ajax({
			url: "/ajax/inquiry/"+inquiryNo+"/reply",
			dataType: "json",
			type: "GET",
			error: function () {
				alert("에러");
			},
			success: function (json) {
				//console.log(json);
				$replies.html(repliesTmp({"reply": json.reply}));
			}
		});//ajax() end
	}
	
	//함수한번 호출
	getReplies();
</script>
<c:import url="/WEB-INF/template/footer.jsp"/>
</body>
</html>