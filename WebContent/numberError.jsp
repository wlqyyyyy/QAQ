
<%@ page  pageEncoding="UTF-8" %>

<html>

<body>

<%

	String errorNumber = request.getParameter("jobNumber");

%>

<p>无法识别学号<%= errorNumber %>,请检查学号是否输入正确!</p>

<p>5秒后将返回登录界面</p>

<% response.setHeader("Refresh"   , "5;url=register.jsp");  %>

</body>

</html>
