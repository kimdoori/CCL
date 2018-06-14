<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>퀴즈</title>
<link rel="stylesheet" href="css/quiz.css">
<script>
function goBack(){
	history.back();
}
</script>
<style>

#question{
	font-size:1.3em;
}
</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=UTF-8");
%>
<div id="quizContainer">
<button class="back" type="button" onclick="goBack()"><</button>

<h3>한자 QU!Z !</h3>
<hr>
<form action="checkAnswer.jsp" method="get">
<%



	String fileName = request.getParameter("fileName");
	
	BufferedReader reader = null;
	int diccount=0;
	String[] chineseDic = null;
	String[] chineseDic_mean = null;
	String[] chineseDic_sound = null;

	try {
		String dicFilePath = application.getRealPath("/dic/chineseDic.txt");

		reader = new BufferedReader(new FileReader(dicFilePath));
		
		StringBuffer chinese = new StringBuffer();
		StringBuffer mean = new StringBuffer();
		StringBuffer sound = new StringBuffer();
		
		String str;
		while (true) {
			str = reader.readLine();
			if (str == null)
				break;
			String[] answerItem = str.split(",");
			chinese.append(answerItem[0]+":");
			mean.append(answerItem[1]+":");
			sound.append(answerItem[2]+":");
			
			diccount++;
		}
		chineseDic = chinese.toString().split(":");
		chineseDic_mean = mean.toString().split(":");
		chineseDic_sound = sound.toString().split(":");
		
	} catch (Exception e) {
		out.println("파일을 읽을 수 없습니다.");
	}
	
	/* for(int i=0;i<chineseDic.length;i++){
	 	System.out.println(" chineseDic"+i+" : " + chineseDic[i]);
	} */
	
	out.println("<span id='question'>");
	try {
		String chineseFilePath = application.getRealPath("/WEB-INF/game/"+fileName+"/saveChinese.txt");

		reader = new BufferedReader(new FileReader(chineseFilePath));
		
		StringBuffer chinese = new StringBuffer();
		String str;
		int count=0;
		while (true) {
			str = reader.readLine();
			if (str == null)
				break;
			String[] item = str.split(","); 
			out.println((count+1)+". "+item[2]+"  "+item[3]+"<br>");
			int answerIndex = (int)(Math.random() * 4);
			for(int i=0;i<4;i++){
				if(i==answerIndex){
					out.println("<input name='answer"+count+"' type='radio' value='"+item[1]+","+item[2]+","+item[3]+"' required>"+item[1]);
					continue;
				}

				int randomIndex = (int)(Math.random() * diccount);
				//System.out.println("item[1] : "+item[1]+"     chineseDic[randomIndex] : "+chineseDic[randomIndex]);

				if(item[1].equals(chineseDic[randomIndex])){
					System.out.println(" 같다 item[1] : "+item[1]+"     chineseDic[randomIndex] : "+chineseDic[randomIndex]);
					i--;
					continue;
				}
				out.println("<input name='answer"+count+"' type='radio' value='"+chineseDic[randomIndex]+","+chineseDic_mean[randomIndex]+","+chineseDic_sound[randomIndex]+"' required>"+chineseDic[randomIndex]);
			}
			out.println("<br><br>");
			chinese.append(str+":");
			count++;
		}
		out.println("<input type='hidden' name='chinese' id='answerList' value='"+chinese+"'>");

		out.println("<input type='hidden' name='count' id='count' value='"+count+"'>");

	} catch (Exception e) {
		out.println("파일을 읽을 수 없습니다.");
	}
	out.println("</span>");

%>
	

<br>
<input type="submit" class="button" value="제출">

</form>
</div>
</body>
</html>
