<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <c:set var = "post" value = "${list[0]}"/>
    <c:set var = "suggest" value = "${list[1]}"/>
    <input type="hidden" id="post_idx" value="${post.post_idx }">
    <div class = "container">
    	<div class = "container post-title">
    		<h3>${post.title}</h3>
    		<div class="text-left writer-date">
    			<span>${post.nickname} </span><span>| ${post.regdate}</span>
    		</div>
    		<div class="text-right popular">
    			<span class="material-symbols-outlined">visibility</span><span>${post.viewcount} | </span>
    			<span class="material-symbols-outlined">favorite</span><span id="likeCount">${post.likecount} | </span>
    			<span class="material-symbols-outlined">chat_bubble</span><span id="replyCount">${post.replycount}</span>
    		</div>
    	</div>
		<div class = "container text-left post-detail">
			<p>
				${post.contents}
			</p>
			<c:if test="${post.imgurl != null }">
				<img src="/upload/${post.imgurl}" alt="">
			</c:if>
		</div>
		<c:if test="${suggest != null }">
			<div class = "container video">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe width="560" height="315" src="${suggest.youtube_url }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
				</div>
			</div>
			<div class = "container text-center post-detail">
				<h5>${suggest.music} | ${suggest.singer }</h5>
				<p>${suggest.lyrics}</p>
			</div>
		</c:if>
		<div class = "container text-center post-like">
			<button type="button" class="btn btn-default" id="like">
				<span class="material-symbols-outlined">thumb_up</span>
			</button>
			<span id="likecount">${post.likecount}</span>
			<button type="button" class="btn btn-default" id="hate">
				<span class="material-symbols-outlined">thumb_down</span>
			</button>
		</div>
		<div class="form-group">
			<div class="text-left">
				<a href="/posts/list.do"><button type="button" class="btn btn-default">リスト</button></a>
			</div>
			<div class="text-right">
				<c:if test="${(post.user_idx == user.userIdx) || (post.user_idx == -1 && empty user)}">
					<a href="/posts/modifyTerms.do?post_idx=${post.post_idx}"><button type="button" class="btn btn-default">編集</button></a>
				</c:if>
				<c:if test="${(post.user_idx == user.userIdx) || (post.user_idx == -1 && empty user) || (user.userIdx == 1)}">
					<button type="button" class="btn btn-default" id="deletePostModal">削除</button>
				</c:if>
				<a href="/posts/write.do"><button type="button" class="btn btn-default">書き込み</button></a>
			</div>
		</div>
	</div>
	 <!-- contents end -->
	 
	 <!-- comment -->
	<div class="container">
		<div class="reply">
           <p class="reply-count">
              Comments : ${replyCount}
           </p>
           </div>
           <div class="reply-input">
           	  <c:if test="${not empty user}">
	    		<input type="hidden" name="nickname" class="writer-info" value="${user.userNickname }">
	    		<input type="hidden" name="password" class="writer-info" value="${user.userPw }">
	    	  </c:if>
	    	  
	    	  <c:if test="${empty user }">
	    	  <div class="reply-info">
		          <p>Nickname</p>
		          <input type="text" name="nickname" id="nickname" class="writer-info">
		          <p>Password</p>
		          <input type="password" name="password" id="password" class="writer-info">
		      </div>
	    	  </c:if>
	    	  <div class="reply-comment">
              	<textarea name="comment" class="reply-contents" id="comment"></textarea>
              	<button id="btn_comment" class="reply-button" onclick="return cmtWrite();">コメント登録</button> 
              </div>
           </div>
           <div>
           		<c:forEach var="reply" items="${replyList}">
	               <ul class="reply-view">
	                  <li style="padding:12px 0;"><span>ㄴ</span> ${reply.nickname} | ${reply.modifydate == null ? reply.regdate : reply.modifydate}</li>
	                  <li>${reply.comments}</li>
	                  
	                  <div class="text-right">
	                  	<c:if test="${(reply.user_idx == user.userIdx) || (reply.user_idx == -1 && empty user) || (user.userIdx == 1)}">
							<button type="button" class="btn btn-default deleteReplyBtn" id="deleteReplyModal" data-reply-idx="${reply.replyIdx}">削除</button>
						</c:if>
					  </div>
					  
	               </ul>
               </c:forEach>
           </div>
	</div>
	
	<!-- post delete modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	                <h4 class="modal-title" id="myModalLabel">投稿の削除確認</h4>
	            </div>
	            <div class="modal-body">
	                <p>パスワ―ドを入力してください</p>
	                <input type="password" id="deletePostPassword" placeholder="비밀번호" class="form-control" />
	                <div id="passwordMsg"></div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
	                <button type="button" class="btn btn-danger" id="confirmPostDelete">確認</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- reply delete modal -->
	<div class="modal fade" id="deleteReplyModalView" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	                <h4 class="modal-title" id="deleteModalLabel">コメントの削除確認</h4>
	            </div>
	            <div class="modal-body">
	                <p>パスワ―ドを入力してください</p>
	                <input type="password" id="deleteReplyPassword" placeholder="비밀번호" class="form-control" />
	                <div id="deleteReplyPasswordMsg" class="text-danger"></div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
	                <button type="button" class="btn btn-danger" id="confirmReplyDelete">確認</button>
	            </div>
	        </div>
	    </div>
	</div>
	<script>
		function cmtWrite() {
			if($("#nickname").val() == "") {
				alert("ニックネ―ムを入力してください");
				return false;
			}
			if($("#password").val() == "") {
				alert("パスワ―ドを入力してください");
				return false;
			}
			if($("#comment").val() == "") {
				alert("内容を入力してください");
				return false;
			}
			
			let replyData = {
					post_idx : "<c:out value='${post.post_idx}'/>",
					nickname : $("#nickname").val(),
					password : $("#password").val(),
					comment : $("#comment").val(),
			}
			
			$.ajax({
				type : "post",
				url : "/reply/commentSave.do",
				data : replyData,
				dataType : "json",
				success : function(data) {
					alert(data.result);
					location.href="/posts/view.do?post_idx=${post.post_idx}"
				}, error : function() {
				    
				}
			})
		}
		
		let likeData = {
				post_idx : $("#post_idx").val()
		}
		
		$("#like").on("click", function() {
			console.log(post_idx);
			$.ajax({
				type:"post",
				url:"/posts/like.do",
				data: likeData,
				dataType:"json",
				success:function(data) {
					$("#likeCount").text(data.likecount +" | ");
					$("#likecount").text(data.likecount);
				}
			})
		})
		
		$("#hate").on("click", function() {
			$.ajax({
				type:"post",
				url:"/posts/hate.do",
				data: likeData,
				dataType:"json",
				success:function(data) {
					$("#likeCount").text(data.likecount +" | ");
					$("#likecount").text(data.likecount);
				}
			})
		})
		
		$(function() {
		    $("#deletePostModal").on("click", function() {
		        // userIdx를 서버에서 전역 변수로 전달받았다 가정
		        let userIdx = '${user.userIdx}';
		
		        if (userIdx === 1) {
		            // 관리자일 경우 confirm 창으로 삭제 확인
		            if (confirm("本当にこの投稿を削除しますか？")) {
		                // 관리자용 AJAX 삭제 요청
		                $.ajax({
		                    type: 'post',
		                    url: '/posts/delete.do',
		                    data: { 'post_idx': '${post.post_idx}' },
		                    dataType: 'json',
		                    success: function(deleteData) {
		                        if (deleteData.result === "success") {
		                            alert("投稿が削除されました");
		                            location.href = "/posts/list.do";
		                        } else {
		                            alert("投稿の削除に失敗しました");
		                        }
		                    },
		                    error: function() {
		                        alert("エラーが発生しました。再度お試しください");
		                    }
		                });
		            }
		        } else {
		            // 일반 사용자는 모달을 띄우기
		            $("#myModal").modal('show');
		        }
		    });
		
		    // 일반 사용자가 비밀번호 입력 후 삭제 확인
		    $("#confirmPostDelete").on("click", function() {
		        let password = $("#deletePostPassword").val();
		        if (!password) {
		            $("#passwordMsg").html("<span style='color:#f00;'>パスワ―ドを入力してください</span>");
		            $("#deletePostPassword").focus();
		            return;
		        }
		
		        // 비밀번호 검증 AJAX 요청
		        $.ajax({
		            type: 'post',
		            url: '/posts/deleteTermspro.do',
		            data: {
		                'password': password,
		                'post_idx': '${post.post_idx}'
		            },
		            dataType: 'json',
		            success: function(data) {
		                if (data.result === "success") {
		                    // 비밀번호가 맞으면 실제 게시글 삭제 요청
		                    $.ajax({
		                        type: 'post',
		                        url: '/posts/delete.do',
		                        data: { 'post_idx': '${post.post_idx}' },
		                        dataType: 'json',
		                        success: function(deleteData) {
		                            if (deleteData.result === "success") {
		                                alert("投稿が削除されました");
		                                $("#myModal").modal('hide');
		                                location.href = "/posts/list.do";
		                            } else {
		                                alert("投稿の削除に失敗しました");
		                            }
		                        },
		                        error: function() {
		                            alert("エラーが発生しました。再度お試しください");
		                        }
		                    });
		                } else if (data.result === "fail") {
		                    $("#passwordMsg").html("<span style='color:#f00;'>비밀번호 확인</span>");
		                }
		            },
		            error: function() {
		                alert("エラーが発生しました。再度お試しください");
		            }
		        });
		    });
		});
		
		$(document).ready(function() {
		    // 삭제 버튼 클릭 시 모달 열기
		    $(document).on('click', '.deleteReplyBtn', function() {
		        // 해당 댓글의 reply_idx를 가져옵니다.
		        var replyIdx = $(this).data('reply-idx');
		        $('#deleteReplyModalView').modal('show');
		        
		        // 모달 내에서 삭제 확인 버튼 클릭 시 비밀번호 확인
		        $('#confirmReplyDelete').off('click').on('click', function() {
		            var password = $('#deleteReplyPassword').val();

		            // 비밀번호 확인 로직
		            if (password === "") {
		                $('#deleteReplyPasswordMsg').text("パスワ―ドを入力してください");
		                return false;
		            }

		            // 비밀번호 확인 AJAX 요청
		            $.ajax({
		                type: 'post',
		                url: '/reply/deleteTermspro.do',
		                data: {
		                    'password': password,
		                    'reply_idx': replyIdx // replyIdx를 여기서 사용
		                },
		                dataType: 'json',
		                success: function(data) {
		                    if (data.result === "success") {
		                        // 비밀번호 확인 후 댓글 삭제 요청
		                        $.ajax({
		                            type: 'post',
		                            url: '/reply/delete.do',
		                            data: { 'reply_idx': replyIdx,
		                            	'post_idx' : "<c:out value='${post.post_idx}'/>"
		                            	}, // replyIdx를 여기서 사용
		                            dataType: 'json',
		                            success: function(deleteData) {
		                                if (deleteData.result === "success") {
		                                    alert("コメントが削除されました");
		                                    $('#deleteReplyModalView').modal('hide'); // 모달 닫기
		                                    location.href = "/posts/view.do?post_idx=${post.post_idx}";
		                                } else {
		                                    alert("コメントの削除に失敗しました");
		                                }
		                            },
		                            error: function() {
		                                alert("エラーが発生しました。再度お試しください");
		                            }
		                        });
		                    } else if (data.result === "fail") {
		                        $("#deleteReplyPasswordMsg").html("<span style='color:#f00;'>비밀번호 확인 실패</span>");
		                    }
		                },
		                error: function() {
		                    alert("エラーが発生しました。再度お試しください");
		                }
		            });
		        });
		    });
		});


	</script>
<%@ include file="/footer.jsp" %>