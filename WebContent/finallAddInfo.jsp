
<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>

<body>

	<%
		String sname = request.getParameter("sname");
		String age =  request.getParameter("age");
		String snumber =  request.getParameter("snumber");
		String telephone = request.getParameter("telephone");
		String home = request.getParameter("home");
		String sex = request.getParameter("sex");
		String score = request.getParameter("score");
		int  age_new = Integer.parseInt(age);
		int score_new = Integer.parseInt(score);
		session = request.getSession();
		Object o = session.getAttribute("showInfo_cnumber");
		String cnumber = o.toString();
		Connection con;
     	PreparedStatement pstmt;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
		String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);
		String sql = "insert into S(s# ,c# ,age ,sex ,home ,telephone , score ,sname) values(?, ? ,? ,? ,?,? , ? ,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 , snumber);
		pstmt.setString(2 , cnumber);
		pstmt.setInt(3 , age_new);
		pstmt.setString(4 , sex);
		pstmt.setString(5 , home);
		pstmt.setString(6 , telephone);
		pstmt.setInt(7 , score_new);
		pstmt.setString(8 ,sname);
		pstmt.executeUpdate();
	%>
	<h2 align="center">学生成绩插入成功!将在5秒后返回登录界面</h2>
	<%  response.setHeader("Refresh" , "5;url=register.jsp");  %>

</body>

</html>
