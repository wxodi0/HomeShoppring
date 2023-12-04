<%@page import="java.sql.*"%>
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
try{
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");

	String sql = "UPDATE member_tbl_02 SET custname=?, phone=?, address=?, joindate=?, grade=?, city=? WHERE custno=?";

	PreparedStatement pstmt = con.prepareStatement(sql);

	String custno = request.getParameter("custno");
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String joindate = request.getParameter("joindate");
	String grade = request.getParameter("grade");
	String city = request.getParameter("city");

	pstmt.setString(1, custname);
	pstmt.setString(2, phone);
	pstmt.setString(3, address);
	pstmt.setString(4, joindate);
	pstmt.setString(5, grade);
	pstmt.setString(6, city);
	pstmt.setString(7, custno);
	
	out.println(custname);
	out.println(phone);
	out.println(address);
	out.println(joindate);
	out.println(grade);
	out.println(city);
	out.println(custno);

	pstmt.executeUpdate();

	pstmt.close();
	con.close();
	
	response.sendRedirect("index.jsp");
} catch (Exception e) {
	out.println(e);
}
%>
</body>
</html>