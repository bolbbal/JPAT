<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
<!-- contents start -->
<div class="container post-type">
    <h3>書き込み</h3>
</div>
<div class="container">
    <form name="post" method="post" enctype = "multipart/form-data" action="/posts/writepro.do" onsubmit="return check()">
    	<input type="hidden" name="thumnail">
        <table class="col-md-12 post-write">
        	<tr>
                <th>Type</th>
                <td colspan="3">
                    <label><input type="radio" name="post_type_idx" value="1" checked onclick="toggleExtraInputs()"> 一般</label>
                    <label><input type="radio" name="post_type_idx" value="2" onclick="toggleExtraInputs()"> お勧め</label>
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
                <td colspan="3"><input type="text" name="title" class="write-title"></td>
            </tr>
            <tr>
                <th>Contents</th>
                <td colspan="3"><textarea name="contents" class="write-contents"></textarea></td>
            </tr>
            <tr>
                <th>File</th>
                <td><input type="file" name="imgurl"></td>
            </tr>
            
            <tr id="extra-inputs" style="display: none;">
                <th>Music</th>
                <td colspan="3"><input type="text" name="music" class="recommend-info"></td>
            </tr>
            <tr id="extra-inputs-2" style="display: none;">
                <th>Singer</th>
                <td colspan="3"><input type="text" name="singer" class="recommend-info"></td>
            </tr>
            <tr id="extra-inputs-3" style="display: none;">
                <th>YouTube Link</th>
                <td colspan="3"><input type="text" name="youtube_url" class="recommend-info" ></td>
            </tr>
            <tr id="extra-inputs-4" style="display: none;">
                <th>Lyrics</th>
                <td colspan="3"><textarea name="lyrics" class="write-contents"></textarea></td>
            </tr>
        </table>
        <div class="form-group text-right">
            <div class="text-right">
                <button type="button" class="btn btn-default" onClick="location.href='/posts/list.do';">キャンセル</button>
                <button type="submit" class="btn btn-default">投稿</button>
            </div>
        </div>
    </form>
</div> <!-- contents end -->

<script>
    // 라디오 버튼 상태에 따라 추가 입력 필드 표시
    function toggleExtraInputs() {
        var recommendedRadio = document.querySelector('input[name="post_type_idx"][value="2"]');
        var extraInputs = document.getElementById('extra-inputs');
        var extraInputs2 = document.getElementById('extra-inputs-2');
        var extraInputs3 = document.getElementById('extra-inputs-3');
        var extraInputs4 = document.getElementById('extra-inputs-4');

        if (recommendedRadio.checked) {
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
      	
    	if (post.nickname.value == "") {
            alert("ニックネ―ムを入力してください");
            post.nickname.focus();
            return false;
        }
        
        if (post.password.value == "") {
            alert("パスワ―ドを入力してください");
            post.password.focus();
            return false;
        }
        
        if (post.title.value == "") {
            alert("Titleを入力してください");
            post.title.focus();
            return false;
        }
        
        if (post.contents.value == "") {
            alert("Contentsを入力してください");
            post.contents.focus();
            return false;
        }
        
        if (post.post_type_idx.value === "2") {
        	
        	let youtubeUrl = post.youtube_url.value;
        	youtubeUrl = youtubeUrl.replace("https://youtu.be/", '');
        	youtubeUrl = youtubeUrl.replace("https://www.youtube.com/embed/", '');
        	youtubeUrl = youtubeUrl.replace("https://www.youtube.com/watch?v=", '');
        	
        	let thumnailUrl = youtubeUrl.substring(0, 11);
        	post.thumnail.value = "https://img.youtube.com/vi/" + thumnailUrl + "/mqdefault.jpg";
        	post.youtube_url.value = "https://www.youtube.com/embed/" + thumnailUrl;
        	
        	if(post.music.value == "") {
        		alert("Musicを入力してください");
        		post.music.focus();
        		return false;
        	}
        	if(post.singer.value == "") {
        		alert("Singerを入力してください");
        		post.music.focus();
        		return false;
        	}
        	if(post.youtube_url.value == "") {
        		alert("YouTube Linkを入力してください");
        		post.youtube_url.focus();
        		return false;
        	}
        	if(post.lyrics.value == "") {
        		alert("Lyricを入力してください");
        		post.lyrics.focus();
        		return false;
        	}
        	
        }
    
        return true;
        
    }
</script>

<%@ include file="/footer.jsp" %>
