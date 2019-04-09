
<%@ page  pageEncoding="UTF-8"  import ="java.sql.*"  import="java.util.*" %>

<html>

<head><title>显示学生信息</title></head>

<body>

	<%! String sNumber , sname , sex ,telephone , home ; int age ,score;%>

	<%

		String jobNumber = request.getParameter("jobNumber");

		Connection con;

		PreparedStatement pstmt;

		ResultSet rs=null;

		String sql=null;

		String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";

		String url = "jdbc:sqlserver://localhost:1433;DatabaseName=LCBCom";

		String user = "sa";

		String userPassword = "123";

		Class.forName(driver);

		con = DriverManager.getConnection(url , user , userPassword);

		sql="select s# , sname , score,age,sex,telephone,home  from S  where s#=? ";

		pstmt = con.prepareStatement(sql);

		pstmt.setString(1 , jobNumber);

		rs = pstmt.executeQuery();

		if(rs.next())

		{ 



		  sNumber= rs.getString("s#");   //String 是 s#报错重复的变量s# , 为什么?

		  sname = rs.getString("sname");

		  score = rs.getInt("score");

		  age = rs.getInt("age");

		  sex = rs.getString("sex");

		  telephone = rs.getString("telephone");

		  home  = rs.getString("home");

		if(sex.equals("M"))

		{

			sex="男";

		}

		else

		{

			sex="女";

		}

		rs.close();

		pstmt.close();

		con.close();



		//将学生用户信息存储在session中

		session.setAttribute("sNumber" ,  sNumber );  //直接写变量,不用放在表达式里

		session.setAttribute("sname"  , sname );

		session.setAttribute("score"  , score );

		session.setAttribute("age"  , age );

		session.setAttribute("sex" , sex );

		session.setAttribute("telephone" ,   telephone);

		session.setAttribute("home" ,  home );

	}

	else{





	%>

	<jsp:forward page="numberError.jsp" >

		<jsp:param name="jobNumber" value="<%= jobNumber %>"  />

	</jsp:forward>

	<%

		}

	%>

	<h2 align="center">你的信息如下:</h2>

	<form   method="post" name=form2 action="studentModification.jsp"  >

	<table  align="center">

		<tr><th>学号:</th><td><%= sNumber %></td></tr>

		<tr><th>姓名:</th><td><%= sname  %></td></tr>

		<tr><th>年龄:</th><td><%= age %></td></tr>

		<tr><th>成绩:</th><td><%= score %></td></tr>

		<tr><th>性别:</th><td><%= sex  %></td></tr>

		<tr><th>联系方式:</th><td><%= telephone %></td></tr>

		<tr><th>居住地:</th><td><%= home %></td></tr>

		<tr><th>修改个人信息:</th><td><input type="submit" value="提交" ></td></tr> 

</body>

</html>
