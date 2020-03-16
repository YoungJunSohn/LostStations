<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp"/> 
    <link rel="stylesheet" href="/css/main.css"/>
</head>

<body>
<c:import url="/WEB-INF/template/header.jsp"/> 
<c:import url="/WEB-INF/template/quizForm.jsp"/>

        <div id="section">
<!-- 퀴즈 움직이는 목록 -->
<div id="quizBox">
            <h2 class="screen_out">퀴즈</h2>
            <div id="loader"></div>
</div><!--//quizBox -->
        <div id="categoryBox">
            <ul id="categoryList">
                <li class="on"><a href="quiz/category/1"><i class="fas fa-user-graduate"></i> 일반상식</a></li>
				<li><a href="quiz/category/2"><i class="fas fa-flask"></i> 과학</a></li>
				<li><a href="quiz/category/3"><i class="fas fa-dollar-sign"></i> 경제</a></li>
				<li><a href="quiz/category/4"><i class="fas fa-balance-scale"></i> 법률</a></li>
				<li><a href="quiz/category/5"><i class="fas fa-music"></i> 예술</a></li>
				
				<li><a href="quiz/category/6"><i class="fas fa-basketball-ball"></i> 스포츠</a></li>
				<li><a href="quiz/category/7"><i class="fas fa-landmark"></i> 역사</a></li>
				<li><a href="quiz/category/8"><i class="fas fa-book"></i> 인문</a></li>
				<li><a href="quiz/category/9"><i class="fas fa-globe-asia"></i> 지리</a></li>
				<li><a href="quiz/category/10" id="categoryTen"><i class="fas fa-tv"></i> TV<br>영화<br>만화</a></li>
				
				<li><a href="quiz/category/11"><i class="fas fa-gamepad"></i> 게임</a></li>
				<li><a href="quiz/category/12"><i class="fab fa-android"></i> IT</a></li>
				<li><a href="quiz/category/13"><i class="fas fa-user"></i> 인물</a></li>
				<li><a href="quiz/category/14"><i class="fas fa-dog"></i> 생물</a></li>
				<li><a href="quiz/category/15"><i class="fas fa-syringe"></i> 의학</a></li>
            </ul>
        </div><!--//categoryBox -->

            <button id="quizWriteBtn" class="btn">
                <i class="fas fa-pencil-alt">문제 출제하기</i>
            </button><!--//quizWriteBtn -->

        <div id="topRankBox">
            <h2>Top Ranking</h2>
            <ul id="topRankList">
                <a href="quizPlayRanking.jsp">
                <li id="bestPlayUser" class="bestUser">
                    <div class="ranking_name">플레이</div>
                    <img class="profile_image" src="/profileImage/${playTop.profileImage }" width="100" height="100"/>
                    <div id="playTier" class="bestUserTier"></div>
                    <div id="bestPlayUserNickname" class="ranking_nick_name">${playTop.nickname }</div>
                </li>
                </a>
                <a href="quizRegisterRanking.jsp">
                <li id="bestWriteUser" class="bestUser">
                    <div class="ranking_name">출제</div>
                    <img class="profile_image" src="/profileImage/${registerTop.profileImage }" width="100" height="100"/>
                    <div id="writeTier" class="bestUserTier"></div>
                    <div id="bestWriteUserNickname" class="ranking_nick_name">${registerTop.nickname }</div>
                </li>
                </a>
                <a href="quizVerifyRanking.jsp">
                <li id="bestVerifyUser" class="bestUser">
                    <div class="ranking_name">검증</div>
                    <img class="profile_image" src="/profileImage/${verifiTop.profileImage }" width="100" height="100"/>
                    <div id="verifyTier" class="bestUserTier"></div>
                    <div id="bestVerifyUserNickname" class="ranking_nick_name">${verifiTop.nickname }</div>
                </li>
                </a>
            </ul>
        </div><!--//topRankBox -->
        <div id="itemInfoBox">
                <iframe width="390" height="200" src="https://www.youtube.com/embed/-Iy0xcJJw6I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div><!--//itemInfoBox -->
    </div><!--//section-->
<c:import url="/WEB-INF/template/footer.jsp"/> 
<!-- 퀴즈 슬라이드 탬플릿 -->
<script type="text/template" id="quizSlideTmp">
<div class="quiz <@ if(flag) {@>off<@}@>">
                <a class="move" href="/quiz/<@=quiz.no@>">
<div class="quiz_body">
                    <div class="quiz_header">
                        <div>
							<@ if(quiz.category==1){ @>
							<i class="fas fa-user-graduate"> 일반상식</i>
							<@ }else if(quiz.category==2){ @>
							<i class="fas fa-flask"> 과학</i>
							<@ }else if(quiz.category==3){ @>
							<i class="fas fa-dollar-sign"> 경제</i>
							<@ }else if(quiz.category==4){ @>
							<i class="fas fa-balance-scale"> 법률</i>
							<@ }else if(quiz.category==5){ @>
							<i class="fas fa-music"> 예술</i>
							<@ }else if(quiz.category==6){ @>
							<i class="fas fa-basketball-ball"> 스포츠</i>
							<@ }else if(quiz.category==7){ @>
							<i class="fas fa-landmark"> 역사</i>
							<@ }else if(quiz.category==8){ @>
							<i class="fas fa-book"> 인문</i>
							<@ }else if(quiz.category==9){ @>
							<i class="fas fa-globe-asia"> 지리</i>
							<@ }else if(quiz.category==10){ @>
							<i class="fas fa-tv"> TV/영화/만화</i>
							<@ }else if(quiz.category==11){ @>
   				 			<i class="fas fa-gamepad"> 게임</i>
							<@ }else if(quiz.category==12){ @>
    						<i class="fab fa-android"> IT</i>
							<@ }else if(quiz.category==13){ @>
    						<i class="fas fa-user"> 인물</i>
							<@ }else if(quiz.category==14){ @>
    						<i class="fas fa-dog"> 생물</i>
							<@ }else if(quiz.category==15){ @>
    						<i class="fas fa-syringe"> 의학</i>
							<@ }@>
						</div>
                    </div>
                    <h3 class="screen_out">퀴즈 내용</h3>
                    <div class="quiz_content">
                        <p>
                            <@=quiz.content @>
                        </p>
                    </div>
                    <div class="writer"><i class="fas fa-pencil-alt"><@=quiz.nickname@></i></div>
</div>
</a>
                <h3 class="screen_out">보기</h3>
<@ let i= 1; @>
	<div class="answer_choice_wrap">
<@ if (quiz.type=="MC"){@>
		<@ _.each(quiz.choices,function(choice) {   @>
			
                    <div class="answer_choice">
						<input class="selectedNo" type="hidden" value="<@=choice.no@>"/>
                    	<input type="radio" class="radio" id="choice<@=i@>" name="choice<@=i@>" value="<@=choice.chNo@>">
                        <label class="lbl" for="choice<@=i@>"><@=choice.content@></label>
                    </div>
		<@ i++;   }) @>
<@}else{ @>
					<div class="ox_answer_choice">
                        <input type="radio" class="radio" id="oxChoice1" name="oxChoice1" value="<@=quiz.chNo@>" >
                        <label class="lbl2" for="oxChoice1">O</label>
                    </div>
                    <div class="ox_answer_choice">
                        <input type="radio" class="radio" id="oxChoice2" name="oxChoice2" value="<@=quiz.chNo@>" >
                        <label class="lbl2" for="oxChoice2">X</label>
                    </div>
<@ }@>
 
     </div><!-- answerChoiceWrap-->
     </div>

</script><!-- //quizSlideTmp -->
<script src="/js/jquery.js"></script>
<script src="/js/template.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

const quizSlideTmp = _.template($("#quizSlideTmp").html());

let loaderFlag = true;
let $loader = $("#loader");

let $nextQuiz = null;

let quiz = 0;
//인자 3개짜리 클릭 이벤트를 동작시키기 위한 변수 선언
let quizQiNo = 0;
let quizCrNo = 0;
let quizChNo = 0;


/* 퀴즈 하나의 정보들을 가져오는 함수 */
function getQuizRandomOne(flag){
	
	loaderFlag = false;
	if(loaderFlag){
		$loader.show();
	}//if loaderFlag end
	
	//console.log("getQuizRandomOne");
	$.ajax({
		url:"/ajax/quiz/random",
		type:"get",
		dataType:"json",
		error:function(){
			alert("서버 점검중");
		},
		success:function(json){
			quiz=json.quiz;
			//console.log(json);
			quizQiNo=quiz.no;
			quizCrNo=quiz.crNo;
			quizChNo=quiz.chNo;
			
			let $nextQuiz = $(quizSlideTmp({"quiz":json.quiz,"flag":flag}));
			let categoryNum=quiz.category;
			$("#quizBox").append($nextQuiz);
			
			
			 setTimeout(function () {

				    const $prevQuiz = $(".quiz");
				    $prevQuiz.css("left",-548).on("transitionend",function () {
				        	$prevQuiz.remove();
				        });
				    let color = randomColor();
				    //= template()처리;
				    
				   	getQuizRandomOne(true);

				},5000);//setInterval fn end
			
			if(flag){
				//지난 퀴즈 요소 삭제
			    setTimeout(function () {
			    	//$nextQuiz = $(".quiz:last");
			        $nextQuiz.css("left",0).on("transitionend",function () {
			            //alert("test");
			            $nextQuiz.removeClass("off");
			        });//nextqQuiz transitionEnd fn end
			    },50);//setTimeout fn end
			}//if flag end
			
			//카테고리 radio check
			$(".on").removeClass("on");
			$("#categoryList li").eq(categoryNum-1).addClass("on");
			
		
			$loader.fadeOut(200);

		}//success end
	})//ajax end
}//getQuizOne end

getQuizRandomOne(false);//최초 1회 실행


let selectedLabel = 0; 
//ajax 인자 3개짜리 클릭 이벤트
$("#quizBox").on("click",".lbl",function (e) {
	
	//alert($(this).parent().index());
	
	//사지선다
	location.href="/quiz/"+quizQiNo+"/answer/"+quiz.choices[$(this).parent().index()].no;
    
    e.preventDefault();
});

$("#quizBox").on("click",".lbl2",function (e) {
	
	//alert($(this).parent().index());
	
	//OX
	if($(this).parent().index()==0){
		location.href="/quiz/"+quizQiNo+"/answer/"+0;
	}else{
		location.href="/quiz/"+quizQiNo+"/answer/"+(-1);
	}
    
    e.preventDefault();
});


/*    랜덤 컬러 함수     */
function randomColor() {
    const r = Math.floor(Math.random()*256);
    const g = Math.floor(Math.random()*256);
    const b = Math.floor(Math.random()*256);
    return "rgb("+r+","+g+","+b+")";
} //randomColor() end

 $("a").click(function (e) {
    //alert($(this).text());
   
    e.stopPropagation();
 });




$("#categoryList li").on("mouseenter", function(){
	$(".on2").removeClass("on2");
	$(this).addClass("on2");
});
$("#categoryList li").on("mouseleave", function(){
	$(".on2").removeClass("on2");
});



    
    
    
    
    



    
/////////////////////////////////////////////////////////////////////////////////////////
    let $quizWriteBtn = $("#quizWriteBtn");
    let $cancelBtn = $("#cancelBtn");
    let $quizTypeSelectWrap_radio= $("#quizTypeSelectWrap .radio");
    let $quizWriteForm = $("#quizWriteForm");
    let $writeMsg = $("#writeMsg");
    const $quizContents = $("#quizContents");
    const $quizContentsSize = $("#quizContentsSize");
    const $commentary = $("#commentary");
    const $quizCommentarySize = $("#quizCommentarySize");

    //문제출제 팝업창 열기
    $quizWriteBtn.on("click",function (e) {
        $("body").addClass("popup");
        e.preventDefault();
    });//$quizWriteBtn click() end

    //문제출제 팝업창 닫기
    $cancelBtn.on("click",function () {
        //alert("Test");
        $("body").removeClass("popup");

    });//$cancelBtn click() end

    //문제출제 팝업창의 보기 변경
    $quizTypeSelectWrap_radio.on("click",function () {
        let text = $(this).val();
        //alert(text);
        if(text=="OX"){
            //  alert("OX");
            $quizWriteForm.removeClass("change");
            $("#answerChoiceFourThings input").val("");
        }else {
            // alert("4지");
            $("#answerChoiceOX .radio").prop("checked",false);
            $quizWriteForm.addClass("change");
        }
    });//$quizTypeSelectWrap_radio click() end

    //문제 출제 창 유효성 검사********************************************************
    //카테고리 선택 유효성 검사
    function testCategory() {
        if(!$("#categorySelectWrap input").is(":checked")) {
            //alert("categoryTest");
            $writeMsg.show().addClass('no').text("카테고리를 선택해주세요.");
            return false;
        } else {
            return true;
        }
    }//testCategory() end

    //문제작성 팝업에서 문제 글자 수 제한
    $quizContents.keyup(function () {
        let val = $quizContents.val();
        let size = val.length;
        if(size>=150){
            $quizContents.val(val.substr(0,150));
        }
        $quizContentsSize.text(size);
    });//quizContents() end

    //문제작성 유효성 검사
    function testContents() {
        let val = $quizContents.val();
        let size = val.length;
        if(size<1) {
            //alert("contentsTest");
            $writeMsg.show().addClass('no').text("문제를 작성해주세요.");
            return false;
        } else {
            return true;
        }
    }//testContents() end

    //해설 글자 수 제한
    $commentary.keyup(function () {
        let val = $commentary.val();
        let size = val.length;
        if(size>=300){
            $commentary.val(val.substr(0,300));
        }
        $quizCommentarySize.text(size);
    });//commentary() end

    //해설 유효성 검사
    function testCommentary() {
        let val = $commentary.val();
        let size = val.length;
        //console.log("코멘터리");
        if(size<1) {
            //alert("commentaryTest");
            $writeMsg.show().addClass('no').text("해설을 작성해주세요.");
            return  false;
        } else {
            return true;
        }
    }//testCommentary() end

    //정답체크 검사
    function testAnswer() {
        let quizType = $("#quizTypeSelectWrap .radio:checked").val();
        //console.log(quizType);
        let quizChoice = -1;
        if(quizType=="OX") {
            quizChoice = $("#answerChoiceOX .radio:checked").length;
            if(quizChoice==0) {
                $writeMsg.show().addClass('no').text("OX정답을 체크해주세요.");
                return false;
            }else {
                return true;
            }//if~else end
        }else {
            let flag = false;
            $("#answerChoiceFourThings input[type=text]").each(function () {
                let txtSize = $(this).val().trim().length;
                //console.log("each:"+txtSize);
                if(txtSize<=0) {
                    flag = true;
                    return false;
                }//if end
            });//each() end
            //console.log(flag);
            quizChoice = $("#answerChoiceFourThings .radio:checked").length;
            //console.log(quizChoice);
            if(quizChoice==0) {
                $writeMsg.show().addClass('no').text("사지선다 정답을 체크해주세요.");
                return false;
            }else if(flag) {
                $writeMsg.show().addClass('no').text("사지선다 보기를 작성해주세요.");
            }else {
                return true;
            }//if~else end
        }//function end
    }//testAnswer() end

    //등록을 눌렀을 때 유효성 검사가 통과돼야 넘어감
    $("#quizRegisterForm").on("submit", function () {
        //e.preventDefault();
        if(!testCategory()) return false;
        if(!testContents()) return false;
        if(!testAnswer()) return false;
        if(!testCommentary()) return false;
    });//signUpForm.submit() end
    
    
</script>

</body>
</html>