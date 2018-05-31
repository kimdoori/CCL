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
</head>
<body>
<div id="quizContainer">
<h3>한자 QU!Z !</h3>
<hr>
<form action="checkAnswer.jsp" method="post">
<%
	request.setCharacterEncoding("UTF-8");
	String fileName = request.getParameter("fileName");
	
	BufferedReader reader = null;
	int diccount=0;
	String[] chineseDic = null;

	try {
		String dicFilePath = application.getRealPath("/dic/chineseDic.txt");

		reader = new BufferedReader(new FileReader(dicFilePath));
		
		StringBuffer chinese = new StringBuffer();
		String str;
		while (true) {
			str = reader.readLine();
			if (str == null)
				break;
			String[] answerItem = str.split(",");
			chinese.append(answerItem[0]+":");
			diccount++;
		}
		chineseDic = chinese.toString().split(":");
	} catch (Exception e) {
		out.println("파일을 읽을 수 없습니다.");
	}
	
	/* for(int i=0;i<chineseDic.length;i++){
	 	System.out.println(" chineseDic"+i+" : " + chineseDic[i]);
	} */
	
	
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
			out.println(count+1+". "+item[2]+"  "+item[3]+"<br>");
			int answerIndex = (int)(Math.random() * 4);
			for(int i=0;i<4;i++){
				if(i==answerIndex){
					out.println("<input name='answer"+count+"' type='radio' value='"+item[1]+"' required>"+item[1]);
					continue;
				}
				int randomIndex = (int)(Math.random() * diccount);
				if(item[1].equals(chineseDic[randomIndex])){
					i--;
					continue;
				}
				out.println("<input name='answer"+count+"' type='radio' value='"+chineseDic[randomIndex]+"' required>"+chineseDic[randomIndex]);
			}
			out.println("<br>");
			chinese.append(str+":");
			count++;
		}
		out.println("<input type='hidden' id='answerList' value='"+chinese+"'>");

	} catch (Exception e) {
		out.println("파일을 읽을 수 없습니다.");
	}

%>
<br>
<input type="submit" value="제출">
</form>
</div>
</body>
</html>
