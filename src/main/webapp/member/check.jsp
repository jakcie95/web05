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
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		System.out.println("11 check.jsp 실행");
		MemberDAO dao = new MemberDAO();
		System.out.println("22 dao 종료");
		int result = dao.userChk(id, pwd);
		if(result == 1){//로그인 성공
			session.setAttribute("id", id);
			out.print("<script>alert('"+id+"님 환영합니다');location.href='main.jsp'</script>");
			//response.sendRedirect("main.jsp");
		}else if(result == 0){//비밀번호 틀림
		%>
		<script type="text/javascript">
		alert('비밀번호 틀림')
		location.href='login.jsp'
		</script>
	  <%}else{//아이디 없음
			%>
			<script type="text/javascript">
				alert('존재하지 않는 아이디입니다.')
				location.href='login.jsp'
			</script>
	  <%}%>
	

</body>
</html>