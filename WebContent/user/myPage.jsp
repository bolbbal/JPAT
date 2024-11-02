<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/header.jsp" %>

	<div class="container">
		<div class = "container">
    	<div class = "row">
    		<div class = "col-md-2"></div>
    		<div class = "col-md-8">
    			<h3 class = "text-center">プロフィールの編集</h3>
				  <div class="form-group">
				    <label for="id" class="col-sm-4 control-label">ID</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control signUp" name="id" id="id" value="${user.userId }" readonly="readonly">
				      <p id="idMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-4 control-label">Password</label>
				    <div class="col-sm-8">
				      <input type="password" class="form-control signUp" name="password" id="password">
				      <p id="passwordMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="passwordChk" class="col-sm-4 control-label">Password Check</label>
				    <div class="col-sm-8">
				      <input type="password" class="form-control signUp" name="passwordChk" id="passwordChk">
				      <p id="passwordChkMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="nickname" class="col-sm-4 control-label">Nickname</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control signUp" name="nickname" id="nickname" value="${user.userNickname }">
				      <p id="nicknameMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="email" class="col-sm-4 control-label">Email address</label>
				    <div class="col-sm-8">
					    <input type="email" class="form-control signUp" name="email" id="email" value="${user.userEmail}" readonly="readonly">
					    <p id="emailMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="user-img" class="col-sm-4 control-label">User Image</label>
				    <div class="col-sm-8">
				    	<img id="preview" src="/upload/${user.userImg != null ? user.userImg : 'noUserImg.png' }" alt="" class="img-circle member-img">
					    <input type="file" class="form-control signUp" name="userImg" id="userImg">
				    </div>
				  </div>
				  <div class="form-group text-center">
				  	<input type="hidden">
				    <div class="text-center">
				      <button type="submit" class="btn btn-default" name="submit" id="submit">登録</button>
				      <button class="btn btn-default" name="cancel" id="cancel">退会</button>
				    </div>
				  </div>
    		</div>
    		<div class = "col-md-2"></div>
		</div>
		</div> <!-- contents end -->
	</div>
	
	<!-- modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	                <h4 class="modal-title" id="myModalLabel">退会手続き</h4>
	            </div>
	            <div class="modal-body">
	                <p>パスワ―ドを入力してください</p>
	                <input type="password" id="deletePassword" placeholder="password" class="form-control" />
	                <div id="deletePasswordMsg"></div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">キャンセル</button>
	                <button type="button" class="btn btn-danger" id="confirmDelete">確認</button>
	            </div>
	        </div>
	    </div>
	</div><!-- modal end -->
	<script>
		$(function() {
			
			var nicknameChk = 1;
			var passwordChk = 0;
			
			$("#nickname").blur(function() {
				if(!$("#nickname").val()) {
					$("#nicknameMsg").html("<span style='color:#f00;'>ニックネ―ムを入力してください</span>");
				} else {
					$("#nicknameMsg").html("");
				}
				$.ajax({
					type:'post',
					url:'/users/nicknameCheck.do',
					data:{nickname:$("#nickname").val()},
					dataType:'json',
					success:function(data) {
						if(data.result === "possible") {
							if($("#nickname").val() != "") {
								$("#nicknameMsg").html("<span style='color:#0f0;'>このニックネ―ムは使用できます</sapn>");
							} 
						} else if(data.result === "impossible") {
							if($("#nickname").val() != "") {
								$("#nicknameMsg").html("<span style='color:#f00;'>このニックネ―ムは使用できません</sapn>");
								nicknameChk = 0;
							}
						}
					}, error: function() {
						alert("통신에러");
					}
				})
			})
			
			$("#passwordChk").blur(function() {
				
				let pw = $("#password").val();
				let pwChk = $("#passwordChk").val();
				
				if(!$("#passwordChk").val()) {
					$("#passwordChkMsg").html("<span style='color:#f00;'>パスワ―ドを入力してください</span>");
				} else {
					$("#passwordChkMsg").html("");
				}
				
				if(pw != pwChk) {
					$("#passwordChkMsg").html("<span style='color:#f00;'>入力されたパスワ―ドが一致しません</span>");
				} else if(pw == pwChk) {
					$("#passwordChkMsg").html("");
					passwordChk = 1;
				}
				
			})
			
			document.getElementById('userImg').addEventListener('change', function(event) {
			    const file = event.target.files[0];
			    if (file) {
			        const validTypes = ['image/jpeg', 'image/png'];
			        if (!validTypes.includes(file.type)) {
			            alert('有効な画像ファイルを選択してください (JPEG, PNG)');
			            return;
			        }
			
			        const reader = new FileReader();
			        reader.onload = function(e) {
			            document.getElementById('preview').src = e.target.result;
			        };
			        reader.readAsDataURL(file);
			
			        const formData = new FormData();
			        formData.append('userImg', file);
			
			        $.ajax({
			            type: 'POST',
			            url: '/users/imgPreview.do',
			            data: formData,
			            contentType: false,
			            processData: false,
			            dataType: 'json',
			            beforeSend: function() {
			                // 로딩 스피너 표시 (예: $('#loading').show())
			            },
			            success: function(data) {
			                $('#preview').attr('src', data.imageUrl);
			            },
			            error: function() {
			                alert('画像のアップロードに失敗しました');
			            },
			            complete: function() {
			                // 로딩 스피너 숨김 (예: $('#loading').hide())
			            }
			        });
			    }
			});

			
			$("#submit").on("click", function() {
				var formData = new FormData();
				
				if($("#password").val() == "" && $("#passwordChk").val() == "") {
			    	formData.append("password", "${sessionScope.user.userPw}");
			    } else if (passwordChk != 1) {
			    	$("#passwordChkMsg").html("<span style='color:#f00;'>同じパスワードを入力してください</sapn>");
			    	$("#passwordChk").focus();
			    	return false;
			    }
				
			    if($("#nickname").val() == "" || nicknameChk != 1) {
			    	$("#nicknameMsg").html("<span style='color:#f00;'>使用可能なIDを入力してください</sapn>");
			    	$("#nickname").focus();
			    	return false;
			    }
			    
			 	// FormData 객체 생성
			    formData.append("password", $("#password").val());
			    formData.append("nickname", $("#nickname").val());
			    
			    // 파일 추가
			    var userImg = $("#userImg")[0].files[0]; // 파일 객체 가져오기
			    if (userImg) {
			        formData.append("userImg", userImg);
			    }
			    
				$.ajax({
					type:"post",
					data:formData,
					url:"/users/userUpdate.do",
					contentType: false,  // jQuery가 Content-Type을 자동으로 설정하지 않도록
			        processData: false,  // jQuery가 데이터를 자동으로 처리하지 않도록
					dataType:"json",
					success:function(data) {
						alert(data.msg);
						location.href="/";
					}, error:function() {
						alert("エラーが発生しました。再度お試しください");
					}
				})
			})
		})
		
		$(function() {
		    $("#cancel").on("click", function() {
		        // 모달을 띄우기
		        $("#myModal").modal('show');
		    });
		
		    $("#confirmDelete").on("click", function() {
		        if (!$("#deletePassword").val()) {
		            $("#deletePasswordMsg").html("<span style='color:#f00;'>パスワ―ドを入力してください</span>");
		            $("#deletePassword").focus();
		            return;
		        }
		
		        $.ajax({
		            type: 'post',
		            url: '/users/deleteCheck.do',
		            data: {
		            	'id': '${sessionScope.user.userId}',
		                'password': $("#deletePassword").val(),
		            },
		            dataType: 'json',
		            success: function(data) {
		                if (data.result == "success") {
		                    // 비밀번호 확인 후 게시글 삭제 요청
		                    $.ajax({
		                        type: 'post',
		                        url: '/users/delete.do',
		                        data: { 'userIdx': '${sessionScope.user.userIdx}' },
		                        dataType: 'json',
		                        success: function(deleteData) {
		                            if (deleteData.result == "success") {
		                                alert("退会が完了しました");
		                                $("#myModal").modal('hide'); // 모달 닫기
		                                location.href="/";
		                            }
		                        },
		                        error: function() {
		                            alert("エラーが発生しました。再度お試しください");
		                        }
		                    });
		                } else if (data.result == "fail") {
		                    $("#deletePasswordMsg").html("<span style='color:#f00;'>パスワード確認してください</span>");
		                    return;
		                }
		            },
		            error: function() {
		                alert("エラーが発生しました。再度お試しください");
		            }
		        });
		    });
		});
	</script>
<%@ include file = "/footer.jsp" %>