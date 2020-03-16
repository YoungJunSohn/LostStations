<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Q&A list</title>
	<c:import url="/WEB-INF/template/link.jsp"/>

    <style>

        body {
            font-family: 'Noto Sans KR', sans-serif;
            user-select: none;
            font-size:15px;
            overflow-y: scroll;
            overflow-x: hidden;

        }
        #header {
            position: fixed;
            width: 100%;
            height: 100px;
            top:0;
            background-color: #37474f;
            border-bottom: 1px solid #9e9e9e;
            z-index: 99;
        }
        .aux {
            width: 1100px;
            height: 100px;
            /*background-color: red;*/
            margin: auto;
            position: relative;
            z-index: 1;
        }
        #logo {
            background-image: url("/img/logo_white.jpg");
            background-size: cover;
            width: 340px;
            height: 100px;
            text-indent: -9999px;
            overflow: hidden;
            float: left;
        }

        #gnb {
            font-family: 'Noto Serif KR', serif;
            width: 360px;
            height: 100px;
            /*background-color: blue;*/
            float: left;
            margin-top: 10px;
        }

        #gnb>ul>li.on {
            text-shadow: 0px 0px 5px #ffffff;
        }

        #gnb>ul>li {
            color: #fff;
            font-size: 24px;
            float: left;
            list-style: none;
            height: 100px;
            width: 120px;
            text-align: center;
            line-height: 110px;
            cursor: pointer;
        }
        #gnb>ul>li>a {
            display: block;
            width: 120px;
            height: 100px;
            text-decoration: none;
            color: #fff;
        }

        #gnbBorderEffect {
            width: 50px;
            height:3px;
            background: #FF1744;
            z-index: 3;
            position: relative;
            left: 120px;
            top: 87px;
            display: none;
            transition: .2s ease;
        }
        #sub {
            width: 100%;
            height: 0px;
            position: absolute;
            top: 100px;
            left:0px;

            overflow: hidden;
            transition: .2s ease;
        }
        .on  #sub{
            height:120px;
        }

        #sub ul {
            width: 120px;
            height: 120px;
            /*background-color: #B39DDB;*/
            position: absolute;
            text-align: center;
            margin-top: 6px;
        }
        #sub li {
            height: 33px;
            line-height: 33px;
        }
        #rankingMenu {
            left: 460px;
        }
        #sub li a {
            color: #9e9e9e;
            text-decoration: none;
        }
        #sub li a:hover {
            color: #fff;
            text-decoration: underline;
            cursor: pointer;

        }
        #subHoverLine {
            width:100%;
            height:0px;
            background-color: #37474f;
            transition: .2s ease;
            position: absolute;
            top:101px;
        }
        .on #subHoverLine {
            height:120px;
        }

        #gameInfoMenu {
            left: 580px;
        }


        #profileBox {
            width: 150px;
            height: 100px;
            /*background-color: palevioletred;*/
            float: left;
        }
        #profileImage {
            width: 60px;
            height: 60px;
            /*background-color: palevioletred;*/
            float: right;
            margin-top: 30px;
        }
        #profileImage img {
            border-radius: 50px;
        }


        #alarm {
            width: 30px;
            height: 40px;
            /*background-color: green;*/
            float: right;
            font-size: 15px;
            text-align: center;
            line-height: 50px;
            color: white;
            margin-top: 60px;
            cursor: pointer;
            position: relative;
        }
        #gameStartBtn {
            width: 240px;
            height: 80px;
            margin-top: 18px;
            float: right;
            cursor:pointer;
            color: #f68500;
            line-height: 80px;
            font-size: 35px;
            font-weight: bold;
            font-family: 'Sedgwick Ave', cursive;
        }
        #gameStartBtn>a {
            display: block;
            width: 240px;
            height: 80px;
            text-decoration: none;
            color: #f68500;
        }
        #header::after {
            content: "";
            display: block;
            clear: both;
        }

        /*새소식 창 작업 - 최수정*/
        #news {
            width: 400px;
            height: 600px;
            top: 50px;
            left: -260px;
            position: absolute;
            /*background-color: cornflowerblue;*/
            border: 1px solid #424242;
            display: none;
            background-color: #ffffff;
            color:#37474f;
        }

        .show #news {
            display: block;
        }
        #news::before {
            content: "";
            top: -15px;
            right: 110px;
            height: 0;
            width: 0;
            border-color: transparent transparent #424242;
            border-style: solid;
            border-width: 0 15px 15px;
            position: absolute;
        }
        #news::after {
            content: "";
            top: -14px;
            right: 110px;
            height: 0;
            width: 0;
            border-color: transparent transparent #ffffff;
            border-style: solid;
            border-width: 0 15px 15px;
            position: absolute;
        }
        #newsHeader {
            height: 50px;
            line-height: 50px;
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 18px;
            left: 1px;
            padding-left: 20px;
            border-bottom: 1px solid #424242;
            text-indent: -300px;
        }
        #newsList {
            height: 549px;
            overflow: auto;
            background-color: #fff;
        }
        #newsList li {
            height: 70px;
            border-bottom: 1px solid #9c9c9c;
            line-height: 70px;
            text-indent: -150px;
        }
        #newsListTime {
            font-size: 14px;
            height: 30px;
            line-height: 30px;
            /*background-color: cornflowerblue;*/
            margin-top: 40px;
            text-indent: 320px;
        }

        #footer {
            width: 100%;
            height: 200px;
            /*position: absolute;*/
            background-color: #37474f;
            color: #fff;
            text-align: center;
            line-height: 200px;
            bottom: 0;
        }

        .btn {
            user-select: none;
            border: none;
            outline: none;
            border-radius: 5px;
            color: #fff;
            background-color: #37474f;
            cursor: pointer;
            top: 200px;
        }
        .btn:hover {
            background-color: #f68500;
            font-weight: bold;
            box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
        }
        .msg {
            color: #F44336;
            font-size: 14px;
        }
        #content{
        	position:relative;
        	padding-top:130px;
            min-height:500px;
        }
        #logoutBtn {
            border: none;
            padding:0;
            background-color: transparent;
            cursor: pointer;
            display: block;
            position: absolute;
            width: 100px;
            height: 20px;
            font-size: 20px;
            text-align: center;
            line-height: 20px;
            color: #fff;
            left: 965px;
        }




        #option{
            position: relative;
            top: 20px;
            margin-left: 150px;
            font: 18px "Kakao","Noto Sans KR","나눔고딕",NanumGothic,"맑은고딕","Malgun Gothic","돋움",Dotum,"Helvetica Neue",Helvetica,AppleSDGothicNeo,sans-serif,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Segoe UI Symbol","Android Emoji",EmojiSymbols;
            padding: 5px 10px;
            height: 38px;
            z-index: 1;
        }
        #search {
            position: relative;
            height: 32px;
            top: 18px;
            font: 18px "Kakao","Noto Sans KR","나눔고딕",NanumGothic,"맑은고딕","Malgun Gothic","돋움",Dotum,"Helvetica Neue",Helvetica,AppleSDGothicNeo,sans-serif,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Segoe UI Symbol","Android Emoji",EmojiSymbols;
			z-index: 1;

        }
        
        #searchBtn{
        	position: relative;;
        	height: 38px;
        	top: 20px;
            font: 18px "Kakao","Noto Sans KR","나눔고딕",NanumGothic,"맑은고딕","Malgun Gothic","돋움",Dotum,"Helvetica Neue",Helvetica,AppleSDGothicNeo,sans-serif,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Segoe UI Symbol","Android Emoji",EmojiSymbols;
        	z-index: 1;
        	border-radius: 50000px;
        	border: none;
        	background-color: white;
        	font-size: 30px;
        	cursor: pointer;
        	
        }

        #articleList {
            width: 1080px;
            margin: 10px auto;
            min-height: 500px;
            position: relative;
            top: -190px;
        }

        .article {
            border-bottom: 1px solid #e6e7e7;
            margin: 10px 0;
            position: relative;
            top: 200px;
            left: 40px;
            width: 1000px;

        }

        .article a {
            display: block;
            height: 140px;
            position: relative;
        }

        .article strong {
            position: absolute;
            display: block;
            left: 30px;
            bottom: 10px;
        }

        .article a:hover {
            background: #e6e7e7;
        }

        .writer {
            border-radius: 1000px;
        }

        .quiz_list_tier{

            position: absolute;
            left: 35px;
            top: 80px;
        }

        .no_article {
            text-align: center;
            font-size: 28px;
            height: 200px;
            line-height: 200px;
        }
        .article .title {
            position: absolute;
            left: 140px;
            top: 0;
            line-height: 140px;
            font-size: 24px;
            color: #676767;
            width: 820px;
            white-space: nowrap;
            word-break: break-all;
            text-overflow: ellipsis;
            overflow: hidden;
            text-indent: 30px;
        }

        .article a:hover .title {
            color: #14bab6;
            font-size: 28px;
            font-weight: bold;
        }

        .article time {
            position: absolute;
            bottom: 20px;
            right: 20px;
            font-size: 20px;
        }

        .article .view {
            position: absolute;
            color: #9E9E9E;
            bottom: 22px;
            left: 170px;
        }

        strong.comment {
            position: absolute;
            top: 50px;
            text-indent: 420px;
            font-size: 35px;
            color: #14bab6;
           
        }

        .article .title span {
            vertical-align: middle;
        }

        .box_btn {
            width: 1100px;
            position: relative;
			top: -50px
        }

        .box_btn a{
			position:absolute;
            font-size: 20px;
            right: 60px;
            top: 0px;
            height: 35px;
            width: 95px;
            text-align: center;
            line-height: 35px;
        }
        #list{
            position: relative;          
            width: 1100px;
            margin: auto;
        }
        #searchKeyword{
        margin: auto;
        margin-left: 50%;
        }
        
        #list h2{
            font-size: 30px;
            font-weight: bold;
        }

        #footer {
            width: 100%;
            height: 200px;
            /*position: fixed; */
            background-color: #37474f;
            color: #fff;
            text-align: center;
            line-height: 200px;
            bottom: 0;
        }
        #policy {
            width:800px;
            height:200px;
            display: inline-block;
        }
        #footer address {
            width:190px;
            height:200px;
            display: inline-block;
            color:#f68500;
        }

        #footer a {
            color:#fff;
            text-decoration:none;
        }
        #footer a:hover {
            color:#f68500;
            text-decoration: underline;
        }
        a.btn {
            text-decoration: none;
        }
        #footer address a {
            font-weight: 400;
        }

        #policy ul {
            text-align: center;
        }

        #policy li {
            display: inline;
            border-left:1px solid #ddd;
            margin-right:9px;
            padding-left: 8px;
        }

        #policy li:first-child {
            border:none;
        }

        #policy strong {
            font-weight:400;
        }
        
        .article strong{
        	color:#424242;
        }

	
		/*
페이징 CSS
*/
.paginate {
	font-size:22px;
	text-align:center;
	height:50px;
	line-height:50px;
	font-weight:500;
	margin: 60px;
	position: relative;
	top: -70px;
}

.paginate>a {
	text-decoration: none;
	color: #37474f;
	margin-left: 40px;
	padding: 2px 10px;
}

.paginate>a:hover {
	color: #f68500;
}

.paginate>strong {
	text-decoration: none;
	background-color: #37474f;
	color: #fff;
	margin-left: 40px;
	padding: 2px 10px;
	border-radius: 50px;
}

.paginate>span>i {
	color: #bdbdbd;
	margin-left: 40px;
	padding: 2px 10px;
}

/*
비활성화
*/
.paginate span.next,
.paginate span.prev {
	border-color:#E1E1E1;
	color:#E1E1E1;
	cursor:default;
	cursor:not-allowed;
}



	

    </style>

</head>
<body>

<c:import url="/WEB-INF/template/header.jsp"/>
        <div id="list">
        <div id="searchKeyword">
        <h2><i class="far fa-list-alt"></i> Q & A </h2>
           <!--  <form action="/inquiryList/size/" method="get">--> 
                <select name ="selectOption"  id="option">
                
                    <option class="option" value="total"  >전체</option>
                    <option class="option" value="title" > 제목 </option>
                    <option class="option" value="nickname" >작성자</option>
                
                </select>
                <input id="search" name="searchKeyWord">
                <button id="searchBtn" type="submit"><i class="fas fa-search"></i></button>
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
    
    	<c:forEach items="${inquiryList}"  var="inquiry">
        <li class="article">
            <a href="/inquiry/${inquiry.no}">
                <div class="card_user">
                    <img class="writer" src="/img/${inquiry.profileImage}" width="100" />
                    <img class="quiz_list_tier" src="/img/TierGrandMaster.png" width="30" height="30"/>
                    <strong>${inquiry.nickname}</strong>
                </div>
                <h3 class="title">${inquiry.title}</h3>
                <!-- 작성일-->
                <strong class="comment"><c:if test="${inquiry.cnt > 0}"><i class="far fa-check-circle"></i></c:if> </strong>
                <span class="view"><i class="fa fa-eye"></i> ${inquiry.views}</span>

            </a>
        </li>
        
        </c:forEach>
    </ul>

    <div class="box_btn">
        <a href="/inquiry/write" class="btn"><i class="fas fa-pen-nib"></i> 글쓰기</a>
    </div>
    <div class="paginate">
		${paginate}
	</div>
	</c:otherwise>
	</c:choose>
	</div> <!-- list -->

<c:import url="/WEB-INF/template/footer.jsp"/>
<script src="/js/jquery.js"></script>
<script src="/js/template.js"></script>
<script>


$("#searchBtn").on("click", function(){
	
	//alert($("#option").val());
	//alert($("#search").val());
	let option = $("#option").val();
	let searchKeyWord = $("#search").val();
	//$("#searchKeyword").text(searchKeyWord);
	if(searchKeyWord!=""){
	location.href = "/inquiry/option/"+option+"/keyWord/"+searchKeyWord+"/page/${page}";
	
	}else{
		
	location.href = "/inquiry/page/1";
	}
})


</script>

</body>
</html>