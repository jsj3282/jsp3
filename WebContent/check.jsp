
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
		System.out.print(request.getParameter("id"));
		String sql = "select * from members where id = '"+ request.getParameter("id")+"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		String id2 = null;
		String pwd2 = null;
		String name2 = null;
		if(rs.next()){
			id2 = rs.getString("id");
			pwd2 = rs.getString("pwd");
			name2 = rs.getString("name");
		}
			out.print(request.getParameter("id")+" ");
			out.print(id2);
		if(request.getParameter("id").equals(id2)){
			if(request.getParameter("pwd").equals(pwd2)){%>
				<script type="text/javascript">
					alert(<%=request.getParameter("name")%>+"님 반갑습니다!")
				</script>
			<%
				session.setAttribute("name", name2);
				response.sendRedirect("main.jsp");
			
			}else{%>
				<script type="text/javascript">
					alert("일치하는 비밀번호가 없습니다.")
					location.href="login.jsp";
				</script>
			<%}
		}else{%>
			<script type="text/javascript">
				alert("일치하는 아이디가 없습니다.")
				location.href="login.jsp";
			</script>
		<% }
	%>
</body>
</html>