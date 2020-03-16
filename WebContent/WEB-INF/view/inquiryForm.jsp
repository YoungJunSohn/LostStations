<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 ${inquiry.no==null? "작성":"수정" } 페이지</title>
<c:import url="/WEB-INF/template/link.jsp"></c:import>
<link rel="canonical" href="https://quilljs.com/standalone/full/">
<link type="application/atom+xml" rel="alternate"
	href="https://quilljs.com/feed.xml"
	title="Quill - Your powerful rich text editor" />

<link rel="stylesheet" href="/css/quill.snow.css" />
<link rel="stylesheet" href="/css/inquiryForm.css" />

<style>

.ql-editor.ql-blank::before {
	font-style: normal;
}

</style>
<%--cssss --%>
</head>
<body>
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<%--main contents 작성란 --%>
	

	<h1>
		 Q & A
	</h1>
	<form id="inquiryWriteForm" action="/inquiry" method="post">

		<c:if test="${inquiry!=null }">
			<input type="hidden" name="_method" value="PUT" />
			<input type="hidden" name="no" id="no" value="${inquiry.no }"/>
		</c:if>

	<h3 class="screen_out">문의사항 제목</h3>
	<div class="inquiry_title inquiries">제 목</div>
	<input class="inquiry_title_input" type="text" placeholder="제목을 입력해주세요"
		name="title" value="${inquiry.title}" />
	<%--//inquiryTitle --%>

	<%-- 문의사항 내용 --%>
	<input type="hidden"  name="content" id="contentText" value="테스트중입니다."/>
	<%-- 유저번호 가져오기 --%>
	<input type="hidden" name="userNo" id="userNo" value="${loginUser.no }"/>

	<h3 class="screen_out">문의사항 내용</h3>
	<div class="editor">
		<div class="standalone_container">
			<div class="toolbar_container">
				<span class="ql-formats"> <select class="ql-font"></select> <select
					class="ql-size"></select>
				</span> <span class="ql-formats">
					<button class="ql-bold"></button>
					<button class="ql-italic"></button>
					<button class="ql-underline"></button>
					<button class="ql-strike"></button>
				</span> <span class="ql-formats"> <select class="ql-color"></select>
					<select class="ql-background"></select>
				</span> <span class="ql-formats">
					<button class="ql-blockquote"></button>
					<button class="ql-code-block"></button>
				</span> <span class="ql-formats">
					<button class="ql-list" value="ordered"></button>
					<button class="ql-list" value="bullet"></button>
				</span> <span class="ql-formats">
					<button class="ql-direction" value="rtl"></button> <select
					class="ql-align"></select>
				</span> <span class="ql-formats">
					<button class="ql-link"></button>
					<button class="ql-image"></button>
					<button class="ql-video"></button>
				</span>
			</div>
			<div class="editor_container">${inquiry.content}</div>
		</div>
		<%--//standalone --%>
	</div>
	<%-- //editor --%>
	<!--//inquiryContents-->


	<%--a 요소 클릭시 inquiryList 페이지로 --%>
	<div class="button_position">

		<a class="noneA submitBtn" href="${header.referer}">취소</a>

		<button class="submitBtn" type="submit">
			${inquiry==null?"등록":"수정"}</button>
	</div>


	</form>
	<%-- inquiryForm --%>

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>

	<script src="/js/jquery.js"></script>
	<script src="/js/quill.min.js"></script>
	<script>
		var quill = new Quill('.editor_container', {
			modules : {
				toolbar : '.toolbar_container'
			},
			placeholder : '문의사항을 입력해주세요(관련된 사진을 첨부하시면 더욱 정확한 정보를 얻으실 수 있습니다!)',
			theme : 'snow'
		});
	
	let contents = null

	let contentText = null

	
	
	let $form = $('#inquiryWriteForm');
		
	//console.log($form);
	
		$form.on("submit",function(e){
			//contents = quill.getContents();

			//content = JSON.stringify(contents);
			let html = $(".ql-editor").html();
			
			//console.log("내가 작성한 텍스트의 제이슨 형태 : "+content);
			console.log(html);
			
			//js에서 form에 접근하는 방법!
			$("#contentText").val(html);
			
			console.log($("#contentText").val());
			
			return true;
			
		});//form submit() end
	
	
	
	</script>
</body>
</html>


















