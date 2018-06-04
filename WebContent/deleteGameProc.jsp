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
	out.println(folderName);

	String filepath = application.getRealPath("/WEB-INF/game/"+folderName+"/");

	deleteAllFiles(filepath);
	
	/* try{

	 File f = new File(filepath); // 파일 객체생성
	 if( f.exists()) f.delete(); // 파일이 존재하면 파일을 삭제한다.
	 result="ok";

	}catch(Exception e){
		result="fail";
	}
	
	out.println(result);
	out.println("왜"); */
	
	response.sendRedirect("createGameList.jsp");
	



%>

<%!
public static void deleteAllFiles(String path){ 

	File file = new File(path); //폴더내 파일을 배열로 가져온다.
	File[] tempFile = file.listFiles();
	if(tempFile.length >0){
		for (int i = 0; i < tempFile.length; i++){
			System.out.println(tempFile[i]);

			if(tempFile[i].isFile()){ 
				tempFile[i].delete();
				
			}else{
				deleteAllFiles(tempFile[i].getPath());
			}
			tempFile[i].delete(); 
		} 
		file.delete(); 
	}

}
%>

</body>
</html>
