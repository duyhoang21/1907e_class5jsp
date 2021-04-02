<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<body>
        <h1 align = "center">Welcome to Optech </h1>
        <jsp:useBean id = "beanalias" scope = "session" class = "class5.Billing" />
	        <jsp:setProperty name = "beanalias" property = "registrationcost" value ="300" />
	        <jsp:setProperty name = "beanalias" property = "quantity" value = "5" />
        
        <p>
            Cost of each registration is : 
            <jsp:getProperty name = "beanalias" property ="registrationcost"/><br/>
            Total number of employees registered :
            <jsp:getProperty name = "beanalias" property= "quantity" /><br/>
            <br/>
            <%
                int cost = beanalias.getRegistrationcost();
                int quantity = beanalias.getQuantity();
                int total = cost * quantity;
                out.println("Total amount to be paid: Rs. " + total + "/-");
            %>
            <br/><br/>
        </p>
        <%--
        This example uses JSTL, uncomment the taglib directive above.
        To test, display the page like this: index.jsp?sayHello=true&name=Murphy
        --%>
        <%--
        <c:if test="${param.sayHello}">
            <!-- Let's welcome the user ${param.name} -->
            Hello ${param.name}!
        </c:if>
        --%>

    </body>
	
</body>
</html>