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
<body>ex01.jsp<br>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//ip : localhost, 127.0.0.1, 실제 ip
		String url = "jdbc:oracle:thin:@192.168.0.34:1521:xe";
		String id = "java001";
		String pwd = "1234";
		Connection con = DriverManager.getConnection(url, id, pwd);
		String sql = "select * from newst";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		out.print("id\t이름\t나이\t<br>");
		while(rs.next()){%>
			<%=rs.getString("id") %>
			<%=rs.getString("name") %>
			<%=rs.getString("age") %>
			<hr>
		<%}%>
</body>
</html>