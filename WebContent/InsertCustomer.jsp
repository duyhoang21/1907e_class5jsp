<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="controller.*, dao.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
		if(request.getMethod().equalsIgnoreCase("GET")) {
	%>
	<form action="InsertCustomer.jsp" method="post">
		<table align="center">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname" /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastname" /></td>
			</tr>
			<tr>
				<td>Address 1</td>
				<td><input type="text" name="address" /></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</form>
	<% 
			} else  { // POST
			//Get all parameters of this page 
			request.setAttribute("firstname", request.getParameter("firstname"));
                request.setAttribute("lastname", request.getParameter("lastname"));
                request.setAttribute("address", request.getParameter("address"));
                
                String fn = request.getAttribute("firstname").toString();
                String ln = request.getAttribute("lastname").toString();
                String add = request.getAttribute("address").toString();
                
                if(!hasAllDataToInsert(fn, ln, add)) {
                    %>

	<form action="InsertCustomer.jsp" method="post">
		<table align="center">
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstname"
					value='<%= displayValue(request, "firstname")%>' /></td>
				<td><%= displayRequiredField(request, "firstname")  %></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastname"
					value='<%= displayValue(request, "lastname")%>' /></td>
				<td><%= displayRequiredField(request, "lastname")  %></td>
			</tr>
			<tr>
				<td>Address 1</td>
				<td><input type="text" name="address"
					value='<%= displayValue(request, "address")%>' /></td>
				<td><%= displayRequiredField(request, "address")  %></td>
			</tr>

			<tr>
				<td>&nbsp;</td>
				<td><input type="submit" value="Update" /></td>
			</tr>
		</table>
	</form>

	<%
                } else {
                	//Connection 
                	UserDAO userDao = new UserDAO();
                	
                	//userDao.insertUser(new User()); // pass parameters into User
                }
			}
        %>
</body>
</html>


<%!
     // check all required fields has data or not
  private boolean hasAllDataToInsert(String fn, String ln, String addr1) {
    boolean requiredFieldsHaveData = true;
    requiredFieldsHaveData = hasData(fn) && hasData(ln) && hasData(addr1);
    return requiredFieldsHaveData;
  }
  // a field has data or not
  private boolean hasData(String field) {
    boolean isOK = true;
    if (field == null || field.trim().equals(""))
      isOK = false;
    return isOK;
  }
  // get request attribute value and display it
  // if the value is null, "" is returned
  private String displayValue(HttpServletRequest request, String attrName) {
    String paramValue = (String) request.getAttribute(attrName);
    if (attrName == null)
      return "";
    return paramValue;
  }
  // if required field doesnt have data, return a warning
  private String displayRequiredField(HttpServletRequest request, String attrName) {
    String value = (String) request.getAttribute(attrName);
    if (value == null || value.trim().equals(""))
      return "<font color=red>Required field</font>";
    return "";
  }
 %>
