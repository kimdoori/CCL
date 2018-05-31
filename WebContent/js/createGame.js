var chineseStr="";
var deletechineseStr="";
var currentAnswer = 1;


function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    
    
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    var dragObject = document.getElementById(data);
    
    
    if(dragObject.id=="character"){
    	if(ev.target.id.includes("imageAnswer")){
    		ev.target.parentElement.appendChild(dragObject);
    		dragObject.style.position="relative";
    		dragObject.style.top="-85px";
    		dragObject.style.left="-20px";
    		//TODO : 이미지가 있는 테이블에 놓았을 때 
    		checkImageChinese(ev.target.id);
    		return;
    	}
		dragObject.style.position="static";

        ev.target.appendChild(dragObject);

    }else{
  
   	if(ev.target.id == "imageList"){
   		dragObject.style.width="50px";
   		dragObject.style.height="50px";
   		
   	}else{
   		dragObject.style.width="100%";
   		dragObject.style.height="100%";
   	}
    
    ev.target.appendChild(dragObject);
    }
}

var imgCnt=0;
function addImage(path){
	var fileName = path.split("\\");
//	alert(fileName[fileName.length-1]);
	var imageList = document.getElementById("imageList");
	var imageDiv = document.createElement('div');

	
	//C:\fakepath\스크린샷 2018-05-27 오후 3.43.05.png
	imageDiv.innerHTML = "<img src='image/"+fileName[fileName.length-1]+"' style='width:50px;height:50px;'"
	+"draggable='true' ondragstart='drag(event)' id='img"+(imgCnt++)+"'>";
	imageList.appendChild(imageDiv);
	
}

function showChinese(id){
	var chineseContent = document.getElementById(id);
	if(chineseContent.style.visibility == "visible")
		chineseContent.style.visibility="hidden";
	else
		chineseContent.style.visibility="visible";

}

function addChineseToDiv(id){
	var sound = document.getElementById("sound"+id);
	var mean = document.getElementById("mean"+id);
	var chinese = document.getElementById("chinese"+id);
	
	var chineseSpan = document.getElementById("chineseSpan"+id);
	
	var listSpan = document.createElement('span');
	listSpan.id="listSpan"+id;
	var totalParam = id+","+chinese.value+","+mean.value+","+sound.value+"/";
	listSpan.innerHTML ="<span><hr>"+ chinese.value +" : "+ mean.value +" "+sound.value+"<button type='button' onclick=\"deleteChinese(this,'"+totalParam+"')\">x</button></span>";
	chineseSpan.appendChild(listSpan);
	chineseStr+=totalParam;
	sound.value="";mean.value="";chinese.value="";
}


function deleteChinese(button,totalParam){
	alert(totalParam);
	deletechineseStr+=totalParam;
	button.parentElement.remove();
	
}

function saveData(){
	var chinesArray = chineseStr.split("/");
	//deletechineseStr
	document.getElementById("saveChinese").value="";
	document.getElementById("saveImage").value="";
	
	for(var i=0;i<chinesArray.length-1;i++){
		//alert(chinesArray[i]);
		if(!deletechineseStr.includes(chinesArray[i])){
			
			document.getElementById("saveChinese").value+= chinesArray[i]+":";
		}
		
	}
	
	
	for(var i=0;i<4;i++){
		for(var j=0;j<4;j++){
			var place = document.getElementById("place"+i+j).innerHTML;
			if(place!="")
				document.getElementById("saveImage").value+= i+""+j+","+place.substring(place.indexOf("\"")+1,place.indexOf("\"",place.indexOf("\"")+1))+":";
			
		}
	}
}

var chineseAnswer ="";
var meanAnswer ="";
var soundAnswer ="";
var answers;
var answerStr="";
var cnt = 0;

window.onload=init;

function init(){
	var answerList = document.getElementById("answerList").value;
	answers = answerList.split(":");
}


function checkImageChinese(imageID){
	id = imageID.substring(imageID.indexOf("r")+1);
	
	cnt = 0;
	currentAnswer = 1;
	chineseAnswer ="";
	meanAnswer ="";
	soundAnswer ="";
	answerStr="";
	
	for(var i=0;i<answers.length-1;i++){
		//alert(answers[i].substring(0,2));
		if(answers[i].substring(0,2) == id){
			//alert(answers[i]);
			cnt++;
			document.getElementById("chinese_cover").style.display="block";
			answerStr+= answers[i]+":";
			
		}
		
		
	}
	
	if(cnt>1){
		document.getElementById("prev").style.display="inline-block";
		document.getElementById("next").style.display="inline-block";
		
	}else{
		document.getElementById("prev").style.display="none";
		document.getElementById("next").style.display="none";	
	}
	showAnswer(1);
	
}

function showAnswer(num) {
	   
	   //in the next 2 lines, you make sure which isn't lower than 1, and isn't greater than the number of images
		if(num<1) num=1;
		if(num > cnt) num = cnt;
		
		var answerArray = answerStr.split(":");
		var answer = answerArray[num-1].split(",");
		chineseAnswer=answer[1];
		meanAnswer=answer[2];
		soundAnswer=answer[3];
	
	/*   if(num < 1) num = 1;
	   if(num > <%=cnt%>) num = <%=cnt%>;*/
	   currentAnswer=num;
	   document.getElementById("chineseAnswer").innerHTML=chineseAnswer;
	   document.getElementById("meanAnswer").innerHTML=meanAnswer;
	   document.getElementById("soundAnswer").innerHTML=soundAnswer;
	   

	   
}
function goToQuiz(){
	location.href="quiz.jsp";
}