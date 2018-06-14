<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String a = "主";
	String b = "主";
	
	if(a.replaceAll(" ","").equals(b.replaceAll(" ",""))){
		out.println("ok");
	}

%>

</body>
</html>
