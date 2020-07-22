<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../resources/cssjs/head.jsp" %>

<script type="text/javascript">
$(document).ready(function(){	
	$("#insert").on("click", function(){
		window.location = "index.ws";
		//alert("jqeury 함수 실행"); // 해당 게시물 클릭시 팝업창 띄워보는 확인용
	});
});
</script>
</head>

<body>	
	<div class="container">
		<h1>글쓰기</h1>
		<div class="row" style="height : 500px;">
		
			<form action="insertproc.ws">
				<table class="table">
					<tr>
						<th>제목</th>
						<td><input class="form-control" type="text" name="title"/></td>
					</tr>
					<tr>
						<th colspan="2">내용</th>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" class="form-control"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align : center;">
							<input class="btn-info" type="submit" value="저장"/>
							<input class="btn-info" type="submit" value="취소"/>
					</tr>
				</table>
			</form>
		</div>
			
		<div class="row">		
			<button id="index" class="btn-info">목록보기</button>
		</div>
		
	</div>
</body>
</html>