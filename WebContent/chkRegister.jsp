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
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	%>
	<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//ip : localhost, 127.0.0.1, 실제 ip
		String url = "jdbc:oracle:thin:@192.168.0.40:1521:xe";
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
		if(id2==null){
			String sql2 = "insert into members values('" + request.getParameter("id")
			+"','" + request.getParameter("pw")+ "','" +request.getParameter("name")+"','"+ request.getParameter("addr")
			+"','"+request.getParameter("tel") + "')";
			//String sql2 = "insert into members values(" + request.getParameter("id") + "," 
			//+ request.getParameter("pw") + "," + request.getParameter("name") + "," 
			//+ request.getParameter("addr") + "," + request.getParameter("tel") + ")" + "'";
			PreparedStatement ps2 = con.prepareStatement(sql2);
			ps2.executeUpdate();
			session.setAttribute("id", request.getParameter("id"));
			session.setAttribute("pwd", request.getParameter("pw"));
			session.setAttribute("name", request.getParameter("name"));
			session.setAttribute("addr", request.getParameter("addr"));
			session.setAttribute("tel", request.getParameter("tel"));
			response.sendRedirect("main.jsp");
			%>
			<script>
				alert("회원가입을 축하합니다.")
			</script>
		<%}%>
</body>
</html>