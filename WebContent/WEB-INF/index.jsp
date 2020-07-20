<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.mh.org.freeboard.FreeBoardDTO"%>
<%@ page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../resources/cssjs/head.jsp"%>
</head>
<body>

	<div class="container">
		<!-- 100% 먹음 -->
		<table class="table">
			<tr>
				<th>순번</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>수정일자</th>
			</tr>

			<%
			// jstl 태그, servlet Controller
				// 				List<FreeBoardDTO> list = (List<FreeBoardDTO>) request.getAttribute("list");
				// 				for(FreeBoardDTO dto : list) {
				// 					out.println("<td<" + dto.getIdx() + "</td>");
				// 					out.println("<td<" + dto.getTitle() + "</td>");
				// 					out.println("<td<" + dto.getContent() + "</td>");
				// 					out.println("<td<" + dto.getReg_date() + "</td>");
				// 					out.println("<td<" + dto.getMod_date() + "</td>");
				// 					out.println("</tr>");
				// 				}
			%>

			<c:forEach items="${list}" var="dto">
				<!-- jstl소스 -->
				<tr>
					<td>${dto.idx}</td>
					<td>${dto.title}</td>
					<td>${dto.content}</td>
					<td>${dto.reg_date}</td>
					<td>${dto.mod_date}</td>
				</tr>
			</c:forEach>

			<!-- 		<tr> 
				<th>11</th>
				<th>22</th>
				<th>333</th>
				<th>2020</th>
				<th>2020</th>
			</tr>  -->
		</table>
	</div>

</body>
</html>