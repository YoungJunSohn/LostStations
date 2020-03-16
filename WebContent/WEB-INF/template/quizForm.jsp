<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="bgPopup">
        <form id="quizRegisterForm" action="/quiz" method="post">
        <input type="hidden" name="userNo" value="${loginUser.no }"/>
            <h3 class="screen_out">문제 카테고리 선택</h3>
            <div id="categorySelectWrap">
                <input type="radio" class="radio" id="category1" name="category" value="1">
                <label class="label category" for="category1"><i class="fas fa-user-graduate"></i> 일반상식</label>
                <input type="radio" class="radio" id="category2" name="category" value="2">
                <label class="label category" for="category2"><i class="fas fa-flask"></i> 과학</label>
                <input type="radio" class="radio" id="category3" name="category" value="3">
                <label class="label category" for="category3"><i class="fas fa-dollar-sign"></i> 경제</label>
                <input type="radio" class="radio" id="category4" name="category" value="4">
                <label class="label category" for="category4"><i class="fas fa-balance-scale"></i> 법률</label>
                <input type="radio" class="radio" id="category5" name="category" value="5">
                <label class="label category" for="category5"><i class="fas fa-music"></i> 예술</label>
                <input type="radio" class="radio" id="category6" name="category" value="6">
                <label class="label category" for="category6"><i class="fas fa-basketball-ball"></i> 스포츠</label>
                <input type="radio" class="radio" id="category7" name="category" value="7">
                <label class="label category" for="category7"><i class="fas fa-landmark"></i> 역사</label>
                <input type="radio" class="radio" id="category8" name="category" value="8">
                <label class="label category" for="category8"><i class="fas fa-book"></i> 인문</label>
                <input type="radio" class="radio" id="category9" name="category" value="9">
                <label class="label category" for="category9"><i class="fas fa-globe-asia"></i> 지리</label>
                <input type="radio" class="radio" id="category10" name="category" value="10">
                <label class="label category" for="category10"><i class="fas fa-tv"></i> TV/영화/만화</label>
                <input type="radio" class="radio" id="category11" name="category" value="11">
                <label class="label category" for="category11"><i class="fas fa-gamepad"></i> 게임</label>
                <input type="radio" class="radio" id="category12" name="category" value="12">
                <label class="label category" for="category12"><i class="fab fa-android"></i> IT</label>
                <input type="radio" class="radio" id="category13" name="category" value="13">
                <label class="label category" for="category13"><i class="fas fa-user"></i> 인물</label>
                <input type="radio" class="radio" id="category14" name="category" value="14">
                <label class="label category" for="category14"><i class="fas fa-dog"></i> 생물</label>
                <input type="radio" class="radio" id="category15" name="category" value="15">
                <label class="label category" for="category15"><i class="fas fa-syringe"></i> 의학</label>
            </div><!--//categorySelectWrap-->
            <h3 class="screen_out">문제 유형 선택</h3>
            <div id="quizTypeSelectWrap">
                <input type="radio" checked class="radio" id="quizType1" name="type" value="OX">
                <label class="label quiz_type" for="quizType1">OX</label>
                <input type="radio" class="radio" id="quizType2" name="type" value="MC">
                <label class="label quiz_type" for="quizType2">사지선다</label>
                <div id="notice">문제 유형 변경 시 체크한 정답은 초기화 됩니다.</div>
            </div><!--//quizTypeToggle-->
            <div id="quizWriteForm">
                <textarea id="quizContents" name="content" placeholder="문제를 작성해주세요."></textarea>
                <div id="quizContentsSizeWrap"><span id="quizContentsSize">0</span>/150</div>
                <div id="answerChoiceOX">
                    <input type="radio" class="radio" id="choiceO" name="chNo" value="0">
                    <label class="label choice" for="choiceO">O</label>
                    <input type="radio" class="radio" id="choiceX" name="chNo" value="-1">
                    <label class="label choice" for="choiceX">X</label>
                </div>
                <div id="answerChoiceFourThings">
                    <div id="choice1Wrap" class="four_choice">
                        <input type="radio" class="radio" id="choice1" name="chNo" value="1">
                        <label class="label" for="choice1"><i class="fas fa-check"></i></label>
                        <input type="text" id="choice1Contents" name="choice1" placeholder="보기를 작성해주세요."/>
                    </div>
                    <div id="choice2Wrap" class="four_choice">
                        <input type="radio" class="radio" id="choice2" name="chNo" value="2">
                        <label class="label" for="choice2"><i class="fas fa-check"></i></label>
                        <input type="text" id="choice2Contents" name="choice2" placeholder="보기를 작성해주세요."/>
                    </div>
                    <div id="choice3Wrap" class="four_choice">
                        <input type="radio" class="radio" id="choice3" name="chNo" value="3">
                        <label class="label" for="choice3"><i class="fas fa-check"></i></label>
                        <input type="text" id="choice3Contents" name="choice3" placeholder="보기를 작성해주세요."/>
                    </div>
                    <div id="choice4Wrap" class="four_choice">
                        <input type="radio" class="radio" id="choice4" name="chNo" value="4">
                        <label class="label" for="choice4"><i class="fas fa-check"></i></label>
                        <input type="text" id="choice4Contents" name="choice4" placeholder="보기를 작성해주세요."/>
                    </div>
                </div><!--//answerChoiceFourThings-->
            </div><!--//quizWriteForm-->
            <div id="commentaryBox">
                <div id="commentaryTitle">해설</div>
                <textarea id="commentary" name="exp" placeholder="해설을 작성해주세요."></textarea>
                <div id="quizCommentarySizeWrap"><span id="quizCommentarySize">0</span>/300</div>
            </div><!--//commentary-->
            <button id="cancelBtn" type="reset" class="btn">취소</button>
            <button id="quizRegisterBtn" class="btn" type="submit">등록</button>
            <div id="writeMsg" class="msg"></div>
        </form><!--//quizRegisterForm-->
    </div><!--//bgPopup-->

