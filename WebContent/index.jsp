<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- main visual start -->
   <div class="container main-visual">
    <div class="carousel-wrapper">
	  <a class="left carousel-control" href="#" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
	  
	  <div class="carousel">
	  	<c:set var="num" value="0"/>
	  	<c:forEach var="popular" items="${popularList}">
	  		<div class="carousel-item" data-index="${num}">
	  			<a href="/posts/view.do?post_idx=${popular.post.post_idx }" class="a-unset">
					<c:choose>
						<c:when test="${popular.post.post_type_idx == 1}">
						<img src="/upload/${popular.post.imgurl != null ? popular.post.imgurl : 'noImage.png'}" alt="" class="popular-img">
						</c:when>
						<c:when test="${popular.post.post_type_idx == 2}">
						<img src="${popular.suggest.thumnail}" alt="" class="popular-img">
						</c:when>
					</c:choose>	  				
					<h3>${popular.post.title }</h3>
					<h3>${popular.post.contents}</h3>
					<p class = "post-info">${popular.post.modifydate == null ? popular.post.regdate : popular.post.modifydate} | ${popular.post.nickname}</p>
					<p class = "write-info"><span class="material-symbols-outlined">visibility</span>${popular.post.viewcount} | <span class="material-symbols-outlined">favorite</span>${popular.post.likecount}</p>
				</a>
			</div>
		<c:set var="num" value="${num+1}"/>
	    </c:forEach>
	  </div>
	  
	  <a class="right carousel-control" href="#" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
	</div>
   </div> <!-- main visual end -->
   
    <!-- contents start -->
    <div class = "container contents">
	    <div class="row">
	    	<div class = "col-md-8">
		    	<div class = "container-fluid new">
		    		<h4>新しいポスト</h4>
		    	<c:forEach var="newList" items="${newList}">
					  <div class="col-md-6">
					    <div class="thumbnail recently">
					    	<a href="/posts/view.do?post_idx=${newList.post.post_idx }" class="movepost list-group-item">
					    		<c:choose>
						      		<c:when test="${newList.post.post_type_idx == 1}">
								        <img src="/upload/${newList.post.imgurl != null ? newList.post.imgurl : 'noImage.png'}" alt="">
							        </c:when>
							        <c:when test="${newList.post.post_type_idx == 2}">
							        	<img src="${newList.suggest.thumnail}" alt="">
							        </c:when>
						        </c:choose>
						      <div class="caption">
							    <h3>${newList.post.title}</h3>
								<h3>${newList.post.contents }</h3>
						        <p class = "text-right write-info">${newList.post.modifydate == null ? newList.post.regdate : newList.post.modifydate} | ${newList.post.nickname} | <span class="material-symbols-outlined">visibility</span>${newList.post.viewcount} | <span class="material-symbols-outlined">favorite</span>${newList.post.likecount}</p>
						      </div>
					      	</a>
					    </div>
					  </div>
				  </c:forEach>
				  <div class="text-right moveall">
					<a href="/posts/list.do" >概要欄 ></a>
				  </div>
			  </div>
		  </div>
		  <div class="col-md-4">
		    <div class="list-group popular">
				<h3 class = "list-group-item text-center">多くお勧めされた歌手</h3>
				<c:forEach var="singer" items="${singerList}">
					<a href="/posts/suggest.do?type=singer&keyword=${singer.singer}" class="list-group-item"><img src = "/upload/${singer.singer_img}" alt="" class = "img-circle singer-img">${singer.singer }</a>
				</c:forEach>
			</div>
		  </div>
		</div>
	</div> <!-- contents end -->
	<script>
		$(document).ready(function () {
		  let currentIndex = 0; // 초기 강조 카드 인덱스 (Card 1)
		  const totalItems = $(".carousel-item").length;
		
		  function updateCarousel(newIndex) {
		    const items = $(".carousel-item");
		    currentIndex = (newIndex + totalItems) % totalItems;
		
		    items.removeClass("selected left right left-far right-far");
		
		    // 업데이트된 인덱스를 기준으로 클래스 할당
		    items.each(function () {
		      const index = parseInt($(this).attr("data-index"));
		
		      if (index === currentIndex) {
		        $(this).addClass("selected");
		      } else if (index === (currentIndex + 1) % totalItems) {
		        $(this).addClass("right");
		      } else if (index === (currentIndex + 2) % totalItems) {
		        $(this).addClass("right-far");
		      } else if (index === (currentIndex - 1 + totalItems) % totalItems) {
		        $(this).addClass("left");
		      } else if (index === (currentIndex - 2 + totalItems) % totalItems) {
		        $(this).addClass("left-far");
		      }
		    });
		  }
		
		  $(".carousel-control.left").click(function (e) {
		    e.preventDefault();
		    updateCarousel(currentIndex - 1); // 왼쪽 클릭 시 이전 카드로 이동
		  });
		
		  $(".carousel-control.right").click(function (e) {
		    e.preventDefault();
		    updateCarousel(currentIndex + 1); // 오른쪽 클릭 시 다음 카드로 이동
		  });
		
		  updateCarousel(currentIndex); // 초기 상태 업데이트
		});
	</script>
<%@ include file="/footer.jsp" %>