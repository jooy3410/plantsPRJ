<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
    
%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>redirect</title>
</head>
<body>

<body>
	<script type="text/javascript">
	if(<%=msg.length()>0%>){
		alert("<%=msg%>");
	}
	window.location.replace("<%=url%>");
</script>


</body>
</html>