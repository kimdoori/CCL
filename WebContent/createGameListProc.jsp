<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/card.css">
<link rel="stylesheet" href="css/scroll.css">
<script>
function goToCreate(){
	location.href="createGameInfo.jsp";
}
</script>
</head>
<body>

<button onclick="goToCreate()">새로운 게임 제작</button>


<div class="scroll-container">

<%
BufferedReader reader = null;

try {
	String filepath = application.getRealPath("/WEB-INF/game/");

	File dirFile = new File(filepath);
	File[] fileList = dirFile.listFiles();
	int reviewCnt=0;
	for (File tempFile : fileList) {
		
		String tempFileName = tempFile.getName();
		System.out.println(filepath+tempFileName);
		reader = new BufferedReader(new FileReader(filepath + tempFileName+"/gameInfo.txt"));
		
		String  title = reader.readLine();
		String  w_time= reader.readLine();
		String  creater= reader.readLine();
		String  showImage= reader.readLine();
		

		
			out.print("<div class='blog-card'><div class='photo photo1' style='background: url(\""+showImage+"\") center no-repeat;background-size: cover;'></div>"
			+"<ul class='details'><li class='author'><a href='#'>작성자 : "+creater+" </a></li>"
			+"<li class='date'>"+w_time+"</li></ul>"
			+"<div class='description'><h1>"+title+"</h1>"
			/* "<h2>Opening a door to the future</h2>" */
			+"<a href='modifyGame.jsp?folderName="+tempFileName+"'>수정하기</a></div></div>");
			
		

	} 

} catch (Exception e) {
	out.println("파일을 읽을 수 없습니다.");
}


%>
</div>
</body>
</html>
