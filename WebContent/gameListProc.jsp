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

  <!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css"> -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
     
  <link href="css/gameCard.css" rel="stylesheet">
     
  
</head>
<body>

<div style="padding:20px;text-align:center;overflow:auto;">

<%
BufferedReader reader = null;

try {
	String filepath = application.getRealPath("/WEB-INF/game/");

	File dirFile = new File(filepath);
	File[] fileList = dirFile.listFiles();
	int cnt=0;
	for (File tempFile : fileList) {
		
		String tempFileName = tempFile.getName();
		System.out.println(filepath+tempFileName);
		reader = new BufferedReader(new FileReader(filepath + tempFileName+"/gameInfo.txt"));
		
		String  title = reader.readLine();
		String  w_time= reader.readLine();
		String  creater= reader.readLine();
		String  showImage= reader.readLine();
		String  character= reader.readLine();
		
		

		
		/* 	out.print("<div class='blog-card'><div class='photo photo1' style='background: url(\""+showImage+"\") center no-repeat;background-size: cover;'></div>"
			+"<ul class='details'><li class='author'><a href='#'>작성자 : "+creater+" </a></li>"
			+"<li class='date'>"+w_time+"</li></ul>"
			+"<div class='description'><h1>"+title+"</h1>"
			+"<a href='playingGame.jsp?folderName="+tempFileName+"&character="+character+"'>게임 하러 가기</a></div></div>"); */
			cnt++;
			out.println("<div class='card' style='width:250px;height:350px;display:inline-block;margin:20px;'>"+
			"<div class='card-image waves-effect waves-block waves-light'>"+
			"<img class='activator' src='"+showImage+"' style='height:250px;'></div>"+
			"<div class='card-content' style='text-align:left;'>"+
			"<span class='card-title activator grey-text text-darken-4'>"+title+"<i class='material-icons right'>more_vert</i></span>"+
			"<p><a href='playingGame.jsp?folderName="+tempFileName+"&title="+title+"&character="+character+"'>Go to Play</a></p>"+
			"</div><div class='card-reveal'><span class='card-title grey-text text-darken-4'>"+title+"<i class='material-icons right'>close</i></span>"+
			"<p>생성자 : "+creater+"<br>생성일 : "+w_time+"<br><br><br>캐릭터 : <img src='image/"+character+"' style='width:60px;height:60px;'></p>"+
			"</div></div>");
			if(cnt%3==0)
				out.println("<br>");

	} 

} catch (Exception e) {
	out.println("파일을 읽을 수 없습니다.");
}


%>

</div>

 
            
</body>
</html>
