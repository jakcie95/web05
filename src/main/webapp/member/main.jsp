<%@page import="member.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
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
	<%
		MemberDAO dao = new MemberDAO(); //데이터베이스 연결
		ArrayList<MemberDTO> list = dao.getMember();
	%>
	<h1>회원들만의 페이지.</h1>
	<table border ="1">
	<tr>
		<th>아이디</th>
		<th>비밀번호</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
	</tr>
	<%for(MemberDTO dto : list){ %>
	
	<tr>
	<td><%=dto.getId() %></td>
	<td><%=dto.getPwd() %></td>
	<td><%=dto.getName() %></td>
	<td><%=dto.getAddr() %></td>
	<td><%=dto.getTel() %></td>
	</tr>
	<% } %>
 	</table>
 	<form action="logout.jsp" method="post">
 	<input type="submit" value="로그아웃">
 	</form>
 
 
</body>
</html>