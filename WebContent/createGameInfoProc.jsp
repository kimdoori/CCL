<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/form.css">

</head>
<body>
<div id="infoContainer">
<h3>게임 정보 입력</h3>
<form action="createMainGame.jsp" method="get">
<input type="text" name="title" placeholder="게임 제목" required><br>
<input type="text" name="writer" placeholder="제작자 이름" required><br>
<input type="text" name="showImage" placeholder="대표이미지" required><br>
캐릭터 이미지 <br><input type="file" name="character" />
<!-- 연령대?? -->
<br>
<input type="submit" value="게임 제작하러 가기">
</form>
</div>
</body>
</html>
