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

<body bgcolor="yellow">
	<%
		String title = request.getParameter("title");
		KmongDAO dao = new KmongDAO();
		KmongDTO dto = dao.select(title);
	%>
	
	<center>
	
	<font color="red" size="6">게시물 정보확인</font>
		<hr>
		<form action="boardUpdate.jsp">
			<table>
				<tr align="center">
					<td bgcolor="yellow" width="100">이 메 일</td>
					<td bgcolor="green" width="350">
					<input type="text" name="email" value="<%= dto.getEmail() %>" readonly="readonly" size="45"></td>
				</tr>
				<tr align="center">
					<td bgcolor="yellow" width="100">제 목</td>
					<td bgcolor="green" width="350">
					<input type="text" name="title" size="50" value="<%=dto.getTitle()%>"></td>
				</tr>
				<tr align="center">
					<td bgcolor="yellow" width="100">패스워드</td>
					<td bgcolor="green" width="350">
					<input type="text" name="pw" value "<%=dto.getPw()%>"></td>
				</tr>
				<tr align="center">
					<td bgcolor="yellow" width="100">내 용</td>
					<td bgcolor="green" width="350">
					<textarea type="text" name="content" cols="69" rows="21" value "<%=dto.getContent()%>"></textarea>
				</tr>
			
			</table>
				<tr align="center">
								<td bgcolor="yellow" colspan="10"><input type="submit"
								value="게시물 수정완료"></td>
				</tr>
			<tr>
				<a href="boardDelte.html">게시물삭제하기</a>
			</tr>	










	</form>
	</center>
</body>
</html>
