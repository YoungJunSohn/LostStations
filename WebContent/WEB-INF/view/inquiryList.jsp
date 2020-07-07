<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Q&A list</title>
<c:import url="/WEB-INF/template/link.jsp" />
<link rel="stylesheet" href="/css/default.css">
<link rel="stylesheet" href="/css/inquiryList.css">

</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp" />
	<div id="list">
		<div id="searchKeyword">
			<h2>
				<i class="far fa-list-alt"></i> Q & A
			</h2>
			<!--  <form action="/inquiryList/size/" method="get">-->
			<select name="selectOption" id="option">

				<option class="option" value="total">전체</option>
				<option class="option" value="title">제목</option>
				<option class="option" value="nickname">작성자</option>

			</select> <input id="search" name="searchKeyWord">
			<button id="searchBtn" type="submit">
				<i class="fas fa-search"></i>
			</button>
			<!--  </form> -->
		</div>

		<c:choose>
			<c:when test="${inquiryList.isEmpty() }">
				<p class="no_article">
					<i class="fas fa-skull-crossbones"></i> 일치하는 게시글이 없습니다.
				</p>
			</c:when>
			<c:otherwise>
				<ul id="articleList">
					<!--for each-->

					<c:forEach items="${inquiryList}" var="inquiry">
						<li class="article"><a href="/inquiry/${inquiry.no}">
								<div class="card_user">
									<img class="writer" src="/img/${inquiry.profileImage}"
										width="100" /> <img class="quiz_list_tier"
										src="/img/TierGrandMaster.png" width="30" height="30" /> <strong>${inquiry.nickname}</strong>
								</div>
								<h3 class="title">${inquiry.title}</h3> <!-- 작성일--> <strong
								class="comment"><c:if test="${inquiry.cnt > 0}">
										<i class="far fa-check-circle"></i>
									</c:if> </strong> <span class="view"><i class="fa fa-eye"></i>
									${inquiry.views}</span>

						</a></li>

					</c:forEach>
				</ul>

				<div class="box_btn">
					<a href="/inquiry/write" class="btn"><i class="fas fa-pen-nib"></i>
						글쓰기</a>
				</div>
				<div class="paginate">${paginate}</div>
			</c:otherwise>
		</c:choose>
	</div>
	<!-- list -->

	<c:import url="/WEB-INF/template/footer.jsp" />
	<script src="/js/jquery.js"></script>
	<script>
		$("#searchBtn")
				.on(
						"click",
						function() {

							//alert($("#option").val());
							//alert($("#search").val());
							let option = $("#option").val();
							let searchKeyWord = $("#search").val();
							//$("#searchKeyword").text(searchKeyWord);
							if (searchKeyWord != "") {
								location.href = "/inquiry/option/" + option
										+ "/keyWord/" + searchKeyWord
										+ "/page/${page}";

							} else {

								location.href = "/inquiry/page/1";
							}
						})
	</script>

</body>
</html>