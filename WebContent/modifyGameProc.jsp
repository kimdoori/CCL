<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" href="css/game.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/createGame.js"></script>

</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");

		String title = request.getParameter("title");
		String creater = request.getParameter("writer");
		String showImage = request.getParameter("showImage");
	%>
	<div id="title">
		<h2>게임 화면을 구성해주세요.</h2>
		<p>이미지를 드래그 앤 드롭해서 배치하고 싶은 위치에 놓아주세요.</p>
	</div>

	<div id="selectGroup">
		이미지 추가하기 <br> <input type="file" id="fileup1"
			onchange="addImage(this.value);" />
		<hr>
		<div id="imageList" ondrop="drop(event)" ondragover="allowDrop(event)">
		</div>
	</div>
	<br>


	<table id="gameTable">

		<%
			request.setCharacterEncoding("UTF-8");
			String fileName = request.getParameter("folderName");

			String[] imageArray = null;
			String[] chineseArray = null;
			String alreadyChinese ="";
			BufferedReader reader = null;

			try {
				String imageFilePath = application.getRealPath("/WEB-INF/game/" + fileName + "/saveImage.txt");

				reader = new BufferedReader(new FileReader(imageFilePath));

				StringBuffer images = new StringBuffer();
				String str;

				while (true) {
					str = reader.readLine();
					if (str == null)
						break;
					images.append(str + ":");
				}
				imageArray = images.toString().split(":");
			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}

			try {
				String chineseFilePath = application.getRealPath("/WEB-INF/game/" + fileName + "/saveChinese.txt");

				reader = new BufferedReader(new FileReader(chineseFilePath));

				StringBuffer chinese = new StringBuffer();
				String str;

				while (true) {
					str = reader.readLine();
					if (str == null)
						break;
					chinese.append(str + ":");
				}
				chineseArray = chinese.toString().split(":");
				out.println("<input type='hidden' id='answerList' value='" + chinese + "'>");

			} catch (Exception e) {
				out.println("파일을 읽을 수 없습니다.");
			}

			int imageIndex = 0;
			int chineseIndex = 0;

			
	
			
			
			for(int i=0;i<4;i++){
				out.println("<tr>");
				for(int j=0;j<4;j++){
					out.println("<td>");
					
					//+버튼 div 시작
					out.println("<div class='addGroup'>");
					out.println("<button type='button' onclick=\"showChinese('content"+i+j+"')\">+</button>");
					
					//+누르면 뜰 내용 span 시작
					out.println("<span id='content"+i+j+"' class='addChinese'>");
					out.println("<input type='text' id='mean"+i+j+"' name='mean' size='3' placeholder='뜻'> <input type='text' id='sound"+i+j+"' name='sound' size='3' placeholder='음'>"+
							"<input type='text' id='chinese"+i+j+"' name='chinese' size='4' placeholder='한자'><br><br><button type='button' onclick=\"addChineseToDiv('"+i+j+"')\">추가</button>");
					
					//저장되어있는 한자 리스트 span 시작
					out.println("<span id='chineseSpan"+i+j+"'>");
					
					for(int k=chineseIndex;k<chineseArray.length;k++){
						if(chineseArray[k].substring(0, 2).equals(String.valueOf(i + "" + j))){
							String[] item = chineseArray[k].split(",");
							String buttonParam = i+""+j+","+item[1]+","+item[2]+","+item[3]+"/";
							alreadyChinese+=buttonParam;
							out.println("<span id="+i+j+">");
							out.println("<span><hr>");
							
							out.print(item[1] +" : "+ item[2] +" "+item[3]+"<button type='button' onclick=\"deleteChinese(this,'"+buttonParam+"')\">x</button>");
							out.println("</span>");
							out.println("</span>");
							
						
							
							
							chineseIndex++;
						}
						
					}
					
					//저장되어있는 한자 리스트 span 끝
					out.println("</span>");
							
					//+누르면 뜰 내용 span 끝
					out.println("</span>");
					
					//+버튼 div 끝
					out.println("</div>");
					
					
					out.println("<br>");
					//이미지 div 열기
					out.println("<div id='place"+i+j+"' class='place' ondrop='drop(event)' ondragover='allowDrop(event)'>");
					
					for (int k = imageIndex; k < imageArray.length; k++) {
						if (imageArray[k].substring(0, 2).equals(String.valueOf(i + "" + j))) {
							if(!imageArray[k].substring(imageArray[k].indexOf(",") + 1).equals("")){

							out.println("<img src='"
									+ imageArray[k].substring(imageArray[k].indexOf(",") + 1)
									+ "' style='width: 100%; height: 100%;' id='img" + i + j + "'>");
							imageIndex++;
							
							}
						}
					}
					
					out.println("</div>");
					//이미지 div 닫기
					
					out.println("</td>");

				}
				out.println("</tr>");
				
			}
			
		%>

	</table>
	<br>
	<form action="saveModifyGameProc.jsp" method="post">
	<input type="hidden" name="fileName" value="<%=fileName %>">
	<input type="hidden" name="title" value="<%=title%>">
	<input type="hidden" name="creater" value="<%=creater%>">
	<input type="hidden" name="showImage" value="<%=showImage%>">
	<input type="hidden" id="alreadyChinese" name="alreadyChinese" value="<%=alreadyChinese%>">
	<input id="saveChinese" name="saveChinese" type="hidden">
	<input id="saveImage" name="saveImage" type="hidden">

		<button type="button" onclick="saveModifyData()">저장</button>
		<input type="submit" value="제작">

	</form>
</body>
</html>
