<%@ page contentType="text/html; charset=UTF-8" language="java" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Confirmation</title>
    <style>
      body {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 11pt;
        margin-left: 2em;
        margin-right: 2em;
        line-height: 1.6;
      }
      h1 {
        color: teal;
        margin-bottom: 0.5em;
      }
      h2 {
        color: teal;
        font-size: 1.1em;
        margin-top: 1.2em;
        margin-bottom: 0.4em;
      }
      header img {
        margin-bottom: 1em;
      }
      .confirmation-container {
        background: #fafafa;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 1em 1.5em;
        margin-top: 1em;
        max-width: 600px;
      }
      .info-row {
        margin: 0.5em 0;
        clear: both;
      }
      .info-label {
        float: left;
        width: 12em;
        font-weight: bold;
        color: #444;
      }
      .info-value {
        display: inline-block;
        margin-left: 0.5em;
        color: #000;
      }
      .info-value-full {
        display: block;
        margin-left: 12em;
        color: #000;
      }
      hr {
        border: 0;
        border-top: 1px solid #ccc;
        margin: 1em 0;
      }
      #submit {
        margin-top: 1em;
        padding: 0.4em 1em;
        background: teal;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      #submit:hover {
        background: #004c4c;
      }
    </style>
  </head>
  <body>
    <%@ include file="/includes/header.html" %>

    <h1>Thank you for filling out the survey!</h1>

    <div class="confirmation-container">
      <h2>Your Information:</h2>
      <div class="info-row">
        <span class="info-label">First Name:</span>
        <span class="info-value">${firstName}</span>
      </div>
      <div class="info-row">
        <span class="info-label">Last Name:</span>
        <span class="info-value">${lastName}</span>
      </div>
      <div class="info-row">
        <span class="info-label">Email:</span>
        <span class="info-value">${email}</span>
      </div>
      <div class="info-row">
        <span class="info-label">Date of Birth:</span>
        <span class="info-value">${dob}</span>
      </div>

      <hr />

      <h2>How did you hear about us?</h2>
      <div class="info-row">
        <span class="info-value-full">${heardFrom}</span>
      </div>

      <hr />

      <h2>Announcements:</h2>
      <div class="info-row">
        <span class="info-label">Wants Updates:</span>
        <span class="info-value">
          <c:choose>
            <c:when test="${wantsUpdates}">Yes</c:when>
            <c:otherwise>No</c:otherwise>
          </c:choose>
        </span>
      </div>
      <div class="info-row">
        <span class="info-label">Email Announcements:</span>
        <span class="info-value">
          <c:choose>
            <c:when test="${emailOK}">Yes</c:when>
            <c:otherwise>No</c:otherwise>
          </c:choose>
        </span>
      </div>

      <hr />

      <h2>Preferred contact method:</h2>
      <div class="info-row">
        <span class="info-value-full">${contact}</span>
      </div>
    </div>

    <%@ include file="/includes/footer.jsp" %>
  </body>
</html>
