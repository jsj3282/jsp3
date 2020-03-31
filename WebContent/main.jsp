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
		String name = (String)session.getAttribute("name");
	%>
	<script>
		alert("<%=name%>" +"님 반갑습니다.")
	</script>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//ip : localhost, 127.0.0.1, 실제 ip
		String url = "jdbc:oracle:thin:@192.168.0.40:1521:xe";
		String id = "jsp";
		String pwd = "1234";
		Connection con = DriverManager.getConnection(url,id,pwd);
		String sql = "select * from members";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		out.print("<table border='1'><tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th><th>전화번호</th></tr>");
		while(rs.next()){%>
			<tr>
			<td><%=rs.getString("id") %></td>
			<td><%=rs.getString("pwd") %></td>
			<td><%=rs.getString("name") %></td>
			<td><%=rs.getString("addr") %></td>
			<td><%=rs.getString("tel") %></td>
			</tr>
		<%}%>
		</table>
		<input type="button" onclick="location.href='logout.jsp';" value="로그아웃">
		<input type="button" onclick="location.href='modifyInfo.jsp';" value="계정정보">
</body>
</html>