<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>登录入口</title>
<script type="text/javascript" src="registerForward.js"></script>
</head>
<body>
<from name="form1" nethod="post" action=" ">
<table align="center" width="300" height="100">
	<tr><th>工号:</th><td><input type="text"  name="jobNumber" ></td></tr>
	<tr><th colspan="2"><input  type="submit"  value="教师入口"  onClick="return teacherCheck()" />
	<input type="submit"  value="学生入口"  onClick="return studentCheck()" /></th></tr>
	</table>
	</from>
</body>
</html>