<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="css/game.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/createGame.js"></script>

</head>
<body>
<div id="chinese_cover"
			
			style="cursor: pointer;display:none;">
			<!-- style.display = 'none': click 하면 사라짐 -->

			<img src="image/introBackImage.png"
				style="width: 400px; height: 400px; position: absolute; z-index: 6; top:30%; left:40%;"  >
			<button type="button" style="position: absolute; z-index: 7; top:30%; left:40%;" onclick="document.getElementById('chinese_cover').style.display = 'none';">x</button>
				
			<div style="width: 400px; height: 400px; position: absolute; z-index: 8; top:40%; left:40%; text-align:center; padding:10px;">
			<button type="button" id="prev" onclick="showAnswer(currentAnswer - 1)"><</button>
			<button type="button" id="next" onclick="showAnswer(currentAnswer + 1)">></button><br>
			
			<span id="chineseAnswer" style="font-size:3em;">한자</span><br><br><br>
			<span id="meanAnswer" style="font-size:2em;">뜻</span> 
			<span id="soundAnswer" style="font-size:2em;">음</span>
			
			
			</div>
			
</div>
<div id="title">
<h2>게임 이름</h2>
<p>캐릭터를 드래그 앤 드롭해서 배치하고 싶은 위치에 놓아주세요.</p>
</div>
<div id='home' class='home' ondrop='drop(event)' ondragover='allowDrop(event)'>
	<img src="image/dust3.png" draggable="true" ondragstart="drag(event)" id="character" width="80px" height="80px" style="z-index: 5;">
</div>



<table id="gameTable">

<%
String[] imageArray = null;
String[] chineseArray =null;

BufferedReader reader = null;
String fileName = "2018-05-30-08-29-10";

try {
	String imageFilePath = application.getRealPath("/WEB-INF/game/"+fileName+"/saveImage.txt");

	reader = new BufferedReader(new FileReader(imageFilePath));
	
	StringBuffer images = new StringBuffer();
	String str;
	
	while (true) {
		str = reader.readLine();
		if (str == null)
			break;
		images.append(str+":");
	}
	imageArray = images.toString().split(":");
} catch (Exception e) {
	out.println("파일을 읽을 수 없습니다.");
}

try {
	String chineseFilePath = application.getRealPath("/WEB-INF/game/"+fileName+"/saveChinese.txt");

	reader = new BufferedReader(new FileReader(chineseFilePath));
	
	StringBuffer chinese = new StringBuffer();
	String str;
	
	while (true) {
		str = reader.readLine();
		if (str == null)
			break;
		chinese.append(str+":");
	}
	out.println("<input type='hidden' id='answerList' value='"+chinese+"'>");

} catch (Exception e) {
	out.println("파일을 읽을 수 없습니다.");
}

int imageIndex=0;
int chineseIndex=0;
for(int i=0;i<4;i++){
	out.println("<tr>");
	for(int j=0;j<4;j++){
		out.println("<td><div id='place"+i+j+"' class='place' style='boder:0px' ondrop='drop(event)' ondragover='allowDrop(event)'>");
		for(int k=imageIndex;k<imageArray.length;k++){
			if(imageArray[k].substring(0,2).equals(String.valueOf(i+""+j))){
				
				out.println("<img id='imageAnswer"+i+j+"' src='"+imageArray[k].substring(imageArray[k].indexOf(",")+1)+"' style='width: 100%; height: 100%;'>");
				imageIndex++;
			}
		}
	/* 	for(int k=chineseIndex;k<chineseArray.length;k++){
			if(chineseArray[k].substring(0,2).equals(String.valueOf(i+""+j))){
				out.println("<input type='hidden' id='answer"+i+j+"' value='"+chineseArray[k].substring(chineseArray[k].indexOf(",")+1)+"'>");
				chineseIndex++;
			}
		} */
		out.println("</div>");
		out.println("</td>");
	}
	out.println("</tr>");
}



%>

</table>

<button type="button" onclick="goToQuiz()">퀴즈풀러가기</button>

</body>
</html>
