<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Student" %>
<html>
<head>
    <title>Student Registration Result</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        table { border-collapse: collapse; width: 60%; margin: auto; }
        th, td { border: 1px solid #333; padding: 8px; text-align: left; }
        th { background-color: #f2f2f2; }
        h2 { text-align: center; }
    </style>
</head>
<body>
<h2>Student Registration Details</h2>

<%
    Student student = (Student) request.getAttribute("student");
%>

<table>
    <tr><th>First Name</th><td><%= student.getFirstName() %></td></tr>
    <tr><th>Last Name</th><td><%= student.getLastName() %></td></tr>
    <tr><th>Date of Birth</th><td><%= student.getDateOfBirth() %></td></tr>
    <tr><th>Email</th><td><%= student.getEmail() %></td></tr>
    <tr><th>Mobile</th><td><%= student.getMobile() %></td></tr>
    <tr><th>Gender</th><td><%= student.getGender() %></td></tr>
    <tr><th>Address</th><td><%= student.getAddress() %></td></tr>
    <tr><th>City</th><td><%= student.getCity() %></td></tr>
    <tr><th>Pin Code</th><td><%= student.getPinCode() %></td></tr>
    <tr><th>State</th><td><%= student.getState() %></td></tr>
    <tr><th>Country</th><td><%= student.getCountry() %></td></tr>
    <tr>
        <th>Hobbies</th>
        <td>
            <%
                if (student.getHobbies() != null && !student.getHobbies().isEmpty()) {
                    for (String h : student.getHobbies()) {
                        out.print(h + " ");
                    }
                } else {
                    out.print("None");
                }
            %>
        </td>
    </tr>
</table>
</body>
</html>
