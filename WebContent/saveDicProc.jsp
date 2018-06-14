<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
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
	request.setCharacterEncoding("UTF-8");
	String chinese = request.getParameter("chinese");
	String mean = request.getParameter("mean");
	String sound = request.getParameter("sound");

	
	
	File directory = new File(application.getRealPath("/dic/chineseDic.txt"));
	 
	 PrintWriter writer = null;

	String result;
	try{
		//writer = new FileWriter(directory,true);
		writer = new PrintWriter(new FileOutputStream(directory,true));

		String item = chinese+","+mean+","+sound;
		writer.println(item);
		
		writer.flush();
		writer.close();

		result="ok";
	}catch(Exception e){
		out.println("오류발생");
		System.out.println(e);
		result="fail";
	}
	if(result.equals("ok")){
		out.println("<script>alert('성공적으로 추가되었습니다.');location.href='addChinese.jsp';</script>");

	}else{
		out.println("<script>alert('추가에 실패했습니다.');location.href='addChinese.jsp';</script>");

	}
	//response.sendRedirect("addChinese.jsp?send="+result);

%>
</body>
</html>
