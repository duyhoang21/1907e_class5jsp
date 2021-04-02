<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="newUser" class="class5.RegUser" type="class5.RegUser"  scope="session"/>
<jsp:setProperty name="newUser" property="firstName" param="first_name" />
<jsp:setProperty name="newUser" property="lastName" param="last_name" />
<jsp:setProperty name="newUser" property="address" param="address" />
<jsp:setProperty name="newUser" property="sex" param="sex" />
<jsp:setProperty name="newUser" property="email" param="email" />

<center>
<table>
	<tr>
		<th colspan="2">Your information.</th>
	</tr>
	<tr>
		<td>First name : </td>
		<td><jsp:getProperty name="newUser" property="firstName" /></td>
	</tr>
	
	<tr>
		<td>Last name : </td>
		<td><jsp:getProperty name="newUser" property="lastName" /></td>
	</tr>
	
	<tr>
		<td>Email : </td>
		<td><jsp:getProperty name="newUser" property="email" /></td>
	</tr>
	
	<tr>
		<td>Sex : </td>
		<td><jsp:getProperty name="newUser" property="sex" /></td>
	</tr>
	
	<tr>
		<td>Address : </td>
		<td><jsp:getProperty name="newUser" property="address" /></td>
	</tr>
	<tr>
		<td><a href="javascript:history.back(-1)">Back</a></td>
		<td align="right"><a href="insertNewUser.jsp">Accept</a></td>
	</tr>
</table>
</center>
</body>
</html>