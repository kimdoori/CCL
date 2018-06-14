<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/layout.css">
<title>Insert title here</title>
<script>
function goToManage(){
	
	var pw = prompt("관리자 비밀번호를 입력해주세요.", "");
	if (pw != null && pw == "0228") {
	    location.href = "createGameList.jsp";
	}
	
}

</script>
</head>
<body>
<table width="100%" border="0">
<tr>
<td>
<div style="text-align:right;padding-right:100px;border:0px">
	<a href='#'><button class='modeButton' onclick="goToManage()">게임 관리</button></a>
</div></td>
</tr>
<tr>
<td>
<div style="text-align:center;padding:8px;">
<h1 class="logo"><a href='index.jsp'>CCL</a></h1>
</div>
</td>
</tr>

<tr>
<td style="border-top:2px solid #039be5;border-bottom:2px solid #039be5;">
<div id="top">

 <ul class="area">

<li class="item">
<div class="top-menu-container">
  <a href="gameList.jsp"><button class="top-menu-btn">게임 참여</button></a>
  
</div>
</li>
<!-- <li class="item">
<div class="top-menu-container">
  <a href="createSurvey.jsp"><button class="top-menu-btn">설문작성</button></a>

</div>
</li>
<li class="item">
<div class="top-menu-container">
  <a href="mySurvey.jsp"><button class="top-menu-btn">내 설문</button></a>
 
</div>
</li> -->
</ul>

</div>
</td>
</tr>
</table>


</body>
</html>
