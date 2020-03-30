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
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//ip : localhost, 127.0.0.1, 실제 ip
		String url = "jdbc:oracle:thin:@192.168.0.34:1521:xe";
		String id = "jsp";
		String pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select * from student where id = '" + request.getParameter("id") + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		if(rs.next()){%>
			<h1>인적 사항</h1>
			<h3>학번 : <%=rs.getString("id") %><br></h3>
			<h3>이름 : <%=rs.getString("name") %><br></h3>
			<h3>국어 : <%=rs.getString("kor") %><br></h3>
			<h3>영어 : <%=rs.getString("eng") %><br></h3>
			<h3>수학 : <%=rs.getString("math") %><br></h3>
		<%}%>
</body>
</html>