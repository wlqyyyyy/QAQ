/**
 * 
 */
function teacherCheck()
{
	if(document.form1.jobNumber.value==''){
		alert("工号不能为空!");
		return false;
	}
	document.form1.mehtod="post";
	document.form1.action="teacherClass.jsp";
	document.form1.submit();
	return true; 
	}
function studentCheck(){
	if(document.form1.jobNumber.value==''){
		alert("学号不能为空!");
		return false;
	}
	document.form1.action="studentDispose.jsp";
	document.form1.submit();
}