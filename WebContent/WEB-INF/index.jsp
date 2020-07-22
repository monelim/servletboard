<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--
<%@ page import="com.mh.org.freeboard.FreeBoardDTO"%>
<%@ page import="java.util.List"%>
-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../resources/cssjs/head.jsp"%> <!-- 부트스트랩/제이쿼리 참조내용이 적혀 있는 jsp 파일을 포함하게 하는 상대경로 -->

	<style type="text/css">
		.dto:hover{
			background-color: lightgreen;
			cursor: pointer;
		}	
	</style>
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		// 수정
		$(".dto").on("click", function(){
// 			alert($(this).find("td").eq(0).text());
			var idx = $(this).find("input").val();
//	 		alert(idx);
			window.location = "update.ws?idx=" + idx;
		});
		
		// 행 클릭시
		$(".td_ck").on("click", function(e){
//			e.preventDefault();	 checkbox 는 기본 이벤트, 부모와 자신의 속성(이벤트) 모두 적용시키지 않기 !
			e.stopPropagation(); // 부모 태그의 속성(이벤트)은 적용하지 않고 ! 해당 속성(이벤트)만 적용시키기
			$(this).find("input").attr("checked", true);
		});
		
		// 글쓰기
		$("#insert").on("click", function(){
			window.location = "insert.ws";
			//alert("jqeury 함수 실행");
		});
		
		// 삭제
		$("#delete").on("click", function(e){
			$('#frm').submit();
		})
	});
	</script>
</head>

<body>
	<div class="container"> <!-- 100% 먹음 -->
		<div class="row" style="height : 430px">
			<form action="delete.ws" id="frm">
				<table class="table">
					<tr>
						<th></th>
						<th>순번</th>
						<th>제목</th>
						<th>내용</th>
						<th>작성일자</th>
						<th>수정일자</th>
					</tr>
					
					<c:forEach items="${list}" var="dto">
						<tr class="dto"> <!-- class가 아닌 id로 설정할 경우 중복이 안되어 jquery에서 설정한 효과가 하나만 먹히게 된다. -->
							<td class="td_ck"><input type="checkbox" name="idx" value="${dto.idx}"/></td>
							<td>${dto.idx}</td>					
							<td>${dto.title}</td>
							<td>${dto.content}</td>
							<td>${dto.reg_date}</td>
							<td>${dto.mod_date}</td>
						</tr>
					</c:forEach>
				</table>
			</form>			
		</div>
		
		<!-- (2) 페이징 처리를 위한 파라메터 값 설정 -> (3) controller의 index.ws에서 전체 행 분할하여 페이지 수 설정하기 -->
		<div class="row" style="text-align : center">
		<c:forEach begin="1" end="${pagecount}" var="i">
			<a href="index.ws?page=${i}">[ ${i} ]</a>
		</c:forEach>
		</div>
	
		<div class="row">		
			<button type="button" id="insert" class="btn-primary">글쓰기</button> <!-- btn은 버튼 형식, info는 버튼 색상 지정하는 부트스트랩 -->
			<button id="delete" class="btn-primary">삭제</button>
		</div>
		
	</div>

</body>
</html>