<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>

<body>

	<% 
		session = request.getSession();
				session = request.getSession();

		Object o = session.getAttribute("showInfo_snumber");
		String snumber = o.toString();
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs=null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
		String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);
		String  sql = "select sname ,score from S where s# = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 , snumber);
		rs = pstmt.executeQuery();
		rs.next();
		String sname = rs.getString("sname");
		int  score = rs.getInt("score");
		session.setAttribute("Modification_snumber" ,  snumber );
		rs.close();
		pstmt.close();
		con.close();

		

	%>

		<form  name = "form5"  action = "finallyScoreModification.jsp" >
		<table  align = "center" >
		<h1 align="center">成绩修订</h1>
		<tr><th>姓名:</th><td><%= sname %></td></tr>
		<tr><th>学号:</th><td><%= snumber %></td></tr>
		<tr><th>当前成绩:</th><td><%= score %></td></tr>
		<tr><th>修订后的成绩:</th><td><input type = "text"  name = "score"  ></td></tr>
		<tr><td  align="center" colspan = "2"><input type = "submit"  value = "修改" ></td></tr>

		</table>
	</form>

</body>

</html>
