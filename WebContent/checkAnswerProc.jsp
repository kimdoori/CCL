<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/quiz.css">
<script>
function goBack(){
	history.back();
}
</script>

</head>
<body>
<div id="quizContainer">
<%	

 	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	int count = Integer.valueOf(request.getParameter("count"));
	
	
	String chinese = request.getParameter("chinese");
	String[] chineseList =chinese.split(":");

	
 
	
	for (int i=0;i<count;i++){
		String answer = request.getParameter("answer"+i);
		String[] item = chineseList[i].split(",");
		String span="";
		if(item[1].equals(answer)){
			span="<span style='font-weight:bold;font-size:1em;color:red;position:relative; left:-50px;'> O</span>";
		}else{
			span="<span style='font-weight:bold;font-size:1em;color:red;position:relative; left:-50px;'> X</span>";
			
		}
		out.println("<h3>"+(i+1)+". "+span+item[2]+" "+item[3]+" "+item[1]+"</h3>");
		
		out.print("선택한 답 : "+answer);
		
		
		
	}


%>
<br>
<button onclick="goBack()" class="button">퀴즈 다시 풀기</button>
</div>
</body>
</html>
