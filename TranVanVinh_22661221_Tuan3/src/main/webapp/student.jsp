<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 9/8/2025
  Time: 10:39 AM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Registration Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        form {
            width: 600px;
            margin: auto;
        }
        label {
            display: block;
            margin-top: 10px;
            font-weight: bold;
        }
        input, select, textarea {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .inline {
            display: inline-block;
            margin-right: 15px;
        }
        .btn {
            margin-top: 20px;
        }
    </style>
</head>
<body>
<h2 style="text-align:center;">Student Registration Form</h2>

<form action="registerStudent" method="post">
    <label>First Name</label>
    <input type="text" name="firstName">

    <label>Last Name</label>
    <input type="text" name="lastName">

    <label>Date of Birth</label>
    <input type="date" name="dateOfBirth">

    <label>Email</label>
    <input type="email" name="email">

    <label>Mobile</label>
    <input type="text" name="mobile">

    <label>Gender</label>
    <div>
        <label class="inline"><input type="radio" name="gender" value="Male"> Male</label>
        <label class="inline"><input type="radio" name="gender" value="Female"> Female</label>
    </div>

    <label>Address</label>
    <textarea name="address" rows="3"></textarea>

    <label>City</label>
    <input type="text" name="city">

    <label>Pin Code</label>
    <input type="text" name="pinCode">

    <label>State</label>
    <input type="text" name="state">

    <label>Country</label>
    <input type="text" name="country">

    <label>Hobbies</label>
    <div>
        <label class="inline"><input type="checkbox" name="hobbies" value="Drawing"> Drawing</label>
        <label class="inline"><input type="checkbox" name="hobbies" value="Singing"> Singing</label>
        <label class="inline"><input type="checkbox" name="hobbies" value="Dancing"> Dancing</label>
        <label class="inline"><input type="checkbox" name="hobbies" value="Sketching"> Sketching</label>
        <label class="inline"><input type="checkbox" name="hobbies" value="Others"> Others</label>
    </div>

    <div class="btn">
        <input type="submit" value="Submit">
        <input type="reset" value="Reset">
    </div>
</form>
</body>
</html>
