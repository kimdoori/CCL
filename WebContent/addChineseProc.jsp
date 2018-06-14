<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#chinese{
width:30%;
text-align:center;
border:1px solid gray;
margin:30px auto;
font-size:1.2em;

}
#container{
text-align:center;
}
</style>
</head>
<body>
<div id="container">
<form action="saveDic.jsp" method="get">
<input type="text" name="chinese" placeholder="한자">
<input type="text" name="mean" placeholder="뜻">
<input type="text" name="sound" placeholder="음">
<input type="submit" value="추가">
</form>
<table id="chinese" border="1">
<tr>
<th>한자</th>
<th>뜻</th>
<th>음</th>

</tr>
<%

	
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
			out.println("<tr>");
			
			String[] answerItem = str.split(",");
			out.println("<td>"+answerItem[0]);
			chinese.append(answerItem[0]+":");
			out.println("</td>");
			out.println("<td>"+answerItem[1]);
			mean.append(answerItem[1]+":");
			out.println("</td>");
			out.println("<td>"+answerItem[2]);
			sound.append(answerItem[2]+":");
			out.println("</td>");

			out.println("</tr>");

			diccount++;
		}
		chineseDic = chinese.toString().split(":");
		chineseDic_mean = mean.toString().split(":");
		chineseDic_sound = sound.toString().split(":");
		
	} catch (Exception e) {
		out.println("파일을 읽을 수 없습니다.");
	}
	
%>
	
</table>
</div>
</body>
</html>
