var chineseStr="";
var deletechineseStr="";


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
    	if(ev.target.id == "image"){
    		ev.target.parentElement.appendChild(dragObject);
    		dragObject.style.position="relative";
    		dragObject.style.top="-85px";
    		dragObject.style.left="-20px";
    		
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