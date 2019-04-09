
<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>

<body>
	<%! String tname , title; %>
	<%
		String jobNumber = request.getParameter("jobNumber");
		jobNumber.trim();
		session.setAttribute("t#" ,jobNumber);

		Connection con;
		PreparedStatement pstmt;
		ResultSet rs=null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
		String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);

		String sql = "select c# , cname , tname , title  from T where t# = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 , jobNumber);
		rs = pstmt.executeQuery();
		String ArrayCname[] = new  String[10];
		String ArrayCnumber[] = new String[10];
		int i=0;
		while(rs.next())

		{

			tname = rs.getString("tname");
			title = rs.getString("title");
			ArrayCname[i] = rs.getString("cname");
			ArrayCnumber[i] = rs.getString("c#");
			i++;

		}
		rs.close();
		pstmt.close();
		con.close();

		

	%>

	<form  name = "form3"  action="showInfo.jsp" >

	<table align="center">
	<h2 align = "center" > 选择你的课程进入系统</h2>
	<h3 align="center" ><%= tname %><%= title %>,请您选课</h3>

	<%

		int u=0;
		while(u<i)

		{
			out.println(" "+" "+" "+" "+" "+"<h4 align=\"center \"><input type=\"radio\" name = \"Cnumber\" value="+ArrayCnumber[u]+">"+ ArrayCname[u]+"</h4>");
			u++;
		}

	%>
	<input type = "submit" value="进入" align="center">

	</table>

	</form>

</body>

</html>
