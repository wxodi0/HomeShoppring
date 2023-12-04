<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록조회/수정</title>
</head>
<body>
<%@include file="header.jsp" %>
<h2>회원목록조회/수정</h2>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	String sql = "SELECT * FROM member_tbl_02 ORDER BY custno ASC";
	
	ResultSet rs = stmt.executeQuery(sql);
	
%>
<table>
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>전화번호</td>
		<td>주소</td>
		<td>가입일자</td>
		<td>고객등급</td>
		<td>거주지역</td>
	</tr>
	<%while(rs.next()) {
		String grade = rs.getString(6);
		String date = rs.getString(5);
		
		date = date.substring(0,10);
		
		if(grade.equals("A")) {
			grade = "VIP";
		}else if(grade.equals("B")) {
			grade = "일반";
		}else if(grade.equals("C")) {
			grade = "직원";
		}
	%>
		<tr>
			<td><a href="memberEdit.jsp?id=<%=rs.getString(1)%>"><%=rs.getString(1)%></a></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=date%></td>
			<td><%=grade%></td>
			<td><%=rs.getString(7)%></td>
		</tr>
	<%} %>
</table>
<%
rs.close();
stmt.close();
con.close();
%>
<%@include file="footer.jsp" %>
</body>
</html>