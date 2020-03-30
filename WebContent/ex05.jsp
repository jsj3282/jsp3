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
		String sql = "select * from student";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		out.print("<table border='1'><tr><th>id</th><th>name</th><th>국어</th><th>영어</th><th>수학</th></tr>");
		while(rs.next()){%>
			<tr>
			<td><%=rs.getString("id") %></td>
			<td>
				<a href="ex06.jsp?id=<%=rs.getString("id") %>"><%=rs.getString("name") %></a>
			</td>
			<td><%=rs.getString("kor") %></td>
			<td><%=rs.getString("eng") %></td>
			<td><%=rs.getString("math") %></td>
			</tr>
		<%}%>
		</table>
</body>
</html>