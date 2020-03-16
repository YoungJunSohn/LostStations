<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Lost Stations</title>
    <%@include file="/WEB-INF/template/link.jsp" %>
    <link rel="stylesheet" href="/css/result.css"/>
</head>
<body>
<c:import url="/WEB-INF/template/header.jsp"/> 
    <!--  여기서 작업하세요 젭알 >  < 희희 -->
    <div id="resultWrap">
        <h2 class="screen_out">배경화면</h2>
        <div id="bg"></div>
        <h2 class="screen_out">승패 결과</h2>
        <div id="result">
            <span id="grade">1등</span> 스마일 쿠키먹으러 가실분~?
        </div> <!--//result-->

        <h2 class="screen_out">플레이 결과</h2>
        <div id="playResult">
            <button id="mainBtn">
                <a href="/main">메인으로!</a>
            </button>
            <ul id="playResultList">
                <li>
                    <div class="result_title">맞춘 문제 수</div>
                    <div class="result_value">12</div>
                </li>
                <li>
                    <div class="result_title">틀린 문제 수</div>
                    <div class="result_value">5</div>
                </li>
                <li>
                    <div class="result_title">버린 문제 수</div>
                    <div class="result_value">3</div>
                </li>
                <li>
                    <div class="result_title">생존 시간</div>
                    <div class="result_value">5분</div>
                </li>
                <li>
                    <div class="result_title">공격 성공률</div>
                    <div class="result_value">70%</div>
                </li>
                <li>
                    <div class="result_title">카테고리별 정답률</div>
                    <div id="chart"><canvas id="bar" height="120"></canvas></div>
                </li>
            </ul>
        </div><!--//playResult-->
        <div id="explanation">
            <h2 id="explanationTitle">Explanations</h2>
            <ul>
                <li>
                    <div class="list_box">
                        <div class="explanation_paragraph">Q.<p>우리나라 최초의 세계지도는?</p></div>
                        <div class="explanation_paragraph explain">A. <p>1402년에 이회 등이 만든 혼일강리역대국도지도는 중국 및 아라비아로부터 전해진 지식을 바탕으로 한 것인데, 동양 최초의 세계 지도로 알려져 있다. 현재 이 지도의 사본이 일본에 남아 있다.</p></div>
                    </div>
                </li>
                <li>
                    <div class="list_box">
                        <div class="explanation_paragraph">Q. <p>세계에서 가장 높은 건물은 무엇일까요?</p></div>
                        <div class="explanation_paragraph explain">A. <p>부르즈 할리파는 828m로 세계에서 가장 높은 빌딩입니다. 스카이트리는 634m, 핑안 국제 금융센터는 600m, 롯데 월드 타워는 555m입니다.</p></div>
                    </div>
                </li>
            </ul>
        </div><!--//explanation-->
    </div><!--//resultWrap-->
</main>
<c:import url="/WEB-INF/template/footer.jsp"/> 

<script src="/js/jquery.js"></script>
<script src="/js/template.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
    let $bar = $("#bar");

    let barData = {
        labels: ["일반상식", "과학", "경제", "법률", "예술",
            "스포츠", "역사", "인문", "지리", "TV/영화/만화",
            "게임", "IT", "인물", "생물", "의학"], //x축
        datasets: [{ //데이터 오브젝트 배열
            label: '맞춘 문제 수',
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
            data: [16, 7, 12, 6, 8,
                12, 2, 1, 5, 4,
                13, 5, 13, 6, 4,
            ] //f(x)
        }]
    };
    let barChartDataArr = barData.datasets[0].data; //데이터 배열
    let barChartYMax = Math.max.apply(null, barChartDataArr) + 1; //가장 큰 데이터 값에 1을 더해서 max 값 조정
    let barOptions = {
        title: {
            display: true,
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
                barThickness: 50,// bar 두께 조정 (50 - 각 x축의 넓이의 50% 크기 )
            }]
        }
    }
    //차트 선언
    let barChart = new Chart($bar, {
        type: 'bar',
        data: barData,
        options: barOptions
    });//barChart end
</script>
</body>
</html>