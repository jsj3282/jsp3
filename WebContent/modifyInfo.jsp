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
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
		String name = (String)session.getAttribute("name");
		String addr = (String)session.getAttribute("addr");
		String tel = (String)session.getAttribute("tel");
	%>
	<form action="main.jsp" method="post">
	<h1>회원 정보 수정 및 삭제</h1>
	아이디 : <input type="text" value=<%=id %>><br>
	비밀번호 : <input type="text" value=<%=pw %>><br>
	이름 : <input type="text" value=<%=name %>><br>
	주소 : <input type="text" value=<%=addr %>><br>
	전화번호 : <input type="text" value=<%=tel %>><br>
	
	</form>
</body>
</html>