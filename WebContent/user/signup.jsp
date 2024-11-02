<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <div class = "container">
    	<div class = "row">
    		<div class = "col-md-2"></div>
    		<div class = "col-md-8">
    			<h3 class = "text-center">新規登録</h3>
    			
				  <div class="form-group">
				    <label for="id" class="col-sm-4 control-label">ID</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control signUp" name="id" id="id" placeholder="ID">
				      <p id="idMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="password" class="col-sm-4 control-label">Password</label>
				    <div class="col-sm-8">
				      <input type="password" class="form-control signUp" name="password" id="password" placeholder="Password">
				      <p id="passwordMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="passwordChk" class="col-sm-4 control-label">Password Check</label>
				    <div class="col-sm-8">
				      <input type="password" class="form-control signUp" name="passwordChk" id="passwordChk" placeholder="Password Check">
				      <p id="passwordChkMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="nickname" class="col-sm-4 control-label">Nickname</label>
				    <div class="col-sm-8">
				      <input type="text" class="form-control signUp" name="nickname" id="nickname" placeholder="Nickname">
				      <p id="nicknameMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="email" class="col-sm-4 control-label">Email address</label>
				    <div class="col-sm-8">
					    <input type="email" class="form-control signUp" name="email" id="email" placeholder="Email">
					    <button class="btn btn-default" name="emailSend" id="emailSend">Submit</button>
					    <p id="emailMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="certiNumber" class="col-sm-4 control-label">Certification</label>
				    <div class="col-sm-8">
					    <input type="text" class="form-control signUp" name="certiNumber" id="certiNumber" placeholder="Certification Number">
					    <button class="btn btn-default" name="certiChk" id="certiChk">Submit</button>
					    <p id="certiMsg"></p>
				    </div>
				  </div>
				  <div class="form-group text-center">
				    <div class="text-center">
				      <button type="submit" class="btn btn-default" name="submit" id="submit">登録</button>
				      <button class="btn btn-default" name="cansel" id="cansel" onclick="location.href='/'">キャンセル</button>
				    </div>
				  </div>
				
    		</div>
    		<div class = "col-md-2"></div>
		</div>
	</div> <!-- contents end -->
	
	<script>
		$(function() {
			
			var idChk = 0;
			var passwordChk = 0;
			var nicknameChk = 0;
			var emailChk = 0;
			
			$("#id").blur(function() {
				if(!$("#id").val()) {
					$("#idMsg").html("<span style='color:#f00;'>IDを入力してください</span>");
				} else {
					$("#idMsg").html("");
				}
				$.ajax({
					type:'post',
					url:'/users/idCheck.do',
					data:{id:$("#id").val()},
					dataType:'json',
					success:function(data) {
						if(data.result == "possible") {
							if($("#id").val() != "") {
								$("#idMsg").html("<span style='color:#0f0;'>このIDは使用できます</sapn>");
								idChk = 1;
							} 
						} else if(data.result == "impossible") {
							if($("#id").val() != "") {
								$("#idMsg").html("<span style='color:#f00;'>このIDは使用できません</sapn>");
							}
						}
					}, error: function() {
						alert("エラーが発生しました。再度お試しください");
					}
				})
			})
			
			$("#password").blur(function() {
				if(!$("#password").val()) {
					$("#passwordMsg").html("<span style='color:#f00;'>パスワ―ドを入力してください</span>");
				} else {
					$("#passwordMsg").html("");
				}
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
						if(data.result == "possible") {
							if($("#nickname").val() != "") {
								$("#nicknameMsg").html("<span style='color:#0f0;'>このニックネ―ムは使用できます</sapn>");
								nicknameChk = 1;
							} 
						} else if(data.result == "impossible") {
							if($("#nickname").val() != "") {
								$("#nicknameMsg").html("<span style='color:#f00;'>このニックネ―ムは使用できません</sapn>");
							}
						}
					}, error: function() {
						alert("エラーが発生しました。再度お試しください");
					}
				})
			})
			
			$("#email").blur(function () {
				if(!$("#email").val()) {
					$("#emailMsg").html("<span style = 'color:#f00;'>メ―ルアドレスを入力してください</span>");
				} else {
					$("#emailMsg").html("");
				}
				$.ajax({
					type:'post',
					url:'/users/emailCheck.do',
					data:{email:$('#email').val()},
					dataType:'json', //리턴받는 데이터 형식
					success:function(data) {
						if(data.result == "possible") {
							if($("#email").val() != "") {
								$("#emailMsg").html("<span style='color:#0f0;'>このメ―ルアドレスは使用できます</sapn>");
								emailChk = 1;
							} 
						} else if(data.result == "impossible") {
							if($("#email").val() != "") {
								$("#emailMsg").html("<span style='color:#f00;'>このメ―ルアドレスは使用できません</sapn>");
							}
						}
					}, error: function() {
						alert("エラーが発生しました。再度お試しください");
					}
				})
			})
			
			var authenticationKey = 0;
			var certiChk = 0;
			
			$("#emailSend").on("click", function(event) {
				event.preventDefault();
				if(!$("#email").val()) {
					return false;
				}
				$.ajax({
					type:'post',
					url:'/users/sendEmail.do',
					data:{email:$("#email").val()},
					dataType:'json',
					success:function(data) {
						authenticationKey = data.authenticationKey;
						$("#emailMsg").html("<span style='color:#0f0;'>入力されたメールアドレスに認証コードを送信しました</sapn>");
					}, error:function() {
						alert("エラーが発生しました。再度お試しください");
					}
				})
				
			})
			
			$("#certiChk").on("click", function(event) {
				event.preventDefault();
				var certiNumber = $("#certiNumber").val();
				if($("#certiNumber") == "") {
					$("#certiMsg").html("<span style='color:#f00;'>認証コードを入力してください</span>");
					return false;
				}
				
				if(authenticationKey == certiNumber) {
					$("#certiMsg").html("<span style='color:#0f0;'>認証コードが一致しました</span>");
					certiChk = 1;
				} else {
					$("#certiMsg").html("<span style='color:#f00;'>認証コードが一致しません</span>");
				}
				
			})
			
			$("#submit").on("click", function() {
				
			    var id = $("#id").val();
			    var password = $("#password").val();
			    var nickname = $("#nickname").val();
			    var email = $("#email").val();
			    
			    if($("#id").val() == "" || idChk != 1) {
			    	$("#idMsg").html("<span style='color:#f00;'>使用可能なIDを入力してください</sapn>");
			    	$("#id").focus();
			    	return false;
			    }
			    if($("#password").val() == "" || $("#passwordChk").val() == "" || passwordChk != 1) {
			    	$("#passwordChkMsg").html("<span style='color:#f00;'>同じパスワードを入力してください</sapn>");
			    	$("#passwordChk").focus();
			    	return false;
			    }
			    if($("#nickname").val() == "" || nicknameChk != 1) {
			    	$("#nicknameMsg").html("<span style='color:#f00;'>使用可能なニックネームを入力してください</sapn>");
			    	$("#nickname").focus();
			    	return false;
			    }
			    if($("#email").val() == "" || emailChk != 1) {
			    	$("#emailMsg").html("<span style='color:#f00;'>使用可能なメールアドレスを入力してください</sapn>");
			    	$("#email").focus();
			    	return false;
			    }
			    
				if(certiChk == 0) {
					alert("メールによる認証コードの確認が必須です");
					return false;
				} else {
					$.ajax({
						type:"post",
						data:{"id" : id,
							"password" : password,
							"nickname" : nickname,
							"email" : email
							},
						url:"/users/access.do",
						dataType:"json",
						success:function(data) {
							alert(data.msg);
							location.href="/";
						}, error:function() {
							alert("エラーが発生しました。再度お試しください");
						}
					})
				}
			})
			
		}); //jquery end
	</script>
<%@ include file="/footer.jsp" %>
