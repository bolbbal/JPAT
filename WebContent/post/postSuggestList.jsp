<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <div class = "container post-type">
    	<h3>お勧め</h3>
    </div>
    <c:set var="num" value="${count-(page.cri.pageNum-1)*5 }"/>
    <div class = "container">
    	<c:forEach var="list" items="${list}">
	    <div class="row post">
	    	<a href="/posts/view.do?post_idx=${list.post.post_idx }">
		  		<div class="col-md-3">
		      		<img src="${list.suggest.thumnail }" alt="" class="thumbnail music-thumbnail">
		      	</div>
		      	<div class="col-md-5">
		      		<h3>${list.suggest.music} | ${list.suggest.singer}</h3>
		      		<p>${list.suggest.lyrics}</p>
		      	</div>
		      	<div class="col-md-2">
		      		<img src="/upload/${list.post.user_img != null ? list.post.user_img : 'noUserImg.png' }" alt="" class="img-circle member-img">
		      	</div>
		      	<div class="col-md-2 writer">
		      		<p>${list.post.nickname}</p>
		      		<p>
		      			<c:if test = "${list.post.modifydate == null}">${list.post.regdate}</c:if>
		      			<c:if test = "${list.post.modifydate != null}">${list.post.modifydate}</c:if>
		      			<br><br><br>
		      		</p>
		      		<p class="text-right">${list.post.viewcount} | ${list.post.likecount}</p>
		      	</div>
		    </a>
		  </div>
		  <c:set var = "num" value="${num-1 }"/>
		</c:forEach>
		  
	</div>
	<div class="container text-right">
		<a href="/posts/write.do"><button class="btn btn-default text-right" type="submit">書き込み</button></a>
	</div>
	<div class="container text-center">
		<nav aria-label="Page navigation" class="paging">
		  <ul class="pagination">
		  	<c:if test="${page.prev }">
		    <li>
		      <a href="?pageNum=1&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Previous">
		        <i class="fa  fa-angle-double-left"></i>
		      </a>
		    </li>
		    </c:if>
		    <c:if test="${page.cri.pageNum != 1 }">
		    <li>
		      <a href="?pageNum=${page.cri.pageNum-1 }&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Previous">
		        <i class="fa fa-angle-left"></i>
		      </a>
		    </li>
		    </c:if>
		    <c:forEach var = "pageNum" begin = "${page.startPage }" end = "${page.endPage}">
		    	<li><a href="?pageNum=${pageNum }&type=${page.cri.type}&keyword=${page.cri.keyword}">${pageNum }</a></li>
		    </c:forEach>
		    <c:if test="${page.cri.pageNum != page.endPage}">
		    <li>
		      <a href="?pageNum=${page.cri.pageNum+1 }&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Next">
		        <i class="fa fa-angle-right"></i>
		      </a>
		    </li>
		    </c:if>
		    <c:if test="${page.next}">
		    <li>
		      <a href="?pageNum=${page.realEnd }&type=${page.cri.type}&keyword=${page.cri.keyword}" aria-label="Next">
		        <i class="fa  fa-angle-double-right"></i>
		      </a>
		    </li>
		    </c:if>
		  </ul>
		</nav>
	</div>
	<!-- contents end -->
	
<%@ include file="/footer.jsp" %>