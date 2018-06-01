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
<%

	request.setCharacterEncoding("UTF-8");

	String title = request.getParameter("title");
	String creater = request.getParameter("writer");
	String showImage = request.getParameter("showImage");
	String character = request.getParameter("character");


%>
<div id="title">
<h2>게임 화면을 구성해주세요.</h2>
<p>이미지를 드래그 앤 드롭해서 배치하고 싶은 위치에 놓아주세요.</p>
</div>

<div id="selectGroup">
이미지 추가하기
<br>
<input type="file" id="fileup1" onchange="addImage(this.value);" />
<hr>
<div id="imageList" ondrop="drop(event)" ondragover="allowDrop(event)">
</div>
</div>
<br>


<table id="gameTable">

<%
	for(int i=0;i<4;i++){
		out.println("<tr>");
		for(int j=0;j<4;j++){
			out.println("<td><div class='addGroup'><button type='button' onclick=\"showChinese('content"+i+j+"')\">+</button>"+
			"<span id='content"+i+j+"' class='addChinese'>"+
			"<input type='text' id='mean"+i+j+"' name='mean' size='3' placeholder='뜻'> <input type='text' id='sound"+i+j+"' name='sound' size='3' placeholder='음'>"+
			"<input type='text' id='chinese"+i+j+"' name='chinese' size='4' placeholder='한자'><br><br><button type='button' onclick=\"addChineseToDiv('"+i+j+"')\">추가</button>"+
			"<span id='chineseSpan"+i+j+"'></span></span></div>"+
			"<br><div id='place"+i+j+"' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td>");
		}
		out.println("</tr>");
	}

%>
</table>
<br>
<form action="saveGameProc.jsp" method="post">
<input type="hidden" name="title" value="<%=title%>">
<input type="hidden" name="creater" value="<%=creater%>">
<input type="hidden" name="showImage" value="<%=showImage%>">
<input type="hidden" name="character" value="<%=character%>">


<input id="saveChinese" name="saveChinese" type="hidden">
<input id="saveImage" name="saveImage" type="hidden">

<button type="button" onclick="saveData()">저장</button>
<input type="submit" value="제작">

</form>
</body>
</html>
