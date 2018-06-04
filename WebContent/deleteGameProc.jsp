<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");

	String folderName = request.getParameter("folderName");

	String filepath = application.getRealPath("/WEB-INF/game/"+folderName+"/");

	
	File file = new File(filepath); //폴더내 파일을 배열로 가져온다.
	File file1 = new File(filepath+"gameInfo.txt");
	File file2 = new File(filepath+"saveChinese.txt");
	File file3 = new File(filepath+"saveImage.txt");
	
	file1.delete();
	file2.delete();
	file3.delete();
	
	file.delete(); 
	
	
	/* try{

	 File f = new File(filepath); // 파일 객체생성
	 if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
	 result="ok";

	}catch(Exception e){
		result="fail";
	}
	
	out.println(result);
	out.println("왜"); */
	
	//response.sendRedirect("createGameList.jsp");
	
	out.println("<script>window.location.reload();window.location.href = 'createGameList.jsp'; </script>");


%>

</body>
</html>
