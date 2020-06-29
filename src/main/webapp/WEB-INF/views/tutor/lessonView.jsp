<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/header.jsp" />

<style>
	.review{border-bottom: 1px solid gray;}
	.tab{border-bottom: 1px solid gray;}
	.view_main{border-bottom: 1px solid gray; width:100%; height: 600px;}
	.curriculum{float: left; width: 70%; height:100%;}
	.priceLocation{float: left; width: 30%; height:100%;}
	.lesson_guid{border-bottom: 1px solid gray;}
	.refund_guid{border-bottom: 1px solid gray;}
	.view_top{border-bottom: 1px solid gray; width:100%; height: 200px;}
	.view_top_left{float: left; width: 20%; height: 100%;}
	.view_top_right{float: left; width: 80%; height:100%;}
</style>

<script>
$(function(){
	$("#back").on("click", function(){
		location.href="/tutor/lessonList";
	})
})

</script>

<div id="subWrap" class="hdMargin">
	<section id="subContents">
		<article id="lessonView" class="inner1200">

			<div class="tit_s1">
				<h2>강의 View</h2>
			</div>

			<div class="btnS1 right">
				<p>
					<a href="/tutor/lessonApp" class="on">강의 수정</a>
					<button type="button" id="popOnBtn" class="on">강의 삭제</button>
				</p>
			</div>
			
			<div class="view_top">
				<div class="view_top_left">
					<div class="profile">
						<img src="/upload/member/${ldto.id}/${ldto.sysname}">
					</div>
				</div>
				
				<div class="view_top_right">
					<div class="title">
						${ ldto.title}
					</div>
					<div class="review">
						★${ ldto.review_point}
						<a id="like">추천</a>
						<a id="jjim">찜하기</a>
						<a id="report">신고</a>
					</div>
					
					<div class="info">
						위치 : ${ldto.location }
						수업기간 : ${ldto.start_date } ~ ${ldto.end_date }
						수업시간 : ${ldto.start_hour }:${ldto.start_minute } ~ ${ldto.end_hour }:${ldto.end_minute }
						최대인원 : ${ldto.max_num }
						수업언어 : ${ldto.language }
						가격 : ${ldto.price } 원 /시간
					</div>
	
				</div>
			</div>
			<div class="tab">
				<ul>
					<li><a>커리큘럼</a></li>
					<li><a>강의문의</a></li>
					<li><a>환불안내</a></li>
					<li><a>리뷰</a></li>
					<li><a>결제하기</a></li>
				</ul>
			</div>
			
			<div class="view_main">
				<div class="curriculum">${ldto.curriculum }</div>
				<div class="priceLocation">가격 ${ldto.price}원/시간 <br>위치 ${ldto.location}</div>
			</div>
			
			<div class="tit_s3">
				<h4>강의 문의</h4>
			</div>
			<div class="lesson_guid">
				<ul>
					<li>강의 문의는 전화 또는 채팅, 메일을 통해서 문의해 주세요.</li>
					<li>전화번호 ${ldto.phone_country}${ldto.phone }</li>
					<li>메일 ${ldto.email }</li>
				</ul>
			</div>
			
			
			<div class="tit_s3">
				<h4>환불 안내</h4>
			</div>
			<div class="refund_guid">
				<ul>
					<li>· 고객센터 직접 문의 (1:1상담, 게시판, 이메일, 전화: 1588-1580)</li>
					<li>· 마이페이지>결제내역에서 환불신청</li>
					<li>* 결제 취소 및 환불은 환불신청 접수 후 7일 이내에 처리해 드립니다.</li>
					<li>* 환불시 구매자와 환불자가 다를 경우 19세 미만의 고객은 보호자의 동의가 필요합니다.</li>
				</ul>
			</div>
			
			<div class="tit_s3">
				<h4>리뷰 </h4>
			</div>
			
			<input type="button" id="back" value="목록으로">	
		
		</article>
	</section>
</div>


<jsp:include page="/WEB-INF/views/tutor/cancle.jsp" />

<jsp:include page="/WEB-INF/views/footer.jsp" />