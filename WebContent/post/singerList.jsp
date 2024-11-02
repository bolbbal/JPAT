<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <div class = "container post-type">
    	<h3>歌手</h3>
    </div>
    <c:set var="num" value="${count-(page.cri.pageNum-1)*5 }"/>
    <div class = "container">
    	<c:forEach var="list" items="${list}">
		    <div class="row post">
		        <a href="/posts/suggest.do?type=singer&keyword=${list.singer}">
		            <div class="col-md-3">
		                <img src="/upload/${list.singer_img != null ? list.singer_img : 'noImage.png' }" 
		                     alt="" class="thumbnail music-thumbnail singer-img" 
		                     data-singer-idx="${list.singer_idx}">
		            </div>
		            <div class="col-md-9">
		                <h3>${list.singer}</h3>
		                <p>${list.suggest_count}</p>
		            </div>
		            <p class="singer-idx" style="display:none;">${list.singer_idx}</p>
		        </a>
		        <c:if test="${user.userIdx == 1}">
		            <input type="file" class="imgInsert" data-singer-idx="${list.singer_idx}">
		            <br>
		            <button type="button" class="submit" data-singer-idx="${list.singer_idx}">저장</button>
		        </c:if>
		    </div>
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
		      <a href="?pageNum=${page.cri.pageNum-1 }&type=${page.cri.type}'&keyword=${page.cri.keyword}'" aria-label="Previous">
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
	<script>
	$(function() {
	    // 이미지 미리보기 및 업로드
	    $(document).on('change', '.imgInsert', function(event) {
	        const file = event.target.files[0];
	        const singerIdx = $(this).data('singer-idx');
	        const imgElement = $(this).closest('.post').find('.singer-img');

	        if (file) {
	            const validTypes = ['image/jpeg', 'image/png'];
	            if (!validTypes.includes(file.type)) {
	                alert('有効な画像ファイルを選択してください (JPEG, PNG)');
	                return;
	            }

	            const reader = new FileReader();
	            reader.onload = function(e) {
	                imgElement.attr('src', e.target.result);
	            };
	            reader.readAsDataURL(file);

	            const formData = new FormData();
	            formData.append('imgInsert', file);
	            formData.append('singer_idx', singerIdx);

	            $.ajax({
	                type: 'POST',
	                url: '/posts/singerImgPreview.do',
	                data: formData,
	                contentType: false,
	                processData: false,
	                dataType: 'json',
	                success: function(data) {
	                    imgElement.attr('src', data.imageUrl);
	                },
	                error: function() {
	                    alert('画像のアップロードに失敗しました');
	                }
	            });
	        }
	    });

	    // 저장 버튼 클릭 이벤트
	    $(document).on('click', '.submit', function() {
	        const formData = new FormData();
	        const imgInput = $(this).closest('.post').find('.imgInsert');
	        const singerIdx = $(this).data('singer-idx');

	        if (imgInput.val() == "") {
	            alert("写真を入れてください");
	            return false;
	        }

	        const singerImg = imgInput[0].files[0];
	        if (singerImg) {
	            formData.append("singer_img", singerImg);
	        }

	        formData.append("singer_idx", singerIdx);

	        $.ajax({
	            type: "post",
	            data: formData,
	            url: "/posts/singerImgUpdate.do",
	            contentType: false,
	            processData: false,
	            dataType: "json",
	            success: function(data) {
	                alert("成功しました");
	            },
	            error: function() {
	                alert("エラーが発生しました。再度お試しください");
	            }
	        });
	    });
	});

	
	</script>
<%@ include file="/footer.jsp" %>