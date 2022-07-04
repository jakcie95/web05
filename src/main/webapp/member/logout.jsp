<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% session.invalidate(); 
	System.out.println("세션 삭제완료");
	//response.sendRedirect("login.jsp");
%>
<script type="text/javascript">
	alert('로그아웃 되었습니다.')
	location.href="login.jsp"
</script>
</body>
</html>