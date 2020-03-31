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
		String id2 = "jsp";
		String pwd = "1234";
		System.out.println("==="+request.getParameter("id")+"===");
		System.out.println(request.getParameter("pw"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("addr"));
		System.out.println(request.getParameter("tel"));
		System.out.println(session.getAttribute("id"));
		Connection con = DriverManager.getConnection(url,id2,pwd);
		//String sql = "update members set id = " + "'" + request.getParameter("id")
					//+"','" + request.getParameter("pw")+ "','" +request.getParameter("name")
					//+"','"+ request.getParameter("addr")+"','"+request.getParameter("tel") + "')";
		
					/*
		String sql = "update members set id = '" + request.getParameter("id") + "', pwd = '" 
					+ request.getParameter("pw") + "', name = '" 
					+ request.getParameter("name") + "' addr = '" 
					+ request.getParameter("addr") + "', tel = '" 
					+ request.getParameter("tel") + "', where id= '" + session.getAttribute("id") + "'";
		*/
		String sql = "update members set id=?, pwd=?, name=?, addr=?, tel=? where id=?";
		
		//String sql2 = "insert into members values('" + request.getParameter("id")
		//+"','" + request.getParameter("pw")+ "','" +request.getParameter("name")+"','"+ request.getParameter("addr")
		//+"','"+request.getParameter("tel") + "')";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, request.getParameter("id"));
		ps.setString(2, request.getParameter("pw"));
		ps.setString(3, request.getParameter("name"));
		ps.setString(4, request.getParameter("addr"));
		ps.setString(5, request.getParameter("tel"));
		ps.setString(6, (String)session.getAttribute("id"));
		ps.executeUpdate();
		response.sendRedirect("main.jsp");
	%>
</body>
</html>