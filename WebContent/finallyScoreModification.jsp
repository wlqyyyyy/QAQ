<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>

<body>

	<%! String snumber; %>

	<%		session = request.getSession();
		String score = request.getParameter("score");
		int int_score = Integer.parseInt(score);
		Object o = session.getAttribute("Modification_snumber");
		snumber = o.toString();
		Connection con;
		PreparedStatement pstmt;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
     	String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);
		String sql = "update S set score = ? where s# = ?" ;
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1 , int_score);
		pstmt.setString(2 , snumber);
		pstmt.executeUpdate();
	%>
	<h2 align="center">修改成绩成功!将在5秒后返回登录界面</h2>
	<%  response.setHeader("Refresh" , "5;url=register.jsp");  %>

</body>

</html>
