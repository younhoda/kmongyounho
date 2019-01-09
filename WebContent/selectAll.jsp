<%@page import="kmong.KmongDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="kmong.KmongDAO" />
	<tr>
</tr>
	<%
		ArrayList<KmongDTO>list=dao.selectAll();
	%>
	<table class="table table-dark table-striped">
	
	<tr class="table-dark text-dark">
		<td>순서</td>
		<td>이메일</td>
		<td>제목</td> 
		<td>패스워드</td>
		<td>내용</td>
		<td>작성일</td>
	</tr>
	<%
	  for(int i=0;i<list.size();i++){
		  KmongDTO dto=list.get(i);	  
	%>
	<tr>
	<td>	
	<a href="boardselect.jsp?title=<%= dto.getTitle() %>"> 
 	<%= dto.getNo() %></a></td> 
	<td><%=dto.getEmail() %></td>
	<td><%= dto.getTitle() %></td> 
	<td><%= dto.getPw() %></td> 
	<td><%=dto.getContent()%></td>
	<td><%=dto.getTimeStamp()%></td>
	
	</tr>

	<%
	  }
	%>
</table>
<hr>
	
<hr>
	<a href="boardInsert.html" target="_blank" >
<button  type="button">게시물등록하기</button>
</a>
<a href="boardselect.html" target="_blank" >
<button  type="button">게시물 검색하기</button>
</a>
<a href="boardDelte.html" target="_blank" >
<button  type="button">게시물삭제하기</button>
</a>

	
	
	
</body>
</html>