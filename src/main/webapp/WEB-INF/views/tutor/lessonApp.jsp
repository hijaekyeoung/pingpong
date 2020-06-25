<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header.jsp"/>
<script	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<style>
html, body {
	background-color: #FFFFFF;
	font-family: 'Roboto', sans-serif;
}

.main {
	width: 100%;
	display: block;
}

.content-wrap_01 {
	width: 30%;
	border: 4px solid rgba(161, 161, 161, 0.5);
	overflow: hidden;
	background: white;
}

.content-wrap_02 {
	width: 30%;
	margin: 0 auto;
	border: 4px solid rgba(161, 161, 161, 0.5);
	overflow: hidden;
	background: white;
}

.del-data {
	display: block;
	float: left;
	width: 10%;
	cursor: pointer;
	font-size: 10px;
	padding: 10px;
	background: #0b0809;
	border: none;
	border-radius: 10px;
}

.content-right {
	float: left;
	width: 100%;
	padding: 10px;
}

.sun {
	color: #ef3333;
}

.sat {
	color: #2107e0;
}

.content-right table tr td {
	width: 40px;
	height: 20px;
	text-align: center;
	font-size: 9px;
	font-weight: bold;
}

.active {
	background: #0b0809;
	border-radius: 50%;
	color: #ffffff;
}

.title_left {
	float: left;
}

#title {
	width: 70%;
}

@media ( min-width : 850px) {
	.main {
		float: left;
		display: flex;
		align-items: center;
		justify-content: center;
		width: 100vw;
		height: 100vh;
	}
	.content-wrap_01 {
		width: 30%;
		border: 4px solid rgba(161, 161, 161, 0.5);
		overflow: hidden;
		background: white;
	}
	.content-wrap_02 {
		width: 30%;
		margin: 0 auto;
		border: 4px solid rgba(161, 161, 161, 0.5);
		overflow: hidden;
		background: white;
	}
	.content-right {
		float: left;
		width: 100%;
		padding: 20px 20px 20px 20px;
	}
	.sun {
		color: #ef3333;
	}
	.sat {
		color: #2107e0;
	}
	.content-right table tr td {
		width: 50px;
		height: 50px;
		text-align: center;
		font-size: 20px;
		font-weight: bold;
	}
	.active {
		background: #0b0809;
		border-radius: 50%;
		color: #ffffff;
	}
	.left {
		float: left;
	}
	#title {
		width: 70%;
	}
}
</style>

<script>

$(function(){
   $(".content-wrap_01").hide();
   $(".content-wrap_02").hide();   

   var currentTitle_01 = document.getElementById('current-year-month_01');
   var currentTitle_02 = document.getElementById('current-year-month_02');
   //var currentTitle = $(".current-year-month");
   var calendarBody_01 = document.getElementById('calendar-body_01');
   var calendarBody_02 = document.getElementById('calendar-body_02');
   //var calendarBody = $(".calendar-body");
   console.log(calendarBody_01);

   var today = new Date(); //오늘의 날짜 연도, 요일등의 정보 모두 담기 
   var first = new Date(today.getFullYear(), today.getMonth(), 1);

   var dayList = [ 'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday',
         'Friday', 'Saturday' ];
   var monthList = [ 'January', 'February', 'March', 'April', 'May',
         'June', 'July', 'August', 'September', 'October', 'November',
         'December' ];
   var leapYear = [ 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]; // 1월~ 12월까지 총 일수
   var notLeapYear = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]; // 1월~ 12월까지 총 일수

   var pageFirst = first;
   var pageYear;

   if (first.getFullYear() % 4 === 0) { //윤년체크
      pageYear = leapYear; //윤년일때  
   } else {
      pageYear = notLeapYear; //윤년아닐때 
   }
      
   //-----------------------달력 만들기

   function showCalendar(calendarBody, currentTitle) {
	  //console.log($(calendarBody).closest('table').attr('id'));
	  //console.log($(currentTitle).closest('table').attr('id'));
      currentTitle.innerHTML=monthList[today.getMonth()]+'&nbsp;&nbsp;&nbsp;&nbsp;' + today.getFullYear();
      let monthCnt = 100;
      let cnt = 1;

      for (var i = 0; i < 6; i++) { //주 만들기(최대 6주)
         var $tr = document.createElement('tr');
         $tr.setAttribute('id', monthCnt);
         for (var j = 0; j < 7; j++) { //일 만들기
            if ((i === 0 && j < first.getDay()) //만약 첫번째 주라면 시작하는 요일부터 날짜를 출력 
                  || cnt > pageYear[first.getMonth()]) { //달력 출력 종료 조건
               var $td = document.createElement('td');
               $tr.appendChild($td);
            } else {
               var $td = document.createElement('td');
               $td.textContent = cnt;
               $td.setAttribute('class', cnt);
               $tr.appendChild($td);
               cnt++;
            }
         }
         monthCnt++;
         calendarBody.append($tr);
      }
   }

   showCalendar(calendarBody_01, currentTitle_01);
   showCalendar(calendarBody_02, currentTitle_02); 
   
   function removeCalendar(calendarBody) {
       $(calendarBody).empty();
    }
   
   $("#cal1").on("click", function(){
      $(".content-wrap_01").show();
      $(".content-wrap_02").hide(); 
   })
   $("#cal2").on("click", function(){
      $(".content-wrap_02").show();
      $(".content-wrap_01").hide();
   })
   
   
   //--------------------달 이동하기
   function prev(calendarBody, currentTitle) {
      console.log($(calendarBody).closest('table').attr('id'));	//부모테이블에 id속성 찾아라 
      if (pageFirst.getMonth() === 1) {
         pageFirst = new Date(first.getFullYear() - 1, 12, 1);
         first = pageFirst;
         if (first.getFullYear() % 4 === 0) {
            pageYear = leapYear;
         } else {
            pageYear = notLeapYear;
         }
      } else {
         pageFirst = new Date(first.getFullYear(), first.getMonth() - 1,
               1);
         first = pageFirst;
      }

      today = new Date(today.getFullYear(), today.getMonth() - 1, today
            .getDate());

      currentTitle.innerHTML=monthList[today.getMonth()]+'&nbsp;&nbsp;&nbsp;&nbsp;' + today.getFullYear();
      removeCalendar(calendarBody);
      showCalendar(calendarBody, currentTitle);
      
      clickedDate1 = $("."+today.getDate());
      //clickedDate1 = document.getElementById(today.getDate());
      
      console.log(clickedDate1);
      $(clickedDate1).addClass('active');
      //$(clickedDate1).classList.add('active'); 
      clickStart();

   }
   $("#prev").on("click", function() {
	 // console.log($(prev).find('table').attr('id'));
    	prev(calendarBody_01,currentTitle_01);
   })
   $("#prev_02").on("click", function() {
      prev(calendarBody_02,currentTitle_02);
   })  
   
   
   function next(calendarBody, currentTitle) {
      if (pageFirst.getMonth() === 12) {
         pageFirst = new Date(first.getFullYear() + 1, 1, 1);
         first = pageFirst;
         if (first.getFullYear() % 4 === 0) {
            pageYear = leapYear;
         } else {
            pageYear = notLeapYear;
         }
      } else {
         pageFirst = new Date(first.getFullYear(), first.getMonth() + 1,
               1);
         first = pageFirst;
      }
      today = new Date(today.getFullYear(), today.getMonth() + 1, today
            .getDate());
      currentTitle.innerHTML=monthList[today.getMonth()]+'&nbsp;&nbsp;&nbsp;&nbsp;' + today.getFullYear();
      removeCalendar(calendarBody);
      showCalendar(calendarBody, currentTitle);

      clickedDate1 = $("."+today.getDate());
      $(clickedDate1).addClass('active');
      //clickedDate1.classList.add('active'); 
      clickStart();
   }
   
   $("#next").on("click", function() {
      next(calendarBody_01,currentTitle_01);
   })
   $("#next_02").on("click", function() {
      next(calendarBody_02,currentTitle_02);
   })

   //----------------------------누르면 색상 변하기

   clickedDate1 = $("."+today.getDate());
   console.log(clickedDate1);
   $(clickedDate1).addClass('active');

   var prevBtn = $("#prev");
   var nextBtn = $("#next");
   prevBtn.click;
   nextBtn.click;
   
   var prevBtn_02 = $("#prev_02");
   var nextBtn_02 = $("#next_02");
   prevBtn_02.click;
   nextBtn_02.click;
   
   var tdGroup = [];
   
   function clickStart() {
	for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
    	tdGroup[i] = $("."+i);
    	 
    	// console.log(tdGroup[i].html());

    	tdGroup[i].on("click",function(){
	   		console.log(tdGroup[i]);
	   		console.log($(tdGroup[i]).attr('class'));
	   		
	   		for (let i = 1; i <= pageYear[first.getMonth()]; i++) {
				 //tdGroup[i].classList.contains='active'
	
		   		  if ($(tdGroup[i]).hasClass('active')) {
		   		    $(tdGroup[i]).removeClass('active');
		   		  }
	   		}
	
			clickedDate1 = tdGroup[i];
			console.log($(clickedDate1));
			$(clickedDate1).addClass('active');
			
			today = new Date(today.getFullYear(), today.getMonth(), $(clickedDate1).html());
			   	      
			console.log($(clickedDate1));
			console.log(today);
			   	      
			keyValue = today.getFullYear() + '' + (today.getMonth()+1) + '' + today.getDate();

   			})
        // tdGroup[i].addEventListener('click', changeToday);
		}
	}

   clickStart();
   
})

</script>

	<div id="subWrap" class="hdMargin">
		<section id="subContents">
			<article id="discussion_list" class="inner1200">
				<div class="title_main">
					<div class="title_wrap">
						<div class="left">제목 &nbsp;&nbsp;&nbsp;</div>
						<div class="right">
							<input type="text" id="title" name="title">
						</div>
					</div>
				</div>
			
				<div class="appPeriod_main">
					<div class="appPeriod_wrap">
						<div class="left">모집기간 &nbsp;&nbsp;&nbsp;</div>
						<div class="right">
							<span id="cal1">달력1</span> <input type="text" id="start_date"
								name="start_date"> ~ <span id="cal2">달력2</span> <input
								type="text" id="end_date" name="end_date">
						</div>
					</div>
				</div>
			
				<!-- 달력 1 -->
				<div class="main">
					<div id="content-wrap_01" class="content-wrap_01">
						<div class="content-right">
							<table id="calendar_01" class="calendar" align="center">
								<thead>
									<tr class="btn-wrap clearfix">
										<td><label id="prev"> &#60; </label></td>
										<td align="center" id="current-year-month_01" colspan="5"></td>
										<td><label id="next"> &#62; </label></td>
									</tr>
									<tr>
										<td class="sun" align="center">Sun</td>
										<td align="center">Mon</td>
										<td align="center">Tue</td>
										<td align="center">Wed</td>
										<td align="center">Thu</td>
										<td align="center">Fri</td>
										<td class="sat" align="center">Sat</td>
									</tr>
								</thead>
								<tbody id="calendar-body_01" class="calendar-body"></tbody>
							</table>
						</div>
					</div>
				</div>
			
				<!-- 달력 2 -->
				<div class="main">
					<div id="content-wrap_02" class="content-wrap_02">
						<div class="content-right">
							<table id="calendar_02" class="calendar" align="center">
								<thead>
									<tr class="btn-wrap clearfix">
										<td><label id="prev_02"> &#60; </label></td>
										<td align="center" id="current-year-month_02" colspan="5"></td>
										<td><label id="next_02"> &#62; </label></td>
									</tr>
									<tr>
										<td class="sun" align="center">Sun</td>
										<td align="center">Mon</td>
										<td align="center">Tue</td>
										<td align="center">Wed</td>
										<td align="center">Thu</td>
										<td align="center">Fri</td>
										<td class="sat" align="center">Sat</td>
									</tr>
								</thead>
								<tbody id="calendar-body_02" class="calendar-body"></tbody>
							</table>
						</div>
					</div>
				</div>
			</article>
		</section>
	</div>
	
<jsp:include page="/WEB-INF/views/footer.jsp"/>