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
	
	<form action="ex04.jsp" method="post">
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//ip : localhost, 127.0.0.1, 실제 ip
		String url = "jdbc:oracle:thin:@192.168.0.34:1521:xe";
		String id2 = "jsp";
		String pwd = "1234";
		Connection con = DriverManager.getConnection(url, id2, pwd);
		
	%>
		<table border='1'>
			<tr>
				<td>학번</td><td>이름</td><td>국어</td><td>영어</td><td>수학</td>
			</tr>
			<tr>
				<%
					String sql = "select * from student where id = '1'";
					PreparedStatement ps = con.prepareStatement(sql);
					ResultSet rs = ps.executeQuery();
					String id = null;
					String name = null;
					String kor = null;
					String eng = null;
					String math = null;
					while(rs.next()){
						id = rs.getString("id");
						name = rs.getString("name");
						kor = rs.getString("kor");
						eng = rs.getString("eng");
						math = rs.getString("math");
					}
					request.setAttribute("id", id);
					request.setAttribute("name", id);
					request.setAttribute("kor", id);
					request.setAttribute("eng", id);
					request.setAttribute("math", id);
				%>
				<td><%=id %></td>
				<td><a href="ex04.jsp"><%=name %></a></td>
				<td><%=kor %></td>
				<td><%=eng %></td>
				<td><%=math %></td>
			</tr>
			<tr>
				<%
					sql = "select * from student where id = '2'";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					while(rs.next()){
						id = rs.getString("id");
						name = rs.getString("name");
						kor = rs.getString("kor");
						eng = rs.getString("eng");
						math = rs.getString("math");
					}
					request.setAttribute("id", id);
					request.setAttribute("name", id);
					request.setAttribute("kor", id);
					request.setAttribute("eng", id);
					request.setAttribute("math", id);
				%>
				<td><%=id %></td>
				<td><a href="ex04.jsp"><%=name %></a></td>
				<td><%=kor %></td>
				<td><%=eng %></td>
				<td><%=math %></td>
			</tr>
			<tr>
				<%
					sql = "select * from student where id = '3'";
					ps = con.prepareStatement(sql);
					rs = ps.executeQuery();
					while(rs.next()){
						id = rs.getString("id");
						name = rs.getString("name");
						kor = rs.getString("kor");
						eng = rs.getString("eng");
						math = rs.getString("math");
					}
					request.setAttribute("id", id);
					request.setAttribute("name", id);
					request.setAttribute("kor", id);
					request.setAttribute("eng", id);
					request.setAttribute("math", id);
				%>
				<td><%=id %></td>
				<td><a href="ex04.jsp"><%=name %></a></td>
				<td><%=kor %></td>
				<td><%=eng %></td>
				<td><%=math %></td>
			</tr>
		</table>	
	</form>
</body>
</html>