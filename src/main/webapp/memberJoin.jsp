<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>
<%@include file="header.jsp" %>
<h3>홈쇼핑 회원 등록</h3>
<%
	Class.forName("oracle.jdbc.OracleDriver");
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	
	Statement stmt = con.createStatement();
	
	String sql = "SELECT custno  FROM member_tbl_02";
	
	ResultSet rs = stmt.executeQuery(sql);
	
	int custno = 0;
	
	while(rs.next()) {
		if(custno < rs.getInt(1)) {
			custno = rs.getInt(1);
		}
	}
	custno += 1;
%>
<form name="join" action="memberJoinOk.jsp" method="post">
	<table>
		<tr>
			<td>회원번호(자동발생)</td>
			<td><input type="text" name="custno" value="<%=custno%>"></td>
		</tr>
		<tr>
			<td>회원성명</td>
			<td><input type="text" name="custname"></td>
		</tr>
		<tr>
			<td>회원전화</td>
			<td><input type="text" name="phone"></td>
		</tr>
		<tr>
			<td>회원주소</td>
			<td><input type="text" name="address"></td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td><input type="text" name="joindate"></td>
		</tr>
		<tr>
			<td>고객등급[A:VIP,B:일반,C:직원]</td>
			<td><input type="text" name="grade"></td>
		</tr>
		<tr>
			<td>도시코드</td>
			<td><input type="text" name="city"></td>
		</tr>
		<tr>
			<td><input type="button" value="등록" onClick="joinMember()"></td>
			<td><input type="button" value="조회" onClick="movePage()"></td>
		</tr>
	</table>
</form>

<%@include file="footer.jsp" %>
</body>
<script type="text/javascript">
	const form = document.join;
	
	function joinMember() {
		if(form.custno.value == "") {
			alert("회원번호가 입력되지 않았습니다.");
			form.custno.focus();
		}else if(form.custname.value == "") {
			alert("회원성명 이/가 입력되지 않았습니다.");
			form.custname.focus();
		}else if(form.phone.value == "") {
			alert("회원전화 이/가 입력되지 않았습니다.");
			form.phone.focus();
		}else if(form.address.value == "") {
			alert("회원주소 이/가 입력되지 않았습니다.");
			form.address.focus();
		}else if(form.joindate.value == "") {
			alert("가입일자 이/가 입력되지 않았습니다.");
			form.joindate.focus();
		}else if(form.grade.value == "") {
			alert("고객등급 이/가 입력되지 않았습니다.");
			form.grade.focus();
		}else if(form.city.value == "") {
			alert("도시코드가 입력되지 않았습니다.");
			form.city.focus();
		}else {
			form.submit();
		}
	}
	function movePage() {
		location.href="memberList.jsp";
	}
</script>
</html>