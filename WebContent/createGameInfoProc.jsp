<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">
<style>
.button{
   background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    width:80%;
    heigth:150px;
    padding:10px;
    margin:10px;
}
.button:hover {
    background-color: #008CBA;
    color: white;
}
#button_div{
	text-align:center;
}
</style>
</head>
<body>
<div id="infoContainer">
<h3>게임 정보 입력</h3>
<form action="createMainGame.jsp" method="get">
<input class="input" type="text" name="title" placeholder="게임 제목" required><br>
<input  class="input" type="text" name="writer" placeholder="제작자 이름" required><br>
<input  class="input" type="text" name="showImage" placeholder="대표이미지" required><br>
캐릭터 이미지 <br><input type="file" name="character" />
<!-- 연령대?? -->
<br>
<input class="button" type="submit" value="게임 제작하러 가기">
</form>
</div>
</body>
</html>
