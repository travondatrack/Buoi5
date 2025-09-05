<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Test Page</title>
  </head>
  <body>
    <h1>Test Page - App is running</h1>
    <p>Context Path: <%= request.getContextPath() %></p>
    <p>Servlet Path: <%= request.getServletPath() %></p>
    <p>Request URI: <%= request.getRequestURI() %></p>
    <hr />
    <p><a href="index.html">Go to main page</a></p>
  </body>
</html>
