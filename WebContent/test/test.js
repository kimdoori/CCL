/*
미션03: 드래그앤드 드롭만들기
요구사항에 맞게 드래그앤드 드롭 기능을 만들어 주세요.

요구사항 분석
1. 초기 시작 시 컨테이너(.container) 영역의 이미지는 랜덤하게 출력되어야 합니다. 단, 컨테이너 영역을 벗어나면 안 됩니다.
2. 컨테이너 영역의 이미지를 드래그되게 만들어 주세요.
3. 드래그 이미지를 선택 영역에 드롭하는 경우 해당 이미지를 선택 영역으로 이동시켜 주세요.
*/

/*
* step #00
*      - 기본 레이아웃 잡기 
*/

// 하단 영역
var $bannerGroup = $('.con');
var $banner = $bannerGroup.find('img');
var dragCheck = false;
var $dragItem = '';
var startImgX = 0;
var startImgY = 0;
var itemZindex = 0;



// 상단 셀렉터
var $selectPanel = $('.select');
var selectPanelLeft = $selectPanel.offset().left;
var selectPanelTop = $selectPanel.offset().top;
var selectPanelRight = $selectPanel.offset().left + $selectPanel.width();
var selectPanelBottom = $selectPanel.offset().top + $selectPanel.height();


var containerlLeft = $bannerGroup.offset().left;
var containerlTop = $selectPanel.offset().top;
var containerlRight = $bannerGroup.offset().left + $bannerGroup.innerWidth();
var containerlBottom = $selectPanel.offset().top + $selectPanel.height() + $bannerGroup.height();

var feetInCheck = false;


$(document).ready(function(){
	initBannerPos();
	initEvent();
});

// 배너 랜덤 뿌리기
function initBannerPos(){
	var left;
	var top;
	$banner.each(function(){
		left = Math.floor(Math.random()*700);
		top = Math.floor(Math.random()*340);						
		$(this).css({
			top:'50%',
			left:'50%'
		}).animate({
				top:top,
				left:left							
		},300);
	});							
}

function initEvent(){
// 마우스 누를때
	$banner.on('mousedown',function(e){
		dragCheck = true;
		$dragItem = $(this);
		// 클릭한 위치를 구한다
		var offset = $dragItem.offset();		
		startImgX = e.pageX - offset.left;
		startImgY = e.pageY - offset.top;
		$dragItem.css('z-index',itemZindex++);
		activeDragEvent();
	});
	function activeDragEvent(){
		// 마우스 이동 - 드래그대상에 전역위치를 부여한다
		$(document).on('mousemove',function(e){
			if (dragCheck == true){
				

				
				e.preventDefault();
				// 클릭한 위치를 드래그포인트에서 뺴준다
				var top = e.pageY - startImgY;
				var left = e.pageX - startImgX;
				
				if(e.pageX > containerlLeft + startImgX && e.pageX < containerlRight - ($banner.width() - startImgX)) {
					if(e.pageY + startImgY > containerlTop && e.pageY < containerlBottom + startImgY ){
				
						$dragItem.offset({
							top:top,
							left:left
						});
						
					}else if(e.pageX > containerlLeft + startImgX && e.pageX < containerlRight - ($banner.width() - startImgX)) {
		// y값이 더크거나 작을 경우 - X의 영역만 체크해서 left값만 변화주고
						
							$dragItem.offset({
								left:left
							});
						
					
						
					}
				}else if(e.pageY + startImgY > containerlTop && e.pageY < containerlBottom + startImgY ){
					
					
						
							$dragItem.offset({
								top:top
							});
						
					
				}

			}
		});					
		// 마우스 뗄때
		$(document).on('mouseup',function(e){
			// 드롭 위치 처리
			checkSelectArea(e.pageX, e.pageY);
			
			dragCheck = false;
			$dragItem = null;
			$(this).off(); // 이미지끌기를 하지 않을때는 mousemove, mouseup을 작동시키지 않는다
		});
	}
 
	function checkSelectArea(dropX, dropY){
		// 드롭 위치가 리스트 패널 위치인지 판단
		if(dropX > selectPanelLeft && dropX < selectPanelRight){
			if(dropY > selectPanelTop && dropY < selectPanelBottom){
				$selectPanel.append($dragItem);
				$dragItem.off();
			  $dragItem = null;
			}
		}
		
		
	}

	
}