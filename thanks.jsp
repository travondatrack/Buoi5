<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
  <head>
    <title>Thanks</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
    <style>
      body {
        font-family: Arial, sans-serif;
      }
      h1 {
        color: teal;
      }
      label {
        font-weight: bold;
      }
    </style>
  </head>
  <body>
    <header>
      <img src="images/murach.jpg" alt="Murach" width="60" height="60" />
    </header>

    <h1>Thanks for joining our email list</h1>
    <p>Here is the information that you entered:</p>

    <p><label>Email:</label> ${email}</p>
    <p><label>First Name:</label> ${firstName}</p>
    <p><label>Last Name:</label> ${lastName}</p>
    <p><label>Date of Birth:</label> ${dob}</p>
    <p><label>Heard From:</label> ${heardFrom}</p>

    <p>
      <label>Wants Updates:</label>
      <c:choose>
        <c:when test="${wantsUpdates}">Có</c:when>
        <c:otherwise>Không</c:otherwise>
      </c:choose>
    </p>

    <p>
      <label>Email OK:</label>
      <c:choose>
        <c:when test="${emailOK}">Có</c:when>
        <c:otherwise>Không</c:otherwise>
      </c:choose>
    </p>

    <p><label>Contact Via:</label> ${contact}</p>

    <form action="index.html">
      <input type="submit" value="Return" />
    </form>
  </body>
</html>
