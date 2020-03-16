<%@page import="com.spoon.loststations.vo.User"%>
<%@page import="com.spoon.loststations.util.PaginateUtil"%>
<%@page import="com.spoon.loststations.dao.QuizInfosDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.spoon.loststations.vo.QuizInfo"%>
<%@page import="com.spoon.loststations.vo.PageVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <c:import url="/WEB-INF/template/link.jsp"/>
    <link rel="stylesheet" href="/css/quizList.css">
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/>
<c:import url="/WEB-INF/template/quizForm.jsp"/>

    <!---------------------------------------------  quizList  ---------------------------------------------->
    <div id="quizConditionSection">
        <div id="quizTypeFilterWrap">
            <input type="checkbox" class="checkbox" id="typeFilter1" name="type" value="OX">
            <label class="label type" for="typeFilter1">OX</label>
            <input type="checkbox" class="checkbox" id="typeFilter2" name="type" value="MC">
            <label class="label type" for="typeFilter2">사지선다</label>
        </div><!--//quizTypeFilterWrap-->
        <h3 class="screen_out">카테고리 필터 선택</h3>
        <div id="categoryFilterWrap">
            <input type="checkbox" class="checkbox" id="categoryFilter1" name="category" value="1" ${categoryNo==1?"checked":""}>
            <label class="label category" for="categoryFilter1" ><i class="fas fa-user-graduate"></i> 일반상식</label>
            <input type="checkbox" class="checkbox" id="categoryFilter2" name="category" value="2" ${categoryNo==2?"checked":""}>
            <label class="label category" for="categoryFilter2"><i class="fas fa-flask"></i> 과학</label>
            <input type="checkbox" class="checkbox" id="categoryFilter3" name="category" value="3" ${categoryNo==3?"checked":""}>
            <label class="label category" for="categoryFilter3"><i class="fas fa-dollar-sign"></i> 경제</label>
            <input type="checkbox" class="checkbox" id="categoryFilter4" name="category" value="4" ${categoryNo==4?"checked":""}>
            <label class="label category" for="categoryFilter4"><i class="fas fa-balance-scale"></i> 법률</label>
            <input type="checkbox" class="checkbox" id="categoryFilter5" name="category" value="5" ${categoryNo==5?"checked":""}>
            <label class="label category" for="categoryFilter5"><i class="fas fa-music"></i> 예술</label>
            <input type="checkbox" class="checkbox" id="categoryFilter6" name="category" value="6" ${categoryNo==6?"checked":""}>
            <label class="label category" for="categoryFilter6"><i class="fas fa-basketball-ball"></i> 스포츠</label>
            <input type="checkbox" class="checkbox" id="categoryFilter7" name="category" value="7" ${categoryNo==7?"checked":""}>
            <label class="label category" for="categoryFilter7"><i class="fas fa-landmark"></i> 역사</label>
            <input type="checkbox" class="checkbox" id="categoryFilter8" name="category" value="8" ${categoryNo==8?"checked":""}>
            <label class="label category" for="categoryFilter8"><i class="fas fa-book"></i> 인문</label>
            <input type="checkbox" class="checkbox" id="categoryFilter9" name="category" value="9" ${categoryNo==9?"checked":""}>
            <label class="label category" for="categoryFilter9"><i class="fas fa-globe-asia"></i> 지리</label>
            <input type="checkbox" class="checkbox" id="categoryFilter10" name="category" value="10" ${categoryNo==10?"checked":""}>
            <label class="label category" for="categoryFilter10"><i class="fas fa-tv"></i> TV/영화/만화</label>
            <input type="checkbox" class="checkbox" id="categoryFilter11" name="category" value="11" ${categoryNo==11?"checked":""}>
            <label class="label category" for="categoryFilter11"><i class="fas fa-gamepad"></i> 게임</label>
            <input type="checkbox" class="checkbox" id="categoryFilter12" name="category" value="12" ${categoryNo==12?"checked":""}>
            <label class="label category" for="categoryFilter12"><i class="fab fa-android"></i> IT</label>
            <input type="checkbox" class="checkbox" id="categoryFilter13" name="category" value="13" ${categoryNo==13?"checked":""}>
            <label class="label category" for="categoryFilter13"><i class="fas fa-user"></i> 인물</label>
            <input type="checkbox" class="checkbox" id="categoryFilter14" name="category" value="14" ${categoryNo==14?"checked":""}>
            <label class="label category" for="categoryFilter14"><i class="fas fa-dog"></i> 생물</label>
            <input type="checkbox" class="checkbox" id="categoryFilter15" name="category" value="15" ${categoryNo==15?"checked":""}>
            <label class="label category" for="categoryFilter15"><i class="fas fa-syringe"></i> 의학</label>
            <input type="button" class="checkbox" id="categoryFilter16" name="category" value="0">
            <label class="label category" for="categoryFilter16">전체 선택해제</label>
        </div><!--//categoryFilterWrap-->
        <div id="sortFilterWrap">
            <input type="radio" checked class="radio" id="sortFilter1" name="sort" value="1">
            <label class="label sort_btn" for="sortFilter1">최신</label>
            <input type="radio" class="radio" id="sortFilter2" name="sort" value="2">
            <label class="label sort_btn" for="sortFilter2">채택 임박</label>
            <input type="radio" class="radio" id="sortFilter3" name="sort" value="3">
            <label class="label sort_btn" for="sortFilter3">HOT</label>
        </div><!--//sortFilterWrap-->
        <form id="searchFormWrap">
            <select id="searchSelect" name="searchType">
                <option value="all">전체</option>
                <option value="content">내용</option>
                <option value="writer">작성자</option>
            </select>
            <input id="searchInput" name="searchContent"/>
            <button id="searchBtn" type="submit"><i class="fas fa-search"></i></button>
        </form><!--//searchFormWrap-->
    </div><!--//quizConditionSection-->
	<div id="quizListWrap">
        <ul id="quizList">
<!--                        여기에 리스트 추가                        -->
        </ul>
		<div id="loader"></div>
    </div><!--//quizListWrap-->
    <button id="quizWriteBtn" class="btn">문제출제하기</button>
    <div id="paginate">
        
    </div><!--//paginate-->
<c:import url="/WEB-INF/template/footer.jsp"/>
<script type="text/template" id="quizListTmp">
<@if(quizList.length<1) {@>
    <li><div class="quiz">퀴즈가 존재하지 않습니다.</div></li>
<@}else{@>
<@ _.each(quizList, function(quiz) { @>
<li>
	<a id="quizWrap" href="/quiz/<@=quiz.no@>">
		<@if(quiz.category == 1){ @>
			<div class="list_category category_color1"><i class="fas fa-user-graduate">일반상식</i></div>
		<@}else if(quiz.category == 2){ @>
			<div class="list_category category_color2"><i class="fas fa-flask">과학</i></div>
		<@}else if(quiz.category == 3){ @>
			<div class="list_category category_color3"><i class="fas fa-dollar-sign">경제</i></div>
		<@}else if(quiz.category == 4){ @>
			<div class="list_category category_color4"><i class="fas fa-balance-scale">법률</i></div>
		<@}else if(quiz.category == 5){ @>
			<div class="list_category category_color5"><i class="fas fa-music">예술</i></div>
		<@}else if(quiz.category == 6){ @>
			<div class="list_category category_color6"><i class="fas fa-basketball-ball">스포츠</i></div>
		<@}else if(quiz.category == 7){ @>
			<div class="list_category category_color7"><i class="fas fa-landmark">역사</i></div>
		<@}else if(quiz.category == 8){ @>
			<div class="list_category category_color8"><i class="fas fa-book">인문</i></div>
		<@}else if(quiz.category == 9){ @>
			<div class="list_category category_color9"><i class="fas fa-globe-asia">지리</i></div>
		<@}else if(quiz.category == 10){ @>
			<div class="list_category category_color10"><i class="fas fa-tv">TV/영화/만화</i></div>
		<@}else if(quiz.category == 11){ @>
			<div class="list_category category_color11"><i class="fas fa-gamepad">게임</i></div>
		<@}else if(quiz.category == 12){ @>
			<div class="list_category category_color12"><i class="fab fa-android">IT</i></div>
		<@}else if(quiz.category == 13){ @>
			<div class="list_category category_color13"><i class="fas fa-user">인물</i></div>
		<@}else if(quiz.category == 14){ @>
			<div class="list_category category_color14"><i class="fas fa-dog">생물</i></div>
		<@}else if(quiz.category == 15){ @>
			<div class="list_category category_color15"><i class="fas fa-syringe">의학</i></div>
		<@} @>
		<div class="quiz"><@=quiz.content@></div>
		<img class="quiz_list_profile_image" src="/profileImage/<@=quiz.profileImage@>"/>
		<img class="quiz_list_tier" src="/img/TierGrandMaster.png" width="25" height="25"/>
		<div class="writer"><@=quiz.nickname@></div>
		<div class="regdate"><@=moment(quiz.regdate).format("YYYY-MM-DD")@></div>
		<div class="views"><i class="far fa-eye"></i> <@=quiz.views@></div>
		<div class="list_quiz_type"><@ 
			if(quiz.type == 'MC') {
				@>사지선다<@
			}else {
				@>OX<@
			} @></div>
		<div class="like"><i class="far fa-thumbs-up"></i> <@=quiz.likes@></div>
		<div class="dislike"><i class="far fa-thumbs-down"></i> <@=quiz.dislikes@></div>
		<div class="comment"><i class="fas fa-comment-dots"></i> <@=quiz.emCount + quiz.commentCount@></div>
	</a><!--//quizWrap-->
</li>
<@}) @>
<@}@>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script src="/js/moment-with-locales.js"></script>
<script src="/js/template.js"></script>
<script>
_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};

    let $quizWriteBtn = $("#quizWriteBtn");
    let $cancelBtn = $("#cancelBtn");
    let $quizTypeSelectWrap_radio= $("#quizTypeSelectWrap .radio");
    let $quizWriteForm = $("#quizWriteForm");
    let $categoryFilter16 = $("#categoryFilter16");
    let $writeMsg = $("#writeMsg");
    let $quizListWrap = $("#quizListWrap");
    const $quizContents = $("#quizContents");
    const $quizContentsSize = $("#quizContentsSize");
    const $commentary = $("#commentary");
    const $quizCommentarySize = $("#quizCommentarySize");
    let $categoryFilterBtn = $('#categoryFilterWrap input:button');
    let $categoryFilterinput = $('#categoryFilterWrap input');
    let $quizTypeFilterinput = $('#quizTypeFilterWrap input');
	let $sortFilter1 = $('#sortFilter1');
	let $sortFilter2 = $('#sortFilter2');
	let $sortFilter3 = $('#sortFilter3');
    let $paginate = $("#paginate");
	let pageNo = 1;//현재 댓글 페이지
	let sort = 1;//정렬이 어떤 것인지
	let $searchForm = $("#searchFormWrap");
	let $searchSelect = $("#searchSelect");
	let $searchInput = $("#searchInput");
    let $quizList = $("#quizList");
    let quizList = []; //퀴즈리스트 목록
    let quizListTmp = _.template($("#quizListTmp").html());
    let $sortFilterWrapRadio = $('#sortFilterWrap .radio');
    let $quizRegisterForm = $("#quizRegisterForm");
    let $loader = $("#loader");
    
    
    $searchForm.on("submit",function(){
    	getQuizList();
    	return false;
    });//searchForm submit() end
    
	//페이지를 눌렀을 때
    $paginate.on("click", "a", function (e) {
    	//alert("test");
    	e.preventDefault();
    	
    	pageNo = this.dataset.no;
    	//console.log(pageNo);
    	nowQuizList();
		return false;
	})//paginate click end
    
    //최신순, 채택임박, HOT 라디오 버튼을 클릭했을 때
    $sortFilterWrapRadio.on('change',function(){
    	pageNo = 1;
    	nowQuizList();
    });//$sortFilterWrapRadio end
    
    //현재 정렬이 무엇인지 확인하고 리스트를 출력하는 함수
    function nowQuizList(){
    	if($sortFilter1.is(':checked')) {
    		sort = 1;
    	}else if ($sortFilter2.is(':checked')) {
    		sort = 2;
    	} else {
    		sort = 3;
    	}//if~else end
    	getQuizList();
    }//nowQuizList() end
    
    
    //카테고리 필터(체크박스)를 눌렀을 때
    $categoryFilterinput.on("change", function () {
    	pageNo = 1;
    	getQuizList();
	})//categoryFilterinput.change() end

    
    //퀴즈 목록 불러오는 함수
    function getQuizList() {
    	$loader.show();
    	let searchType = $searchSelect.val();
    	let searchContent = $searchInput.val();
    	let categories = [];
    	$("#categoryFilterWrap :checked").each(function () {
			categories.push($(this).val());
		});
    	if(categories.length==0) {
    		categories = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15];
    	}
    	//console.log(categories);
    	//선택된 카테고리를 String으로("1,2,3,4,5")
    	let types = [];
    	$("#quizTypeFilterWrap :checked").each(function () {
			types.push($(this).val());
		});
    	if(types.length==0) {
    		types = ["OX", "MC"];
    	}//#quizTypeFilterWrap :checked each end
    	//console.log(types);
    	
		$.ajax({
			url:"/ajax/quiz/page/"+pageNo,
			type:"get",
			traditional : true,
			dataType:"json",
			data:{
				"categories":categories,
				"types":types,
				"sort":sort,
				"searchType":searchType,
				"searchContent":searchContent
			},
			error:function(){
				alert("서버 점검중~");
			},//error() end
			success:function(json){
				quizList = json.quizList;
				//console.log(quizList);
				$quizList.html(quizListTmp({quizList:quizList}));
				paginate = json.paginate;
				$paginate.empty();
				$paginate.append(paginate);
				$loader.fadeOut(200);
			}//success() end
		})//ajax() end
    }//getQuizList() end

    //카테고리필터 전체 선택해제버튼
    $categoryFilter16.on("click", function () {
        //alert("test");
        $('#categoryFilterWrap input').prop('checked', false);
        getQuizList();
    });//$allCheckbox.change end

    //카테고리 필터 모두 선택시 해제되도록
    $categoryFilterinput.on("change",function () {
        let count = $("#categoryFilterWrap input:checked");
        //console.log(count.length);
        //체크박스가 15개이면 모두 체크 해제
        if(count.length == 15) {
            $categoryFilterinput.prop('checked', false);
        }
    });//$popupBox input.change end

    //유형 모두 선택시 해제되도록
    $quizTypeFilterinput.on("change",function () {
        let count = $("#quizTypeFilterWrap input:checked");
        getQuizList();
        //console.log(count.length);
        //체크박스가 2개이면 모두 체크 해제
        if(count.length == 2) {
            $quizTypeFilterinput.prop('checked', false);
        }
    });//$popupBox input.change end

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
    $quizRegisterForm.on("submit", function () {
        if(!testCategory()) return false;
        if(!testContents()) return false;
        if(!testAnswer()) return false;
        if(!testCommentary()) return false;
    });//signUpForm.submit() end

    
    getQuizList();
</script>
</body>
</html>

