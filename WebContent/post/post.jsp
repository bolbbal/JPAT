<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <div class = "container post-type">
    	<h3>新着</h3>
    </div>
    
    <c:set var = "num" value="${count-(page.cri.pageNum-1)*15 }"/>
    <div class = "container">
    	<table class = "post-list">
    		<colgroup>
    			<col width = "5%">
    			<col width = "5%">
    			<col width = "*">
    			<col width = "10%">
    			<col width = "10%">
    			<col width = "5%">
    			<col width = "5%">
    		</colgroup>
    		<thead>
    			<tr>
    				<th>番号</th>
    				<th>タイプ</th>
    				<th>タイトル</th>
    				<th>作成者</th>
    				<th>作成日</th>
    				<th>閲覧数</th>
    				<th>いい</th>
    			</tr>
    		</thead>
    		<tbody>
    			<c:if test="${list.isEmpty() || list == null} ">
    				<tr>
    					<td colspan = "7">検索結果がありません</td>
    				</tr>
    			</c:if>
    			<c:forEach var="list" items="${list }">
	    			<tr>
	    				<td>${num }</td>
	    				<td>${list.post_type}</td>
	    				<td class="title"><a href="/posts/view.do?post_idx=${list.post_idx }" class="a-unset">${list.title} <c:if test="${list.replycount != 0}">[${list.replycount}]</c:if></a></td>
	    				<td>${list.nickname}</td>
	    				<td>
	    					<c:if test = "${list.modifydate == null}">${list.regdate}</c:if>
	    					<c:if test = "${list.modifydate} != null">${list.modifydate}</c:if>
	    				</td>
	    				<td>${list.viewcount}</td>
	    				<td>${list.likecount}</td>
	    			</tr>
	    			<c:set var = "num" value="${num-1 }"/>
    			</c:forEach>
    		</tbody>
    	</table>
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
	
	
<%@ include file="/footer.jsp"%>