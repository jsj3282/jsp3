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
	
		<script type="text/javascript">
			<%--
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//ip : localhost, 127.0.0.1, 실제 ip
			String url = "jdbc:oracle:thin:@192.168.0.34:1521:xe";
			String id2 = "jsp";
			String pwd = "1234";
			Connection con = DriverManager.getConnection(url, id2, pwd);
			--%>
			
			document.write("<table border='1'>")
			for(var i=0; i<4; i++){
				document.write("<tr>")
				if(i==0){
					document.write("<td>학번</td><td>이름</td><td>국어</td><td>영어</td><td>수학</td>")
				}else{	
					<%--
						int i = 1;
						String sql = "select * from student where id = " + i;
						PreparedStatement ps = con.prepareStatement(sql);
						ResultSet rs = ps.executeQuery();
						String math=null, eng=null, kor=null,name=null,id=null;
					 	while(rs.next()){
					 		--%>

							 id = rs.getString("id");
							 name = rs.getString("name");
							 kor = rs.getString("kor");
							 eng =rs.getString("eng");
							 math = rs.getString("math");
							i++;
					 	}
					document.write("<td>"+<%--=id%>+"</td>")
					document.write("<td>"+<%--=name%>+"</td>")
					document.write("<td>"+<%--=kor%>+"</td>")
					document.write("<td>"+<%--=eng%>+"</td>")
					document.write("<td>"+<%--=math%>+"</td>")	
				}
					document.write("</tr>")
			}
			
			document.write("</table>")
		</script>
</body>
</html>