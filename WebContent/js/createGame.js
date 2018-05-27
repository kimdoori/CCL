function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
    
    
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
   
    ev.target.appendChild(document.getElementById(data));
}

var imgCnt=0;
function addImage(path){
	var fileName = path.split("\\");
//	alert(fileName[fileName.length-1]);
	var imageList = document.getElementById("imageList");
	var imageDiv = document.createElement('div');
	imageDiv.style.width="50px";
	imageDiv.style.height="50px";
	
	//C:\fakepath\스크린샷 2018-05-27 오후 3.43.05.png
	imageDiv.innerHTML = "<img src='image/"+fileName[fileName.length-1]+"' style='width:100%;height:100%;'"
	+"draggable='true' ondragstart='drag(event)' id='img"+(imgCnt++)+"'>";
	imageList.appendChild(imageDiv);
	
}