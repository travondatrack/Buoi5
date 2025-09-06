<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Murach Survey</title>
    <link rel="stylesheet" href="styles/main.css" type="text/css" />
  </head>
  <body>
    <%@ include file="/includes/header.html" %>

    <h1>Survey</h1>
    <p>
      If you have a moment, we'd appreciate it if you would fill out this
      survey.
    </p>

    <c:if test="${message != null}">
      <p style="color: red; font-weight: bold">${message}</p>
    </c:if>

    <form action="survey" method="post">
      <input type="hidden" name="action" value="add" />

      <h2>Your information:</h2>
      <label for="firstName" class="form-label">First Name</label>
      <input
        id="firstName"
        name="firstName"
        type="text"
        value="${user.firstName}"
        required
      /><br />

      <label for="lastName" class="form-label">Last Name</label>
      <input
        id="lastName"
        name="lastName"
        type="text"
        value="${user.lastName}"
        required
      /><br />

      <label for="email" class="form-label">Email</label>
      <input
        id="email"
        name="email"
        type="email"
        value="${user.email}"
        required
      /><br />

      <label for="dob" class="form-label">Date of Birth</label>
      <input id="dob" name="dob" type="date" /><br />

      <h2>How did you hear about us?</h2>
      <label
        ><input type="radio" name="heardFrom" value="search" checked /> Search
        engine</label
      >
      <label
        ><input type="radio" name="heardFrom" value="word" /> Word of
        mouth</label
      >
      <label
        ><input type="radio" name="heardFrom" value="social" /> Social
        Media</label
      >
      <label><input type="radio" name="heardFrom" value="other" /> Other</label>

      <h2>
        Would you like to receive announcements about new CDs and special
        offers?
      </h2>
      <label
        ><input type="checkbox" name="wantsUpdates" value="yes" /> YES, I'd like
        that.</label
      ><br />
      <label
        ><input type="checkbox" name="emailOK" value="yes" /> YES, please send
        me email announcements.</label
      ><br />

      <label for="contact">Please contact me by:</label>
      <select id="contact" name="contact" required>
        <option value="either">Email or postal mail</option>
        <option value="email">Email only</option>
        <option value="postal">Postal mail only</option></select
      ><br />
      <input
        type="submit"
        value="Submit"
        id="submit"
        style="margin-left: 0; display: inline-block"
      />
    </form>
  </body>
</html>
