<%@page import="com.spoon.loststations.dao.QuizInfosDAOImpl"%>
<%@page import="com.spoon.loststations.vo.QuizInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>LostStations</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link href="https://fonts.googleapis.com/css?family=Abel|Noto+Sans+KR&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/game.css">
</head>
<body>
<main id="content">
	<div id="loaderBG">
		<div id="loader"></div>
	</div>
	<div id="totalWrap">
	<div class="game_over"> GAME OVER </div><!-- //game_over end -->
	    <div id="topWrap">
	        <div class="quiz_wrap">      
	            <div id="hitPoint"></div> 
	        </div><!-- //quiz_wrap end -->
	
	        <div id="leftEnemy" class="enemy" data-no="">
	            <img src="/profileImage/default.jpg" class="profile_image"/>
	            <div id="leftEnemyBody" class="enemy_body"></div>
	            <div id="leftEnemyNickName" class="nick_name"></div>
	        </div><!-- //leftEnemy -->
	
	        <div id="rightEnemy" class="enemy" data-no="">
	            <img src="/profileImage/default.jpg" class="profile_image"/>
	            <div id="rightEnemyBody" class="enemy_body"></div>
	            <div id="rightEnemyNickName" class="nick_name"></div>
	        </div><!-- //rightEnemy -->
	    </div><!-- //topWrap -->
	    <div id="bottomWrap">
	        <div id="leftSub" class="sub_part">
	            <div id="map"></div>
	        </div><!-- //leftSub -->
	        <div id="attackQuizListWrap">
	            <ul id="attackQuizList">
	            
					<li id="quiz1" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem1" name="quiz" value="">
                            <label class="tremble" for="quizItem1"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
					<li id="quiz2" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem2" name="quiz" value="">
                            <label class="tremble" for="quizItem2"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
					<li id="quiz3" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem3" name="quiz" value="">
                            <label class="tremble" for="quizItem3"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
					<li id="quiz4" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem4" name="quiz" value="">
                            <label class="tremble" for="quizItem4"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
					<li id="quiz5" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem5" name="quiz" value="">
                            <label class="tremble" for="quizItem5"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
					<li id="quiz6" data-text="">
	                    <div class="coolTimePointWrap">
	                        <div class="coolTimePoint"></div>
	                    </div><!-- //coolTimePointWrap -->
                        <div class="category">
                        	<input type="radio" class="radio" id="quizItem6" name="quiz" value="">
                            <label class="tremble" for="quizItem6"></label>
                            <!-- category 내용(i + 이름) -->
                        </div><!-- //category -->
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
	                </li>
	
	            </ul>
	            <div id="quizDetail">
					아이템 선택하기.
	
	            </div><!-- //quizDetail -->
	        </div><!-- //attackQuizListWrap -->
	        <!-- 
	        <div id="rightSub" class="sub_part">
	            <div>
	                <button id="moveBtn" class="move_btn">MOVE</button>
	                <button id="moveTypeBtn" class="move_btn"><i class="fas fa-fast-forward"></i></button>
	                <button id="showMapBtn" class="move_btn">MAP</button>
	            </div>
	        </div>
	        -->
	    </div><!-- //bottomWrap -->
	</div><!-- totalwrap end -->
</main>
<script type="text/template" id="quizWrapTmp" >
            <div class="quiz_box">
            <div class="quiz">
                <div class="quiz_category">
					<@=getCategory(quiz.category)@>
				</div>
                <div class="quiz_text"><@=quiz.content@></div>
                <div class="writer" data-value="<@=quiz.nickname@>"><i class="far fa-edit"></i><@=quiz.nickname@></div>
            </div>
            <div class="answer_choice_wrap">

                <ul class="answer_choice">
				<@ if (quiz.type=="MC"){@>
				<@ _.each(quiz.choices,function(choice) {   @>
                    <li>
                        <div class="choice">
                            <input id="choice<@=idx@>" data-index="<@=log@>" data-value="<@=quiz.chNo @>"  class="radio"  name="choice" type="radio" value="<@=choice.no@>"/>
                            <label class="choice_label" for="choice<@=idx@>"><@=choice.content@></label>
                        </div>
                    </li>
					<@ idx++;   }) @>
				<@}else{ @>
					<li>
						<div class="choice">
                        <input type="radio" class="radio" data-index="<@=log@>" id="choice<@=idx@>" name="a" value="0" data-value="<@=quiz.chNo @>">
                        <label class="choice_label2" for="choice<@=idx++@>">O</label>
                    	</div>
					</li>
					<li>
                    	<div class="choice">
                        <input type="radio" class="radio" data-index="<@=log@>" id="choice<@=idx@>" name="a" value="-1" data-value="<@=quiz.chNo @>">
                        <label class="choice_label2" for="choice<@=idx++@>">X</label>
                    	</div>
					</li>
				<@}@>
                    
                </ul>
            </div><!--//answer_choice_wrap end-->
			</div>
</script>
<script type="text/template" id="quizItemTemp">
    			<@ console.log(json[0].name)@>

			<@ for (var i = 0; i <= 5; i++) {@>
				<li class="Itemli">
				<input type="hidden" value="<@=json[i].content@>">
                    <div class="coolTimePointWrap">
                        <div class="coolTimePoint"></div>
                    </div>
                        <div class="category">
                            <input type="radio" class="radio" id="quiz1" name="quiz" value=""/>
                            <label class="tremble" for="quiz1">


							<@if(json[i].no == 1){ @>
							<i class="fas fa-user-graduate">
							<@}else if(json[i].no==2){@>
								<i class="fas fa-flask">
							<@}else if(json[i].no==3){@>
								<i class="fas fa-dollar-sign">
							<@}else if(json[i].no==4){@>
								<i class="fas fa-balance-scale">
							<@}else if(json[i].no==5){@>
								<i class="fas fa-music">
							<@}else if(json[i].no==6){@>
								<i class="fas fa-basketball-ball">
							<@}else if(json[i].no==7){@>
								<i class="fas fa-landmark">
							<@}else if(json[i].no==8){@>
								<i class="fas fa-book">
							<@}else if(json[i].no==9){@>
								<i class="fas fa-globe-asia">
							<@}else if(json[i].no==10){@>
								<i class="fas fa-tv">
							<@}else if(json[i].no==11){@>
								<i class="fas fa-gamepad">
							<@}else if(json[i].no==12){@>
								<i class="fab fa-android">
							<@}else if(json[i].no==13){@>
								<i class="fas fa-user">
							<@}else if(json[i].no==14){@>
								<i class="fas fa-dog">
							<@}else if(json[i].no==15){@>
								<i class="fas fa-syringe">
							<@}@>							

							</i><@= json[i].name @></label>
                        </div>
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
                </li>
			<@}@>
</script>
<script type="text/template" id="addquizItemTemp">
    			<@ console.log(json[0].name)
				   console.log(json[0].content)
				@>

			<@ for (var i = 0; i < 1; i++) {@>
				<li class="Itemli">
				<input type="hidden" value="<@=json[i].content@>">
                    <div class="coolTimePointWrap">
                        <div class="coolTimePoint"></div>
                    </div>
                        <div class="category">
                            <input type="radio" class="radio" id="quiz1" name="quiz" value=""/>
                            <label class="tremble" for="quiz1">
								
							<@if(json[i].no == 1){ @>
							<i class="fas fa-user-graduate">
							<@}else if(json[i].no==2){@>
								<i class="fas fa-flask">
							<@}else if(json[i].no==3){@>
								<i class="fas fa-dollar-sign">
							<@}else if(json[i].no==4){@>
								<i class="fas fa-balance-scale">
							<@}else if(json[i].no==5){@>
								<i class="fas fa-music">
							<@}else if(json[i].no==6){@>
								<i class="fas fa-basketball-ball">
							<@}else if(json[i].no==7){@>
								<i class="fas fa-landmark">
							<@}else if(json[i].no==8){@>
								<i class="fas fa-book">
							<@}else if(json[i].no==9){@>
								<i class="fas fa-globe-asia">
							<@}else if(json[i].no==10){@>
								<i class="fas fa-tv">
							<@}else if(json[i].no==11){@>
								<i class="fas fa-gamepad">
							<@}else if(json[i].no==12){@>
								<i class="fab fa-android">
							<@}else if(json[i].no==13){@>
								<i class="fas fa-user">
							<@}else if(json[i].no==14){@>
								<i class="fas fa-dog">
							<@}else if(json[i].no==15){@>
								<i class="fas fa-syringe">
							<@}@>

									</i><@= json[i].name @></label>
                        </div>
                        <div class="trash_can"><i class="fas fa-trash-alt"></i></div>
                </li>
			<@}@>
</script>
<script src="/js/jquery.js"></script>
<script src="/js/underscore-min.js"></script>
<script>
	_.templateSettings = {interpolate: /\<\@\=(.+?)\@\>/gim,evaluate: /\<\@([\s\S]+?)\@\>/gim,escape: /\<\@\-(.+?)\@\>/gim};
	let idx = 1;
	
    let $hitPoint = $("#hitPoint");
    let $coolTimePoint = $(".coolTimePoint");
    let hp = 100.0;
    let coolTime = 100.0;
    let $choice_label = $(".choice_label");
    let $answerRadio = $(".answer_choice .radio");
    let answerNum = 2;//나중에 db에서 정답보기 번호를 표현식으로 넣어줄 것
    let answerText = -1;
    let flag = true;
    let userAnswer = -1;
    let userAnswerText = 2;
    let $quiz_wrap = $(".quiz_wrap");
    
    
    
    
    
    $loader = $("#loader");
	$loaderBG = $("#loaderBG");
	
	$attackQuizListLi = $("#attackQuizList li");
    $quizDetail = $("#quizDetail");
    attackQiNo = 0;
	
    let quizAmount = 0;
    let gameNo = 0;
    let socket = null;
    
    
    
    
    
    
    
    

    /*정답 클릭 시 이벤트 - 정답보기/답 색깔 표시 및 추가적인 클릭 방지*/
    $quiz_wrap.on("click", ".answer_choice .radio" ,function () {
    	 flag = false;
         userAnswer = this.dataset.index;
         userAnswerText = $choice_label.eq(userAnswer).data("value");
         //answerText=  $choice_label.eq(answerNum).data("value");
         
         //$(".answer_choice li label").addClass("block");
         //console.log(answerText);
         /*정답표시 효과*/
         //if(answerNum==userAnswer){
         	//$(".choice_label").eq(answerNum).addClass("correct").addClass("correct_answer");
         	
         	
         	//console.log($(this).parents(".quiz_box").get(0));	
         	
         	quizAmount-=1;
         	console.log(quizAmount);
         	let choice = $(this).val();
         	//console.log(choice);
             let correct = this.dataset.value;
             //console.log(correct);
             //정답이 아니면 hp가 줄어듬
             if(choice!=correct) {
                 hp = hp-15;
                 
               //정답여부 보내기
                 let json = JSON.stringify({"cmd":4, "gameNo":gameNo, "acCheck":'F',
                	 					"logNo":$(this).attr("data-index")
      									});
      			socket.send(json);
             }else {
                 hp = hp+10;
                 if(hp > 100) hp=100;
                 
               //정답여부 보내기
                 let json = JSON.stringify({"cmd":4, "gameNo":gameNo, "acCheck":'T',
                	 					"logNo":$(this).attr("data-index")
      									});
      			socket.send(json);
             }//if else end
             $hitPoint.css("width", hp + "%");
             //console.log(hp);
         	
         	//clearInterval(game);
         	
         //}else{
         	//$(".choice_label").eq(userAnswer).addClass("wrong");
         	//$(".choice_label").eq(answerNum).addClass("correct_answer");
         //}//if else answer-correct end
         //console.log($(this).get(0));
         $(this).parents(".quiz_box").remove();
       
    });//answerClick end


    //hp줄어드는 함수
    hpDecrease();
    function hpDecrease() {
    	if(quizAmount>0) {
	        hp = hp - 0.1*quizAmount;
	        $hitPoint.css("width", hp + "%");
    	}
        // console.log(hp);
    }//hpDecrease end

    let game = setInterval(function () {
        hpDecrease();

        if(hp <= 0) {
            clearInterval(survivalTimeEvent);
        	
        	//죽었으면 서버로 보내줌
        	let json = JSON.stringify({"cmd":6, "gameNo":gameNo,
                	 					"gameUser":{"userNo":${loginUser.no}, "survivalTime":survivalTime, "gameNo":gameNo }
      									});
      		socket.send(json);
        	
        	
        	
        	
        	//alert("넌 이미 죽어있다.");
        	$(".game_over").fadeIn(2000);
            clearInterval(game);
            setTimeout( function(){
            	location.href = "/result/game/"+gameNo+"/user/${loginUser.no}";	
            },5000)//setTimeout end
            
        }
        
    },100);
	

////*****************************************************************************************/////

    let $radio = $("#attackQuizList .radio");
    let $enemy = $(".enemy");
    let $moveTypeBtn = $("#moveTypeBtn");
    let $trashCan = $(".trash_can");

    let coolTimes = [100,100,100,100,100,100];



    let $nowClickRadionBtn = null;


    $radio.click(function () {
        $nowClickRadionBtn = $(this);
    	attackQiNo = $nowClickRadionBtn.val();
        //alert("test");
    });


    $enemy.click(function () {
       if($nowClickRadionBtn) {
    	   
         	//alert("yesyesyes");
            //console.log("testw");

            const $li = $nowClickRadionBtn.parents("li");
            let idx = $li.index();
            
            $li.attr("data-text","");
    		$li.find(".tremble").text("");
    		$li.find(".radio").val("");

            let $wrap =  $li.find(".coolTimePointWrap");

           $wrap.show();

           $nowClickRadionBtn.prop("checked",false);

           let AttackCoolTime = setInterval(function () {
               quizCoolTime(idx);

               if(coolTimes[idx] <= 0) {
                   clearInterval(AttackCoolTime);
                   coolTimes[idx] = 100;
                   $wrap.hide();
                   
                   //쿨타임 끝났으면 문제 하나 받아오기
                   let json = JSON.stringify({"cmd":2, "gameNo":gameNo, "li":$("#attackQuizList li").index($li),
        						       		"user":{ "no": ${loginUser.no} },
        									});
        			socket.send(json);
               }
           },100);

           $nowClickRadionBtn = null;
           
           
           
           
           //공격을 웹소켓으로 넘기기
           let json = JSON.stringify({"cmd":3, "gameNo":gameNo,
						       		"user":{ "no": ${loginUser.no}, "receiveUserNo":$(this).attr("data-no") },
           							"quizInfo" : { "no":attackQiNo }
									});
			socket.send(json);
           

       } else {
           //alert("쿨타임작동x");
       }
    });




    let $nowClicktrashCan = null;
    
    
    //쓰레기통 클릭시
    $trashCan.on("click",function () {
    	attackQiNo = $(this).parent().find(".radio").val();
    	console.log("qiNo : "+attackQiNo);
    	//문제 버린 플레이로그 보내기
        let json = JSON.stringify({"cmd":3, "gameNo":gameNo,
						       		"user":{ "no": ${loginUser.no} },
           							"quizInfo" : { "no":attackQiNo }
									});
		socket.send(json);
    	
    	
    	
        $radio.prop("checked",false);

        //alert("test");
        const $li = $(this).parents("li");
        let idx = $li.index();

        //console.log(idx);
		$li.attr("data-text","");
		$li.find(".tremble").text("");
		$li.find(".radio").val("");

        let $wrap =  $li.find(".coolTimePointWrap");

        $wrap.show();
        $radio.prop("checked",false);

        let AttackCoolTime = setInterval(function () {
            quizCoolTime(idx);

            if(coolTimes[idx] <= 0) {
                clearInterval(AttackCoolTime);
                coolTimes[idx] = 100;
                $wrap.hide();
                //location.href = "result.html";
                
                //쿨타임 끝났으면 문제 하나 받아오기
                let json = JSON.stringify({"cmd":2, "gameNo":gameNo, "li":$("#attackQuizList li").index($li),
     						       		"user":{ "no": ${loginUser.no} }
     									});
     			socket.send(json);
                
            }
        },100);

        $trashCan = null;
    });
    
    
    //공격시 문제 쿨타임
    function quizCoolTime(idx) {
        //console.log(coolTimes[idx]);
        coolTimes[idx] = coolTimes[idx] - 1;
        $coolTimePoint.eq(idx).css("height", coolTimes[idx] + "%");
    }//hpDecrease end


    /*
    attackUser();
    function attackUser() {
        if ($radio.is(":checked")){
            if ($enemy.click()) {
                alert("test");
            }else {

            }
        }else {

        }
    }//tremble on click end
*/

    let cnt = 0;
    $moveTypeBtn.on("click", function () {

        if (cnt%2==0){
            $moveTypeBtn.html("<i class=\"fas fa-caret-right\"></i>").css("font-size","28px");
        }else {
            $moveTypeBtn.html("<i class=\"fas fa-fast-forward\"></i>").css("font-size","18px");
        }
        cnt += 1;
        //alert(cnt);
    });
    
    
    /**************************************언더스코어 quizWrap템플릿*********************************************/
	let quizWrapTmp = _.template($("#quizWrapTmp").html());
    let quiz=0;
    
    function getQuiz(){
    	
    	$.ajax({
    		url:"/ajax/quizRandomOne.json",
    		type:"get",
    		dataType:"json",
    		error:function(){
    			alert("서버 점검중");
    		},
    		success:function(json){
    			quiz=json;
    			//console.log(json);
    			quizNo=quiz.no;
    			quizCrNo=quiz.crNo;
 
    			let categoryNum=quiz.category;
    			
    			$quiz_wrap.append(quizWrapTmp);
    				
    			let recall = setTimeout(function (){
    				getQuiz();
    			},3000);
//0606 체력바 소진시 문제 더이상 출제되지 않음 + 사망 팝업
    			if(hp<=0){
    				$(".game_over").fadeIn(1500);
	            	clearInterval(recall);
	            	$hitPoint.css("display","none");
	            	$(".quiz_box").css("display","none");
	            }//if else end
    			//로더 하이드는 이곳에서...
    		}//success end
    	})//ajax end
    	
    }//fn quizWrap end
    
    //getQuiz(); //최초 1회 실행
    
 // quiz Item ajax.// 퀴즈 아이템 카테고리와 목록 얻어오기
 /*
    let quizItem = _.template($("#quizItemTemp").html());
    function getQuizItem(){
    	$.ajax({
    		url:"/ajax/quizItem.json",
    		type:"GET",
    		dataType:"json",
    		error:function(){
    			alert("quizItem <서버 점검>");
    		},
    		success:function(json){
    			console.log(json);
    			//console.log(json[0].name)
    			
    			$("#attackQuizList").html(quizItem({json:json}));
    			
    			
    		}
    	})
    	
    }
    */
    $("#attackQuizList").on("mouseover",".Itemli",function () {
		console.log($(this).find("input").val());
		
		$("#quizDetail").text($(this).find("input").val());
		console.log($(this).index())
		
	});
        
    //getQuizItem();
    
    
    //let ItemCoolTime = [100,100,100,100,100,100];
    // 쓰레기통 클릭 시 Item 삭제 후 새로운 Item 생성
    /*
    let addquizItem = _.template($("#addquizItemTemp").html());
    function addQuizItem(){
    $("#attackQuizList").on("click",".trash_can",function(){
    	var i = $(this).parent().index();
    	$(this).parents(".Itemli").remove();
    	let randomDigit = Math.floor((Math.random()*7000)+1000);
    	 //alert(i);
    	 
    	    	$.ajax({
    	    		url:"/ajax/quizItem.json",
    	    		type:"GET",
    	    		dataType:"json",
    	    		error:function(){
    	    			alert("quizItem <서버 점검>");
    	    		},
    	    		success:function(json){
    	    			console.log(json);
    	    			//console.log(json[0].name)
    	    			
    	    			//$("#attackQuizList").append(addquizItem({json:json}));
    	    			$("#attackQuizListWrap #attackQuizList").children().eq(i-1).after(addquizItem({json:json}))
    	    			//alert(i);
    	    			
    	    			let $wrap =  $("#attackQuizListWrap #attackQuizList").children().eq(i).after().find(".coolTimePointWrap");

    	    	           $wrap.show();

    	    	          //  setInterval(function () {
    	    	                  	    	               
    	    	               $wrap.fadeOut(randomDigit);
    	    	         //  },1000);
    	    			
    	    		}
    	    	})

    })
    
    
    }
    addQuizItem();
	*/
    
    ///////////////////////////동호//////////////////////////////////////
    
	
    //웹소켓
    function gameStart() {
    	//socket = new WebSocket("ws://172.30.1.254/webSocket/game");
    	socket = new WebSocket("ws://localhost:8082/webSocket/game");
    	socket.onopen = function(){
        	//자신의 userNo, nickname, profileImage을 서버로 넘겨야 함
        	//json을 문자열로 바꿔줌
        	console.log("열렸음");
        	let json = JSON.stringify({"cmd":1,
						        		"user":{"no":${loginUser.no}, 
							        			"nickname":"${loginUser.nickname}", 
							        			"profileImage":"${loginUser.profileImage}", 
							        			"tier":1
							        			}
        								});
        	socket.send(json);
        	
        	console.log("유저정보 보냄 - gameStart()");
        	console.log(json);
        };//socket.onopen end
        
        socket.onclose = function(){
        	console.log("닫혔음");
        	let json = JSON.stringify({"cmd":6,"user":{"no":${loginUser.no}}});
        	$(".game_over").fadeOut(3000);
        	setTimeout(function(){
        		alert("쥬금");
        		//location.href="/result";
        	},3000);
        };//socket.onclose end
        
        socket.onmessage = function(e){
        	//console.log(e.data);
        	let json = JSON.parse(e.data);//문자열을 json객체로 파싱
        	switch (json.cmd) {
        	case 1: //gameStart, 유저받기
        		console.log("1넘어옴");
        		$loaderBG.hide();
        		$loader.hide();
        		
        		gameNo = json.gameNo;
        		
        		let index = 1;
        		//유저 받아서 넣기
				_.each(json.users,function(user) {
					if(user.no!=${loginUser.no}){
						if(index==1) { //왼쪽에 유저 넣기
							$("#leftEnemy").attr("data-no",user.no);
							$("#leftEnemy img").attr("src","/profileImage/"+user.profileImage);
				            $("#leftEnemyNickName").text(user.nickname);
							index++;
						}else { //오른쪽에 유저 넣기
							$("#rightEnemy").attr("data-no",user.no);
							$("#rightEnemy img").attr("src","/profileImage/"+user.profileImage);
				            $("#rightEnemyNickName").text(user.nickname);
						}//if~else end
					}//if end
        		});//each end
        		
        		//문제 6개 넣기
        		let i = 1;
        		_.each(json.quizs, function(quiz) {
        			console.log(quiz);
        			$("#quiz"+i).attr("data-text",quiz.content);
        			$("#quiz"+i+" .radio").val(quiz.no);
        			$("#quiz"+i+" .tremble").html(getCategory(quiz.category));
        			i++;
        		})//each end
        		break;
        	case 2: //문제 하나 넣기
        		console.log("2넘어옴");
        		console.log(json);
        		$("#quiz"+(json.li+1)).attr("data-text",json.quizInfo.content);
    			$("#quiz"+(json.li+1)+" .radio").val(json.quizInfo.no);
    			$("#quiz"+(json.li+1)+" .tremble").html(getCategory(json.quizInfo.category));
        		break;
        	case 3: //공격 받음
        		console.log("3넘어옴");
        		quizAmount++;
        		console.log(quizAmount);
        		$quiz_wrap.append(quizWrapTmp({quiz:json.quizInfo, log:json.logNo}));
        		break;
        	case 4: //hp 받음
        		console.log("4넘어옴");
        		break;
			case 5: //다른유저가 죽거나 게임이 끝남
				console.log("5넘어옴");
				console.log("userNo : "+json.gameUser.userNo);
				if(json.gameUser.no>0) { //한명의 유저가 죽음
					_.each($(".enemy"), function(enemy) {
						if($(enemy).attr("data-no")==json.gameUser.userNo) {
							$(enemy).hide();
						}//if end
					})//each end
				}else { //승리(다른 유저들이 모두 죽음)
					clearInterval(survivalTimeEvent);
		        	//죽었으면 서버로 메세지 전송
		        	let json = JSON.stringify({"cmd":6, "gameNo":gameNo,
		                	 					"gameUser":{"userNo":${loginUser.no}, "survivalTime":survivalTime, "gameNo":gameNo }
		      									});
		      		socket.send(json);
		      		location.href = "/result/game/"+gameNo+"/user/${loginUser.no}";
				}
        		break;
			case 6:
				console.log("6넘어옴");
				break;
        	}//switch end
        };//socket.onmessage end
	}//gameStart() end
    gameStart();
    
    let survivalTime = 0;
	let survivalTimeEvent = setInterval(function(){
		survivalTime++;
	},1000);
	
	
	
    //퀴즈아이템에 마우스오버 시
    $attackQuizListLi.on("mouseover",function(){
    	$quizDetail.text($(this).attr("data-text"));
    })//$atackQuizListLi mouseover end
    
    //카테고리 번호로 i요소와 이름을 같이 가져옴
    function getCategory(i) {
		if (i==1) {
			return '<i class="fas fa-user-graduate"></i> 일반상식';
		}else if(i==2) {
			return '<i class="fas fa-flask"></i> 과학';
		}else if(i==3) {
	    	return '<i class="fas fa-dollar-sign"></i> 경제';
		}else if(i==4) {
	    	return '<i class="fas fa-balance-scale"></i> 법률';
		}else if(i==5) {
			return '<i class="fas fa-music"></i> 예술';
		}else if(i==6) {
			return '<i class="fas fa-basketball-ball"></i> 스포츠';
		}else if(i==7) {
			return '<i class="fas fa-landmark"></i> 역사';
		}else if(i==8) {
			return '<i class="fas fa-book"></i> 인문';
		}else if(i==9) {
			return'<i class="fas fa-globe-asia"></i> 지리';
		}else if(i==10) {
			return '<i class="fas fa-tv"></i> TV/영화/만화';
		}else if(i==11) {
			return '<i class="fas fa-gamepad"></i> 게임';
		}else if(i==12) {
			return '<i class="fab fa-android"></i> IT';
		}else if(i==13) {
			return '<i class="fas fa-user"></i> 인물';
		}else if(i==14) {
			return '<i class="fas fa-dog"></i> 생물';
		}else {
			return '<i class="fas fa-syringe"></i> 의학';
		}//if~else end
	}//getCategory(i) end
    
</script>
</body>
</html>