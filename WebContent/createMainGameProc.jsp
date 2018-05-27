<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<style>
body,html{
	margin:0px;
	padding:0px;
	width:100%;
	height:100%;
}
#title{
	width:100%;
	margin:auto;
	padding:10px;
}

#imageList{

	width:100%;
	heigh:80px;
	margin:auto;
	padding:10px;
	overflow:auto;
	
	
}
#gameTable{
	margin:auto;
}
.place{
    width: 150px;
    height: 150px;
    margin: 1px;
    padding: 10px;
    border: 1px solid black;
}
#selectGroup{
	text-align:left;
	width:80%;
	margin:auto;
	border: 1px solid black;
	
}

</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/createGame.js"></script>

</head>
<body>

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
			out.println("<td><div id='place"+i+j+"' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'></div></td>");
		}
		out.println("</tr>");
	}

%>
</table>
<br>

</body>
</html>
