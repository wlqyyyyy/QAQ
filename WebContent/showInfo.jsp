
<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*"  %>

<html>
<body>
	<form  name="form4"  >
	<table  align="center"  border="8" width="600" height="200">
	<h3 align="center"> 学生信息:</h3>
	<tr><td>学号</td><td>姓名</td><td>年龄</td><td>性别</td><td>联系方式</td><td>成绩</td><td>修改成绩</td></tr>
	<%! String cnumber  , snumber;  %>
	<%
		session = request.getSession();
		Object  o = session.getAttribute("t#");
		String c = o.toString();
	    cnumber = request.getParameter("Cnumber");  //接收到的是实际的c#值  , 变量写c# 报错说变量c重复定义,估计是#特殊字符
		Connection con;
		PreparedStatement pstmt;
		ResultSet rs=null;
		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
     	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";
		String user = "sa";
		String userPassword = "123";
		Class.forName(driver);
		con = DriverManager.getConnection(url , user , userPassword);
		String sql = "select s# ,sname ,score ,age ,sex , telephone  , home   from S  where c# = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1 , cnumber);
		rs = pstmt.executeQuery();
		while(rs.next())
			{

	%>
			<tr><td><%= rs.getString("s#") %></td>
						<%

							 snumber = rs.getString("s#");
						%>
				<td><%= rs.getString("sname")%></td>
				<td><%= rs.getInt("age") %></td>

						<%
					String sex = rs.getString("sex");
					if(sex.equals("M"))

					{
						sex = "男";

					}
					else

					{
						sex = "女";

					}
					session.setAttribute("showInfo_snumber" , snumber);
					session.setAttribute("showInfo_cnumber" , cnumber);

				%>
				<td><%= sex %></td>
				<td><%= rs.getString("telephone") %></td>
				<td><%= rs.getInt("score")  %></td>
				<td><a href = "Modification.jsp" >修改成绩</a></td>
			</tr>

	<%

		}

	%>
	</table>
	</form>

	<h2 align="center"><a href = "addStudentInfo.jsp">创建学生身份信息</a></h2>
</body>

</html>
