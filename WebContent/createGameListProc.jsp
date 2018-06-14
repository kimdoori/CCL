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
<style>
.button{
   background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    width:150px;
    heigth:100px;
    padding:10px;
    margin:10px;
}
.button:hover {
    background-color: #008CBA;
    color: white;
}
#create-button{
	margin-right:500px;
	text-align:right;
}
</style>
<script>
function goToCreate(){
	location.href="createGameInfo.jsp";
}
</script>
</head>
<body>
<center><h2>게임 관리</h2></center>
<div id="create-button">
<button class="button" onclick="goToCreate()">새로운 게임 제작</button>
</div>

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
			+"<p class='summary'><a href='modifyGame.jsp?folderName="+tempFileName+"'>수정하기</a><br><br>"
			+"<a href='deleteGame.jsp?folderName="+tempFileName+"'>삭제하기</a></p></div></div>");
			
		

	} 
	reader.close();

} catch (Exception e) {
	out.println("파일을 읽을 수 없습니다.");
}


%>
</div>
</body>
</html>
