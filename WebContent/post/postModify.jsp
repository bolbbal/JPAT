<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <c:set var = "postModify" value="${modify[0] }"/>
    <c:set var = "suggestModify" value="${modify[1] }"/>
    <div class = "container post-type">
    	<h3>投稿の編集</h3>
    </div>
    <div class = "container">
    	<form name="modify" method="post" enctype="multipart/form-data" action="/posts/modifypro.do" onsubmit="return check()">
    	<input type="hidden" name="post_idx" value="${postModify.post_idx }">
    	<input type="hidden" name="post_type_idx" value="${postModify.post_type_idx}">
    	<input type="hidden" name="thumnail">
    		<table class="col-md-12 post-write">
    			<tr>
	                <th>Type</th>
	                <td colspan="3">
	                    <label><input type="radio" name="post_type_idx" value="1" ${postModify.post_type_idx == 1 ? 'checked' : ''} checked onclick="return false;"> 一般</label>
	                    <label><input type="radio" name="post_type_idx" value="2" ${postModify.post_type_idx == 2 ? 'checked' : ''} onclick="return false;"> お勧め</label>
	                </td>
            	</tr>
    			 <c:if test="${not empty user}">
		    		<input type="hidden" name="nickname" class="writer-info" value="${user.userNickname }">
		    		<input type="hidden" name="password" class="writer-info" value="${user.userPw }">
	    		</c:if>
	    		<c:if test="${empty user }">
		    		<tr>
		                <th>Nickname</th>
		                <td><input type="text" name="nickname" class="writer-info"></td>
		                <th>Password</th>
		                <td><input type="password" name="password" class="writer-info"></td>
		                <th></th>
		            </tr>
	    		</c:if>
	    		 <tr>
	    		 	<th>Title</th>
	    		 	<td><input type="text" name="title" class="write-title" value="${postModify.title}"></td>
	    		 </tr>
	    		 <tr>
	    		 	<th>Contents</th>
	    		 	<td><textarea name="contents" class="write-contents">${postModify.contents}</textarea></td>
	    		 </tr>
	    		 <tr>
	    		 	<th>File</th>
	    		 	<td><input type="file" name="imgurl"></td>
	    		 </tr>
	    		 
	            <tr id="extra-inputs" style="display: none;">
	                <th>Music</th>
	                <td colspan="5"><input type="text" name="music" class="recommend-info" value = "${suggestModify.music }"></td>
	            </tr>
	            <tr id="extra-inputs-2" style="display: none;">
	                <th>Singer</th>
	                <td colspan="3"><input type="text" name="singer" class="recommend-info" value = "${suggestModify.singer }"></td>
	            </tr>
	            <tr id="extra-inputs-3" style="display: none;">
	                <th>YouTube Link</th>
	                <td colspan="3"><input type="text" name="youtube_url" class="recommend-info" value = "${suggestModify.youtube_url }"></td>
	            </tr>
	            <tr id="extra-inputs-4" style="display: none;">
	                <th>Lyrics</th>
	                <td colspan="3"><textarea name="lyrics" class="recommend-info">${suggestModify.lyrics}</textarea></td>
	            </tr>
    		 </table>
    		 <div class="form-group text-right">
				    <div class="text-right">
				      <button type="button" class="btn btn-default" onClick="location.href='/posts/list.do';">キャンセル</button>
				      <button type="submit" class="btn btn-default">書き込み</button>
				    </div>
			 </div>
    	</form>
	</div> <!-- contents end -->
	<script>
	document.addEventListener('DOMContentLoaded', function() {
	    // 초기 로드 시 체크된 상태를 강제로 설정 후 toggleExtraInputs 호출
	    const initialCheckedValue = document.querySelector('input[name="post_type_idx"]:checked');
	    if (initialCheckedValue && initialCheckedValue.value === "2") {
	        toggleExtraInputs(true); // 체크된 상태에 따라 초기 표시
	    } else {
	        toggleExtraInputs(false);
	    }
	});

	function toggleExtraInputs(isRecommended) {
	    var extraInputs = document.getElementById('extra-inputs');
	    var extraInputs2 = document.getElementById('extra-inputs-2');
	    var extraInputs3 = document.getElementById('extra-inputs-3');
	    var extraInputs4 = document.getElementById('extra-inputs-4');

	    // 초기 불러온 상태에 따라 보이기
	    if (isRecommended) {
	        extraInputs.style.display = 'table-row';
	        extraInputs2.style.display = 'table-row';
	        extraInputs3.style.display = 'table-row';
	        extraInputs4.style.display = 'table-row';
	    } else {
	        extraInputs.style.display = 'none';
	        extraInputs2.style.display = 'none';
	        extraInputs3.style.display = 'none';
	        extraInputs4.style.display = 'none';
	    }
	}
	
	function check() {
	    
	    if (document.modify.title.value == "") {
	        alert("Titleを入力してください");
	        document.modify.title.focus();
	        return false;
	    }
	    if (document.modify.contents.value == "") {
	        alert("Contentsを入力してください");
	        document.modify.contents.focus();
	        return false;
	    }
	    
		if (modify.post_type_idx.value === "2") {
        	
        	let youtubeUrl = modify.youtube_url.value;
        	youtubeUrl = youtubeUrl.replace("https://youtu.be/", '');
        	youtubeUrl = youtubeUrl.replace("https://www.youtube.com/embed/", '');
        	youtubeUrl = youtubeUrl.replace("https://www.youtube.com/watch?v=", '');
        	
        	let thumnailUrl = youtubeUrl.substring(0, 11);
        	modify.thumnail.value = "https://img.youtube.com/vi/" + thumnailUrl + "/mqdefault.jpg";
        	modify.youtube_url.value = "https://www.youtube.com/embed/" + thumnailUrl;
        	
        	if(modify.music.value == "") {
        		alert("Musicを入力してください");
        		modify.music.focus();
        		return false;
        	}
        	if(modify.singer.value == "") {
        		alert("Singerを入力してください");
        		modify.music.focus();
        		return false;
        	}
        	if(modify.youtube_url.value == "") {
        		alert("YouTube Linkを入力してください");
        		modify.youtube_url.focus();
        		return false;
        	}
        	if(modify.lyrics.value == "") {
        		alert("Lyricを入力してください");
        		modify.lyrics.focus();
        		return false;
        	}
        	
        }

	    alert("投稿が編集されました");
	    return true;  
	}
	</script>
	
<%@ include file="/footer.jsp" %>
