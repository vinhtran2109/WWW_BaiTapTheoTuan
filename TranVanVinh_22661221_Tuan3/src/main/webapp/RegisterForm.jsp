<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
<h2>User Registration Form</h2>
<form action="${pageContext.request.contextPath}/registerform" method="post">
    First Name: <input type="text" name="firstname"/><br/>
    Last Name: <input type="text" name="lastname"/><br/>
    Email: <input type="text" name="email"/><br/>
    Password: <input type="password" name="password"/><br/>
    Birthday: <input type="date" name="dob"/><br/>
    <input type="submit" value="Sign Up"/>
</form>
</body>
</html>
