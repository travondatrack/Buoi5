<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Thanks for taking our survey!</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
  </head>
  <body>
    <%@ include file="/includes/header.html" %>

    <h1>Thanks for taking our survey!</h1>

    <p>Here is the information that you entered:</p>

    <div class="survey-results">
      <label>Email:</label>
      <span>${user.email}</span><br />

      <label>First Name:</label>
      <span>${user.firstName}</span><br />

      <label>Last Name:</label>
      <span>${user.lastName}</span><br />

      <label>Heard From:</label>
      <span>
        <c:choose>
          <c:when test="${user.heardFrom == 'search'}">Search Engine</c:when>
          <c:when test="${user.heardFrom == 'word'}">Word of mouth</c:when>
          <c:when test="${user.heardFrom == 'social'}">Social Media</c:when>
          <c:otherwise>Other</c:otherwise>
        </c:choose> </span
      ><br />

      <label>Updates:</label>
      <span>
        <c:choose>
          <c:when test="${user.wantsUpdates}">Yes</c:when>
          <c:otherwise>No</c:otherwise>
        </c:choose> </span
      ><br />

      <c:if test="${user.wantsUpdates}">
        <label>Contact via:</label>
        <span>
          <c:choose>
            <c:when test="${user.contact == 'either'}">Email</c:when>
            <c:when test="${user.contact == 'email'}">Email</c:when>
            <c:when test="${user.contact == 'postal'}">Postal mail</c:when>
            <c:otherwise>Email</c:otherwise>
          </c:choose> </span
        ><br />
      </c:if>
    </div>
  </body>
</html>
