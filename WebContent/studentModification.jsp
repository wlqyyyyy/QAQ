<%@ page  pageEncoding="UTF-8"   import ="java.sql.*"  import="java.util.*" %>
<html>
<body>
<%
		session = request.getSession();
		String sNumber = (String)session.getAttribute("sNumber");
		String sname  = (String)session.getAttribute("sname");
		Object o;
		o  = session.getAttribute("score");
		String score = o.toString();
		o = session.getAttribute("age");
		String age = o.toString();
		String sex = (String)session.getAttribute("sex");
		String telephone  = (String)session.getAttribute("telephone");
		String home  = (String)session.getAttribute("home");
		if(sex.equals("男"))
		{
			sex = "M";
		}
		else
		{
		sex = "W";		}
		Connection con;
		PreparedStatement pstmt;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
		String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);

		String sql = "update S  set s#=? , sname = ? , score = ? , age = ? , sex = ? , telephone = ? , home = ?  where s# = ? ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 , sNumber);
		pstmt.setString(2 , sname);
		pstmt.setInt(3 , Integer.parseInt(score));
 	    pstmt.setInt(4 , Integer.parseInt(age));
		pstmt.setString(5 , sex);
		pstmt.setString(6 , telephone);
		pstmt.setString(7 , home);
		pstmt.setString(8 , sNumber);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
		%>
<p>数据更新完成,将在5秒后返回主界面</p>
<% response.setHeader("Refresh" , "5;url=register.jsp"); %>
    <p>已更新的数据如下:</p>
	<p>成绩:<%= score %></p>
	<p>姓名:<%= sname  %></p>
	<p>学号:<%= sNumber %></p>
	<p>性别:<%= sex %></p>
	<p>年龄:<%= age %></p>
	<p>联系方式:<%= telephone %></p>
	<p>居住地:<%= home %></p>

</body>

</html>
