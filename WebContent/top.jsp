<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body,html{
padding:0px;
margin:0px;
}

.top-menu-container {
    position: relative;
    display: inline-block;
    width:200px;
}

.top-menu-btn { 
    min-width: 100px;
   background-color:rgb(0,0,30,0);
	color:#5cc461;
    padding: 13px;
    font-size: 20px;
    border: none;
    cursor: pointer;
  /*   font-family:'HELLO DENVER DISPLAY BOLD Bold','neon'; */
}

.top-menu-btn a { 
    text-decoration: none;
}
.login-menu-btn { 
   background-color:rgb(0,0,30,0);
    color:#78E678;
    padding: 8px;
    font-size: 20px;
    border: none;
    cursor: pointer;
    margin-right:30px;
  /*   font-family:'HELLO DENVER DISPLAY BOLD Bold','neon'; */
}


.top-menu-container:hover .top-menu-detail {
    display: block;

}

.top-menu-container:hover .top-menu-btn {
   font-weight:bold;
}
.top-menu-container:hover .login-menu-btn {
   font-weight:bold;
}
 
#top{
  /* 	position: fixed; */
	background-color:rgb(0,0,30,0);
	margin: 0px;
  	width: 100%;
  	marin-top:0px;
}

.area {
  margin: 0;
  padding: 0;
  display: -webkit-box;
  display: -moz-box;
  display: -ms-flexbox;
  display: -moz-flex;
  display: -webkit-flex;
  display: flex;
  justify-content: space-between;
  list-style: none;
}

.area:before {
  display: inline-block;
  width: 1px;
  content: '';
}

.area:after {
  display: inline-block;
  width: 1px;
  content: '';
}

.item {
  display: inline-block;
  color: #fff;
  text-align: center;
  line-height: 30px;
}
#user{
	color:#5cc461;
	    padding: 8px;
	    font-size: 20px;
	    margin-right:30px;

}
h1{
	font-family: 'Bowlby One SC', cursive;
	color:#5cc461;
}
h1 a{
text-decoration: none;
}
</style>
</head>
<body>
<table width="100%">
<tr>
<td>
<div style="text-align:right;padding-right:100px;">
<%
	request.setCharacterEncoding("UTF-8");
	String userName = (String)session.getAttribute("name");
	if(userName!=null){
	out.print("<span id='user'>"+userName+"님 환영합니다.</span>");
	out.print("<a href='signout.jsp'><button class='login-menu-btn'>Sign out</button></a>");
	}else{
		out.print("<a href='signin.jsp'><button class='login-menu-btn'>Sign in</button></a>");
		out.print("<a href='signup.jsp'><button class='login-menu-btn'>Sign up</button></a>");
	}

	
%>
</div></td>
</tr>
<tr>
<td>
<div style="text-align:center;padding:8px;">
<h1><a href='join.jsp'>SURVEY</a></h1>
</div>
</td>
</tr>

<tr>
<td style="border-top:2px solid #5cc461;border-bottom:2px solid #5cc461;">
<div id="top">

 <ul class="area">

<li class="item">
<div class="top-menu-container">
  <a href="join.jsp"><button class="top-menu-btn">설문참여</button></a>
  
</div>
</li>
<li class="item">
<div class="top-menu-container">
  <a href="createSurvey.jsp"><button class="top-menu-btn">설문작성</button></a>

</div>
</li>
<li class="item">
<div class="top-menu-container">
  <a href="mySurvey.jsp"><button class="top-menu-btn">내 설문</button></a>
 
</div>
</li>
</ul>

</div>
</td>
</tr>
</table>


</body>
</html>
