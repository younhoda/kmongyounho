<%@page import="kmong.KmongDTO"%>
<%@page import="kmong.KmongDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="skyblue">
<%
String email=request.getParameter("email");
String title=request.getParameter("title");
String pw=request.getParameter("pw");
String content=request.getParameter("content");

KmongDAO dao=new KmongDAO();
KmongDTO dto=new KmongDTO();

dto.setEmail(email);
dto.setTitle(title);
dto.setPw(pw);
dto.setContent(content);

dao.insert(dto);
%>
<div align="center">
<table>
	<tr align="center">
	<td bgcolor="yellow" width="100">게시물 작성 완료</td>
	<td bgcolor="green" width="300">내용</td>
</tr>
	<tr align="center">
	<td bgcolor="yellow" width="100">작성자</td>
	<td bgcolor="green" width="300"><%=email %>></td>
</tr>
	<tr align="center">
	<td bgcolor="yellow" width="100">제목</td>	
	<td bgcolor="green" width="300"><%=title %></td>
</tr>
	<tr align="center">
	<td bgcolor="yellow" width="100">비밀번호</td>
	<td bgcolor="green" width="300"><%=pw %></td>
</tr>
	<tr align="center">
	<td bgcolor="yellow" width="100">내용</td>
	<td bgcolor="green" width="300"><%=content %></td>	
</tr>	
	
</table>
</div>

</body>
</html>