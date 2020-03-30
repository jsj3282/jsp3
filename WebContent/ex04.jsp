<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
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
		String id = (String)request.getAttribute("id");
		String name = (String)request.getAttribute("name");
		String kor = (String)request.getAttribute("kor");
		String eng = (String)request.getAttribute("eng");
		String math = (String)request.getAttribute("math");
	%>
	<h1>인적 사항</h1>
	<h3>학번 : <%=id %></h3>
	<h3>이름 : <%=name %></h3>
	<h3>국어 : <%=kor %></h3>
	<h3>영어 : <%=eng %></h3>
	<h3>수학 : <%=math %></h3>
</body>
</html>