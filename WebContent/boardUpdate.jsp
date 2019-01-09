<%@page import="kmong.KmongDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="dto" class="kmong.KmongDTO"/> 
<jsp:setProperty property="*" name="dto"/>

	<%
 		KmongDAO dao=new KmongDAO();
  		dao.update(dto);
	%>
	<div align="center">
	<font size="3">게시글이 다음과 같이 수정되었습니다.</font>
	<hr>
	<table border="1">
		<tr align="center">
		<td bgcolor="white" width="100">항목</td>
		<td bgcolor="green" width="300">내용</td>
	</tr>
		 <tr align="center">
		<td bgcolor="white" width="100">이메일</td>
		<td bgcolor="green" width="300"><%=dto.getEmail()%></td>
	</tr>
		<tr align="center">
		<td bgcolor="white" width="100">제목</td>
		<td bgcolor="green" width="300"><%=dto.getTitle() %></td>
	</tr>
		<tr align="center">
		<td bgcolor="white" width="100">패스워드</td>
		<td bgcolor="green" width="300"><%=dto.getPw() %></td>
	</tr>
		<tr align="center">
		<td bgcolor="white" width="100">내용</td>
		<td bgcolor="green" width="300"><%=dto.getContent() %></td>
	</tr>
	
	</table>
	</div>
</body>
</html>