
<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>

<body>

<%
	 	session = request.getSession();
		Object o = session.getAttribute("showInfo_cnumber");
		String cnumber = o.toString();

%>

<form name = "form6"  action = "finallAddInfo.jsp">
	<table align="center" border="7" width="300" height="400">

	<tr><td>姓名:</td><td><input type="text"  name="sname"></td></tr>
	<tr><td>年龄:</td><td><input type="text"  name="age" ></td></tr>
	<tr><td>性别:</td></tr>	<tr><td><input type="radio"  name="sex" value="M" checked>男</td><td><input type="radio" name="sex" value="W" >女</tr>
	<tr><td>学号:</td><td><input type="text"  name="snumber"></td></tr>
	<tr><td>联系方式:</td><td><input type="text" name="telephone" ></td></tr>
	<tr><td>居住地:</td><td><input type="text" name="home" ></td></tr>
	<tr><td>成绩:</td><td><input type = "text" name = "score" ></td></tr>
	<tr><td><input type = "submit"  value="添加"> </td></tr>
	<tr><td><%= cnumber %></td></tr>

</body>

</html>
