<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 매출조회</title>
</head>
<body>
<%@include file="header.jsp" %>

<h3>회원매출조회</h3>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	String sql = "SELECT m.custno, m.custname, m.grade, SUM(n.price) FROM member_tbl_02 m "
				+"JOIN money_tbl_02 n ON m.custno=n.custno "
				+"GROUP BY (m.custno, m.custname, m.grade) "
				+"ORDER BY SUM(n.price) DESC";
	
	ResultSet rs = stmt.executeQuery(sql);
	
%>

<table>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
	<%while(rs.next()) {
		String grade = rs.getString(3);
		
		if(grade.equals("A")) {
			grade = "VIP";
		}else if(grade.equals("B")) {
			grade = "일반";
		}else if(grade.equals("C")) {
			grade = "직원";
		}
	%>
		<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=grade%></td>
			<td><%=rs.getString(4)%></td>
		</tr>
	<%} 
	
	rs.close();
	stmt.close();
	con.close();
	%>
</table>
<%@include file="footer.jsp" %>
</body>

</html>