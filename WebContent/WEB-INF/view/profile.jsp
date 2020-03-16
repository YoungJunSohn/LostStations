<%@page import="com.spoon.loststations.dao.EMsDAOImpl"%>
<%@page import="com.spoon.loststations.vo.CommentData"%>
<%@page import="com.spoon.loststations.dao.QuizInfosDAOImpl"%>
<%@page import="com.spoon.loststations.vo.QuizData"%>
<%@page import="com.spoon.loststations.dao.GameUsersDAOImpl"%>
<%@page import="com.spoon.loststations.dao.PlayLogsDAOImpl"%>
<%@page import="com.spoon.loststations.vo.PlayData"%>
<%@page import="java.util.List"%>
<%@page import="com.spoon.loststations.dao.UsersDAOImpl"%>
<%@page import="com.spoon.loststations.vo.User"%>
<%@page import="com.spoon.loststations.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="stylesheet" href="/css/pofile.css" />
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"></c:import>

    <div class="profile_wrap">
        <div class="user_info" data-no="${loginUser.no }">
            <div id="profileImageSettingBtn"
            <%-- 로그인유저와 현재 페이지의 유저가 다를때 프로필 수정버튼 display:none --%>
            <c:if test="${loginUser.no!=user.no }">
            style="display:none"
            </c:if>><i class="fas fa-cog"></i></div>
            <div id="imageChoiceBox">
                <div id="imageChoice" class="image_btn">
                    <input type="file" id="imageChoiceFile"/>
                    <label for="imageChoiceFile">사진선택</label>
                </div>
                <div id="imageDelete" class="image_btn">사진 삭제</div>
            </div>

            <img id="userProfileImage" src="/profileImage/${user.profileImage }" width="100" height="100"/>
            <div id="userNickname">${user.nickname}</div>
        </div>

        <div id="UserRankingWrap">
            <div id="playRanking" class="show">
                <div class="box">플레이</div>
                <div id="playTier" class="show_tier"></div>
                <div>${playRank }위</div>
            </div>
            <div id="writeRanking" class="show">
                <div class="box">출제</div>
                <div id="writeTier" class="show_tier"></div>
                <div>${registerRank }위</div>
            </div>
            <div id="verifyRanking" class="show">
                <div class="box">검증</div>
                <div id="verificationTier" class="show_tier"></div>
                <div id="userRank">${verifyRank }위</div>
            </div>
        </div>
    </div>
    <ul class="profile_tab">
        <li id="logTab" class="on">
            <a href="" title="전적 입니다.">전적</a>
        </li>
        <li id="verificationQuizTab">
            <a href="" title="검증중인 문제입니다">검증중인 문제</a>
        </li>
        <li id="adoptQuizTab"
         <c:if test="${loginUser.no!=user.no }">
            style="display:none"
         </c:if>>
            <a href="" title="채택된 문제입니다.">채택된 문제</a>
        </li>
    </ul>
    <div>
        <div id="recordTab" class="tab on">
            <h3 class="screen_out">유저 플레이 전적</h3>
                <div id="recordInfoBox1">
                	<div id="correctRate" class="record_info">정답률
    					<div>
						<c:choose>
							<c:when test="${totalQuiz!=0 }">${correctRate}</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>%
    					</div><%-- 정답률 --%>
    				</div>
                    

                </div><!-- //recordInfoBox1 -->
                <div id="recordInfoBox2">
                    <div class="record_info">승률
                    	<div>
						<c:choose>
							<c:when test="${totalGameCnt!=0 }">${winRate}</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>%
    					</div><%-- 승률 --%>
					</div><!-- //record_info -->
					<div class="record_info">평균등수
						<div><em>
						<c:choose>
							<c:when test="${totalGameCnt!=0 }">${avgPlayRank}</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>
					</em>등</div>
					</div><!-- //record_info -->
					<div class="record_info">1등횟수
						<div>${rank1Cnt}회</div>
					</div><!-- //record_info -->
					<div class="record_info">평균생존시간
						<div>
						<c:choose>
							<c:when test="${totalGameCnt!=0 }">${surviveMinute}</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>분
						<c:choose>
							<c:when test="${totalGameCnt!=0 }">${surviveSecond}</c:when>
							<c:otherwise>0</c:otherwise>
						</c:choose>초
					</div><!-- //record_info -->
                </div><!-- //recordInfoBox2 -->
                	</div>
            <h3 class="screen_out">유저 플레이 카테고리 차트</h3>
            <div>
                <div id="categoryChart">
                    <canvas id="bar" height="100"></canvas>
                </div>
            </div>
            <h3 class="screen_out">유저 출제 전적</h3>
<ul id="adoptInfoBox">
    <li class="adopt_info">채택된 문제 수
		<div class="adopt_detail">${adoptedQuizCnt}개</div>
	</li>
    <li class="adopt_info">채택률
        <div class="adopt_detail">
        <c:choose>
        	<c:when test="${quizData3.getAdoptTotal()!=0}"> ${adoptRate}</c:when>
        	<c:otherwise>0</c:otherwise>
        </c:choose>%
        </div>
    </li>
    <li class="adopt_info">정답률
        <div class="adopt_detail">
        <c:choose>
        	<c:when test="${quizData4.getCrCheckTotal()!=0}"> ${crCheckRate}</c:when>
        	<c:otherwise>0</c:otherwise>
        </c:choose>%
        </div>
    </li>
    <li class="adopt_info">드랍률
        <div class="adopt_detail">
        <c:choose>
        	<c:when test="${quizData4.getTotal()!=0}"> ${dropRate}</c:when>
        	<c:otherwise>0</c:otherwise>
        </c:choose>%
      	</div>
    </li>
</ul>
            <h3 class="screen_out">유저 검증 전적</h3>
            <div id="verificationInfoBox">
                <!-- verificationInfoBoxTmp -->
                <ul>
			        <li class="verification_info">오류 채택수<div class="verification_info_detail">${commentData.getErrorAdoptNum()}개</div></li>
			        <li class="verification_info">검증문제<br>채택 수<div class="verification_info_detail">${commentData.getAdoptNum()}개</div></li>
			        <li class="verification_info">검증한 문제수<div class="verification_info_detail">${commentData.getTotalComment()}개</div></li>
    			</ul>
            </div>
        </div><!--//recordTab-->
        <div id="verifyingQuiz" class="tab">
            <div id="sortFilterWrap">
                <input checked type="radio" class="radio" id="sortFilter1" name="sort" value="1">
                <label class="lbl sort_btn" for="sortFilter1">최신</label>
                <input type="radio" class="radio" id="sortFilter2" name="sort" value="2">
                <label class="lbl sort_btn" for="sortFilter2">채택 임박</label>
                <input type="radio" class="radio" id="sortFilter3" name="sort" value="3">
                <label class="lbl sort_btn" for="sortFilter3">HOT</label>
            </div><!--//sortFilterWrap-->
            <div id="quizListWrap">
            <ul id="quizList">
            <!-- verifiUserQuizListTmp -->
            </ul>
            </div>
                <div id="verifiPaginate" class="paginate">
                    <!-- paginate 생성 -->
                </div><!--//paginate-->
        </div><!--//verifyingQuiz-->
        <div id="adoptQuiz" class="tab">
            <ul id="adoptQuizList">
            <!-- 채택된 문제리스트 template -->
                
            </ul>
            <div id="adoptQuizDetailView">
            <!-- 채택된 문제 클릭 디테일 -->
            
                
            </div><!--//adoptQuizDetailView-->
            <div id="adoptPaginate" class="paginate">
                <!-- paginate 생성 -->
            </div><!--//paginate-->
        </div><!--//adoptQuiz-->
    </div>
    <div id="adoptQuizDetailViewBG"></div>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script type="text/template" id="adoptQuizListTmp">
<@ _.each(quizList, function(quiz) { @>
    <li data-no="<@=quiz.no@>" data-value="<@=quiz.type@>">
		<@if(quiz.category == 1){ @>
			<div class="category"><i class="fas fa-user-graduate">일반상식</i></div>
		<@}else if(quiz.category == 2){ @>
			<div class="category"><i class="fas fa-flask">과학</i></div>
		<@}else if(quiz.category == 3){ @>
			<div class="category"><i class="fas fa-dollar-sign">경제</i></div>
		<@}else if(quiz.category == 4){ @>
			<div class="category"><i class="fas fa-balance-scale">법률</i></div>
		<@}else if(quiz.category == 5){ @>
			<div class="category"><i class="fas fa-music">예술</i></div>
		<@}else if(quiz.category == 6){ @>
			<div class="category"><i class="fas fa-basketball-ball">스포츠</i></div>
		<@}else if(quiz.category == 7){ @>
			<div class="category"><i class="fas fa-landmark">역사</i></div>
		<@}else if(quiz.category == 8){ @>
			<div class="category"><i class="fas fa-book">인문</i></div>
		<@}else if(quiz.category == 9){ @>
			<div class="category"><i class="fas fa-globe-asia">지리</i></div>
		<@}else if(quiz.category == 10){ @>
			<div class="category"><i class="fas fa-tv">TV/영화/만화</i></div>
		<@}else if(quiz.category == 11){ @>
			<div class="category"><i class="fas fa-gamepad">게임</i></div>
		<@}else if(quiz.category == 12){ @>
			<div class="category"><i class="fab fa-android">IT</i></div>
		<@}else if(quiz.category == 13){ @>
			<div class="category"><i class="fas fa-user">인물</i></div>
		<@}else if(quiz.category == 14){ @>
			<div class="category"><i class="fas fa-dog">생물</i></div>
		<@}else if(quiz.category == 15){ @>
			<div class="category"><i class="fas fa-syringe">의학</i></div>
		<@} @>
        <div class="adopt_quiz"><@=quiz.content@></div>
        <div class="reg_date"><@=moment(quiz.regdate).format("YYYY-MM-DD")@></div>
        <div class="quiz_type"><@if(quiz.type=="OX"){@>OX<@}else {@>MC<@}@></div>
    </li>
<@})@>
</script>
<script type="text/template" id="adoptQuizListDetailTmp">
    <div id="adoptQuizHeader">
        <@=quiz.category@>
    <div id="cancelBtn"><i class="far fa-window-close"></i></div>
    </div><!--//adoptQuizHeader-->
    <div id="adoptQuizContent">
        <p><@=quiz.content@></p>
    </div><!--//adoptQuizContent-->
    <div id="adoptQuizAnswerChoice">
        <ul class="adopt_answer_choice <@=quiz.type@>">
			<@ if(quiz.type=="MC") {@>
            	<@ _.each(quiz.choices, function(choice) { @>
            		<li><@=choice.content@></li>
            	<@})@>
			<@}else{@>
				<li>O</li>
				<li>X</li>
			<@}@>
        </ul>
    </div><!--//adoptQuizAnswerChoice-->
</script>
<script type="text/template" id="verifiUserQuizListTmp">
<@ _.each(quizList, function(quiz) { @>
<li>
	<a class="quiz_wrap" href="/quiz/<@=quiz.no@>">
		<@if(quiz.category == 1){ @>
			<div class="category"><i class="fas fa-user-graduate">일반상식</i></div>
		<@}else if(quiz.category == 2){ @>
			<div class="category"><i class="fas fa-flask">과학</i></div>
		<@}else if(quiz.category == 3){ @>
			<div class="category"><i class="fas fa-dollar-sign">경제</i></div>
		<@}else if(quiz.category == 4){ @>
			<div class="category"><i class="fas fa-balance-scale">법률</i></div>
		<@}else if(quiz.category == 5){ @>
			<div class="category"><i class="fas fa-music">예술</i></div>
		<@}else if(quiz.category == 6){ @>
			<div class="category"><i class="fas fa-basketball-ball">스포츠</i></div>
		<@}else if(quiz.category == 7){ @>
			<div class="category"><i class="fas fa-landmark">역사</i></div>
		<@}else if(quiz.category == 8){ @>
			<div class="category"><i class="fas fa-book">인문</i></div>
		<@}else if(quiz.category == 9){ @>
			<div class="category"><i class="fas fa-globe-asia">지리</i></div>
		<@}else if(quiz.category == 10){ @>
			<div class="category"><i class="fas fa-tv">TV/영화/만화</i></div>
		<@}else if(quiz.category == 11){ @>
			<div class="category"><i class="fas fa-gamepad">게임</i></div>
		<@}else if(quiz.category == 12){ @>
			<div class="category"><i class="fab fa-android">IT</i></div>
		<@}else if(quiz.category == 13){ @>
			<div class="category"><i class="fas fa-user">인물</i></div>
		<@}else if(quiz.category == 14){ @>
			<div class="category"><i class="fas fa-dog">생물</i></div>
		<@}else if(quiz.category == 15){ @>
			<div class="category"><i class="fas fa-syringe">의학</i></div>
		<@} @>
		<div class="quiz"><@=quiz.content@></div>
		<div class="reg_date"><@=moment(quiz.regdate).format("YYYY-MM-DD")@></div>
		<div class="views"><i class="far fa-eye"></i> <@=quiz.views@></div>
		<div class="quizType"><@=quiz.type@></div>
		<div class="like"><i class="far fa-thumbs-up"></i> <@=quiz.likes@></div>
		<div class="dislike"><i class="far fa-thumbs-down"></i> <@=quiz.dislikes@></div>
		<div class="comment"><i class="fas fa-comment-dots"></i> <@=quiz.emCount + quiz.commentCount@></div>
	</a><!--//quiz_wrap-->
</li>
<@})@>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/template.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
let userNo = $(".user_info").attr("data-no");
	
	let $imageChoiceBox = $("#imageChoiceBox");
	let $adoptQuizDetailView = $("#adoptQuizDetailView");
    let $adoptQuizDetailViewBG = $("#adoptQuizDetailViewBG");
	
	barGraph();
	function barGraph() {
		//console.log("그래프 생성 시작");
		//getUserCategoriesRate();
		let $bar = $("#bar");

	    let barData = {
	        labels: ["일반상식", "과학", "경제", "법률", "예술",
	            "스포츠", "역사", "인문", "지리", "TV/영화/만화",
	            "게임", "IT", "인물", "생물", "의학"], //x축
	        datasets: [{ //데이터 오브젝트 배열
	            label: '카테고리별 정답률',
	            fill: false,
	            backgroundColor: ['#EF9A9A', '#B0BEC5', '#CE93D8',
	                '#E6EE9C', '#9FA8DA', '#90CAF9',
	                '#F48FB1', '#C5E1A5', '#FFAB91',
	                '#A5D6A7', '#80DEEA', '#B39DDB',
	                '#FFF59D', '#80CBC4', '#BCAAA4'],
	                
	            borderColor: ['#EF9A9A', '#B0BEC5', '#CE93D8',
	                '#E6EE9C', '#9FA8DA', '#90CAF9',
	                '#F48FB1', '#C5E1A5', '#FFAB91',
	                '#A5D6A7', '#80DEEA', '#B39DDB',
	                '#FFF59D', '#80CBC4', '#BCAAA4'],
	                
	            borderWidth: 2,

	            hoverBackgroundColor: ['#EF9A9A', '#B0BEC5', '#CE93D8',
	                '#E6EE9C', '#9FA8DA', '#90CAF9',
	                '#F48FB1', '#C5E1A5', '#FFAB91',
	                '#A5D6A7', '#80DEEA', '#B39DDB',
	                '#FFF59D', '#80CBC4', '#BCAAA4'],
	                
	            data: [${categoriesStr}] //f(x)
	        }]
	    };//barData
	    let barChartDataArr = barData.datasets[0].data; //데이터 배열
	    let barChartYMax = 100;
	    let barOptions = {
	        title: {
	            display: true,
	            text: "카테고리별 정답률",
	            fontSize: 26
	        },
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true,
	                    suggestedMax: barChartYMax //suggestedMax - max 값을 축 비율에 맞게 설정해줌

	                }
	            }],
	            xAxes: [{
	                barThickness: 50// bar 두께 조정 (50 - 각 x축의 넓이의 50% 크기 )
	            }]
	        }
	    }
	    //차트 선언
	    let barChart = new Chart($bar, {
	        type: 'bar',
	        data: barData,
	        options: barOptions
	    });//barChart end
	    
	    //console.log("그래프 생성 종료");
	}//barGraph() end
	

    let $profile_tabLi = $(".profile_tab li");
    let $adoptQuizListLi = $("#adoptQuizList li");
    let $image_btn = $(".image_btn");
    let $profileImageSettingBtn = $("#profileImageSettingBtn");
    let $cancelBtn = $("#cancelBtn");

    $profile_tabLi.click(function (e) {

        $(".on").removeClass("on");
        let idx = $(this).index();

        $(".profile_tab li").eq(idx).addClass("on");
        $(".tab").eq(idx).addClass("on");
        e.preventDefault();
    }); // .profile_tab li cilck() end

    function adoptQuizListLiClick() {

        $adoptQuizDetailView.css({
            display:"block",
        });
        $adoptQuizDetailViewBG.css("display","block");
        $('html, body').css({'overflow': 'hidden', 'height': '100%'});
        $('#element').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });
    } //#adoptQuizList click() end

    $adoptQuizDetailView.on("click", "#cancelBtn", function () {

        $adoptQuizDetailView.css({
            display:"none",
        });
        $adoptQuizDetailViewBG.css("display","none");
    });//#cancelBtn click() end

    $profileImageSettingBtn.click(function () {

        $("#imageChoiceBox").toggle();

    });

    $image_btn.click(function () {
        $imageChoiceBox = $("#imageChoiceBox");
        $imageChoiceBox.hide();
    });
    
    
/////////////////////////////////////////////////////////////////////////동호

	
	let $adoptInfoBox = $("#adoptInfoBox");
	let $verificationQuizTab = $("#verificationQuizTab");
	let $adoptQuizTab = $("#adoptQuizTab");
	let $quizList = $("#quizList");
	let $adoptQuizList = $("#adoptQuizList");
	let $sortFilterWrapRadio = $("#sortFilterWrap .radio");
	let verifiUserQuizListTmp = _.template($("#verifiUserQuizListTmp").html());
	let adoptQuizListTmp = _.template($("#adoptQuizListTmp").html());
	let adoptQuizListDetailTmp = _.template($("#adoptQuizListDetailTmp").html());
	let playData;
	let sort = 1;//검증의 정렬방식
	let verifiPageNo = 1;//검증의 페이지
	let adoptPageNo = 1;//채택의 페이지
	let $verifiPaginate = $("#verifiPaginate");
	let $adoptPaginate = $("#adoptPaginate");
	let $imageChoiceFile = $("#imageChoiceFile");
	let $userProfileImage = $("#userProfileImage");
	//let $uploadImage = $("#uploadImage");
	let $imageDelete = $("#imageDelete"); 
	let $profileImage = $("#profileImage img");
	let qiNo = 1;

	//검증탭을 눌렀을 때
	$verificationQuizTab.on("click", function(){
		verifiPageNo = 1;
		getVerifiQuizList();
	})//$verificationQuizTab click() end
	
	//채택 탭을 눌렀을 때
	$adoptQuizTab.on("click", function(){
		adoptPageNo = 1;
		//console.log("ajax  전"+qiNo);
		getAdoptQuizList();
		//console.log("ajax  후"+qiNo);
	})//$adoptQuizTab click() end
	
	//채택탭 퀴즈리스트를 가져오는 함수
	function getAdoptQuizList() {
		$.ajax({
			url:"/ajax/user/${no}/quiz/adopt/page/"+adoptPageNo,
			type:"get",
			traditional : true,
			dataType:"json",
			data:{
				"userNo":userNo,
				"qiNo" : qiNo
			},
			error:function(){
				alert("서버 점검중~");
			},//error() end
			success:function(json){
				console.log(json);
				$adoptQuizList.html(adoptQuizListTmp({quizList:json.quizList}));
				$adoptPaginate.html(json.paginate);
			}//success() end
		})//ajax() end
		
	}//getAdoptQuizList() end
	
	//채택탭의 문제를 눌렀을 때
	$adoptQuizList.on("click", "li", function(){
		let qiNo = this.dataset.no;
		let type = this.dataset.value;
		let content = $(this).children(".adopt_quiz").text();
		let category = $(this).children(".category").html();
		$.ajax({
			url:"/ajax/user/${no}/quiz/adopt/"+qiNo,
			type:"get",
			traditional : true,
			dataType:"json",
			/*data:{
				"no":qiNo,   남아있는 경우 ?no=qiNo&str=str 형식으로 출력됨(get방식)
				"str":str
			},*/
			error:function(){
				alert("서버 점검중~");
			},//error() end
			success:function(json){
				console.log(json);
				let quizDetail = {
					"choices":json.choices,
					"content":content,
					"category":category,
					"type":type
				}
				//console.log(quizDetail);
				$adoptQuizDetailView.html(adoptQuizListDetailTmp({quiz:quizDetail}));
				adoptQuizListLiClick();
			}//success() end
		})//ajax() end
	})//$adoptQuizListLi click() end
	
	
	//채택의 paginate를 눌렀을 때
    $verifiPaginate.on("click", "a", function (e) {
    	e.preventDefault();
    	verifiPageNo = this.dataset.no;
    	getVerifiQuizList();
	})//paginate click end
	
	//검증탭의 정렬을 눌렀을 때
	$sortFilterWrapRadio.on("change", function(){
		sort = $(this).val();
		verifiPageNo = 1;
		getVerifiQuizList();
	})//$sortFilterWrapRadio click end
	
	//검증의 paginate를 눌렀을 때
    $verifiPaginate.on("click", "a", function (e) {
    	e.preventDefault();
    	verifiPageNo = this.dataset.no;
    	getVerifiQuizList();
	})//paginate click end
	
	//검증중인 퀴즈리스트 가져오는 함수
	function getVerifiQuizList() {
		//console.log("함수");
		$.ajax({
			url:"/ajax/user/${no}/quiz/verify/page/"+verifiPageNo,
			type:"get",
			dataType:"json",
			data:{
				"userNo":userNo,
				"sort":sort,
			},
			error:function(){
				alert("서버 점검중~");
			},//error() end
			success:function(json){
				//console.log(json)
				$quizList.html(verifiUserQuizListTmp({quizList:json.quizList}));
				$verifiPaginate.html(json.paginate);
			}//success() end
		})//ajax() end
	}//getVerifiQuizList() end
	
	
	
	//프로필사진을 바꿨을 때
	$imageChoiceFile.on("change",function(){
		
		//input type=file에는 files라는 배열이 있습니다.
		//그중 0번지를 얻어오면 파일객체
		var file = this.files[0];
		
		/* 파일객체의 속성
		
			- name : 파일이름
			- type : 파일의 타입(MIME)
			- size : 파일의 크기(byte)
			- lastModified : 최종수정일
		
		*/
		//console.log(file);
		
		//잘못된 파일 선택	
		if(file.size<=0) {
			alert("파일을 제대로 선택해주세요.");
			//내용을 비움
			$imageChoiceFile.val("");
			return;
		}//if end
		
		//이미지 파일만 선택
		if(!file.type.includes("image/")) {
			alert("이미지 파일을 선택해주세욤.");
			//내용을 비움
			$imageChoiceFile.val("");
			return;
		}//if end
		
		//파일의 사이즈가 0이 아니고 이미지일 때
		//파일업로드를 해야합니다.
		
		//FormData API(HTML5) 필요함
	    var data = new FormData();
		
		//Formdata객체에 파라미터를 append함
		//formData.append(name, value);
		//formData.append(name, value,filename);
		//             (파라미터명, 값, 파일이름)
		data.append("profile",file,file.name);
		
		//비움
		$imageChoiceFile.val("");
		
		//multipart/form-data일 때
		$.ajax({
			url:"/ajax/user/${no}/profile/upload",
			dataType:"json",
			type:"post",
			data:data,
			processData:false,
			contentType:false,
			error:function() {
				alert("서버 점검중!");
			},
			success:function(data) {
				//console.log("변경한다");
				//console.log(data);
				//console.log(data.fileName);
				$userProfileImage.attr("src","/profileImage/"+data.fileName);
				$profileImage.attr("src","/profileImage/"+data.fileName);
				//$uploadImage.val(data.fileName);
			}//success end
		});//ajax() end
	});//$imageChoiceFile change end
	
	//프로필 사진 삭제를 눌렀을 때
	$imageDelete.on("click", function(){
		console.log("default로~");
		$.ajax({
			url:"/ajax/user/${no}/profile",
			dataType:"json",
			type:"post",
			error:function() {
				alert("서버 점검중!");
			},
			success:function(data) {
				//console.log("변경한다");
				console.log(data);
				//console.log(data.fileName);
				$userProfileImage.attr("src","/profileImage/default.jpg");
				$profileImage.attr("src","/profileImage/default.jpg");
			}//success end
		});//ajax() end
	});//imageDelete click() end
	
</script>
</body>
</html>