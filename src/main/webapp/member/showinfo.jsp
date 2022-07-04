<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	MemberDAO dao = new MemberDAO();
	MemberDTO d = dao.getInfo(request.getParameter("id"));
%>
<h1>회 원 정 보</h1>
<p>
id : <%=d.getId() %>
</p>
pwd : <%=d.getPwd() %>
<p>
name : <%=d.getName() %>
</p>
addr : <%=d.getAddr() %>
<p>
tel : <%=d.getTel() %>
</p>
</body>
</html>