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
		String pw = (String)session.getAttribute("pwd");
		String name = (String)session.getAttribute("name");
		String addr = (String)session.getAttribute("addr");
		String tel = (String)session.getAttribute("tel");
	%>
	<form action="modifyProcess.jsp" method="post">
	<h1>회원 정보 수정 및 삭제</h1>
	아이디 : <input type="text" name = "id" value=<%=id %>><br>
	비밀번호 : <input type="text" name = "pw"value=<%=pw %>><br>
	이름 : <input type="text" name="name" value=<%=name %>><br>
	주소 : <input type="text" name="addr" value=<%=addr %>><br>
	전화번호 : <input type="text" name="tel" value=<%=tel %>><br>
	<input type="submit" value="수정">
	<input type="button" onclick="location.href='logout.jsp';" value="로그아웃">
	</form>
</body>
</html>