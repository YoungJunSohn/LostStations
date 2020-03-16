let $window = $(window);
let $news = $("#news");//news요소객체
let $body = $("body");
let $fa_bell = $(".fa-bell");
let $gnb = $("#gnb");
let $gnbChildrenA = $("#gnb>ul>li>a");
let $gnbBorderEffect = $("#gnbBorderEffect");
let $rankingMenu = $("#rankingMenu");
let $gameInfoMenu = $("#gameInfoMenu");

$gnb.mouseenter(function () {
    $body.addClass("on");
});

$gnb.mouseleave(function () {
    $body.removeClass("on");
});

$rankingMenu.mouseenter(function () {
    $("#gnb .on").removeClass("on");
    $("#gnb li:eq(1)").addClass("on");
    $gnbBorderEffect.show(0).css({
        width:50+"px",
        left:154
    });
});

$gameInfoMenu.mouseenter(function () {
    $("#gnb .on").removeClass("on");
    $("#gnb li:eq(2)").addClass("on");
    $gnbBorderEffect.show(0).css({
        width:100+"px",
        left:250
    });
});

$gnbChildrenA.mouseenter(function (e) {
    $("#gnb .on").removeClass("on");
    let $target = $(e.target);
    //console.log(target);
    if($target.is(".quiz_link")) {
        $("#gnb li:first").addClass("on");
        $gnbBorderEffect.show(0).css({
            width:100+"px",
            left:12
        })
    }else if($target.is(".ranking_link")) {
        $("#gnb li:eq(1)").addClass("on");
        $gnbBorderEffect.show(0).css({
            width:50+"px",
            left:154
        })
    }else if($target.is(".game_info_link")) {
        $("#gnb li:eq(2)").addClass("on");
        $gnbBorderEffect.show(0).css({
            width:100+"px",
            left:250
        })
    }
})

$gnb.mouseleave(function () {
    $gnbBorderEffect.hide(0);
    $("#gnb .on").removeClass("on");
});


$fa_bell.on("click", function () {
    $body.toggleClass("show");
    return false;
    //alert("test");
});//on()click end

$window.click(function (e) {
    if ($body.hasClass("show")) {
        //console.log("show");
        //e.target - 이벤트가 발생한 장소
        //has(e.target).length==0 - 안가지고 있다.
        if ($news.has(e.target).length == 0) {
            //console.log("news를 클릭한게 아님");
            $body.removeClass("show");
        } else {
            //console.log("뉴스를 클릭한 것");
        }

    } else {
        //console.log("show 아님");
    }
});