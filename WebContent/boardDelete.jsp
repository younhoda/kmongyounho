<%@page import="kmong.KmongDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 삭제 화면입니다.</title>
</head>
<body>
<%
String title=request.getParameter("title");
KmongDAO dao=new KmongDAO();
dao.delete(title);
out.print("삭제되었습니다.");

%>
</body>
</html>