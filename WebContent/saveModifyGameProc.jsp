<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
	String fileName = request.getParameter("fileName");
	String title = request.getParameter("title");
	String creater = request.getParameter("creater");
	String showImage = request.getParameter("showImage");
	String saveChinese = request.getParameter("saveChinese");
	String saveImage = request.getParameter("saveImage");
	
	Date date = new Date();
	SimpleDateFormat simpleTime = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");

	String w_time = simpleTime.format(date);
	
	String chineseFilePath = application.getRealPath("/WEB-INF/game/"+fileName+"/saveChinese.txt");
	String imageFilePath = application.getRealPath("/WEB-INF/game/"+fileName+"/saveImage.txt");

	File directory = new File(application.getRealPath("/WEB-INF/game/"+fileName+"/"));
	 if(!directory.exists()){
           //디렉토리 생성 메서드
           directory.mkdirs();
     }
	PrintWriter writer = null;

	String result1;
	try{
		writer = new PrintWriter(chineseFilePath);
		
		String[] saveChineseArray = saveChinese.split(":");
		for(int i=0;i<saveChineseArray.length;i++){
			writer.printf("%s%n",saveChineseArray[i]);
		}
		
		writer.flush();
		writer.close();

		result1="ok";
	}catch(Exception e){
		out.println("오류발생");
		result1="fail";
	}
	
	writer = null;

	String result2;
	try{
		writer = new PrintWriter(imageFilePath);
		
		String[] saveImageArray = saveImage.split(":");
		
		for(int i=0;i<saveImageArray.length;i++){
			writer.printf("%s%n",saveImageArray[i]);
		}
		
		writer.flush();
		writer.close();

		result2="ok";
	}catch(Exception e){
		out.println("오류발생");
		result2="fail";
	}
	
	String result3;
	
	
	response.sendRedirect("createGameList.jsp?send1="+result1+"&send2="+result2);

%>
</body>
</html>
