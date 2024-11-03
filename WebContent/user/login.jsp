<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>
    
    <!-- contents start -->
    <div class = "container">
    	<div class = "row">
    		<div class = "col-md-2"></div>
    		<div class = "col-md-8">
    			<h3 class = "text-center">ログイン</h3>
    			
				  <div class="form-group">
				    <label for="inputEmail3" class="col-sm-2 control-label">ID</label>
				    <div class="col-sm-10">
				      <input type="text" class="form-control" name="id" id="id" placeholder="ID">
				      <p id="idMsg"></p>
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
				    <div class="col-sm-10">
				      <input type="password" class="form-control" name="password" id="password" placeholder="Password">
				      <p id="passwordMsg"></p>
				    </div>
				  </div>
				  <div class="form-group text-center">
				    <div class="text-center">
				      <button type="submit" id="submit" class="btn btn-default">ログイン</button>
				      <button type="button" class="btn btn-default" onclick="location.href='/users/signup.do';">新規登録</button>
				    </div>
				  </div>
				
    		</div>
    		<div class = "col-md-2"></div>
		</div>
	</div> <!-- contents end -->
	<script>
		$(function() {
			
			$("#submit").on("click", function() {
				if(!$("#id").val()) {
					$("#idMsg").html("<span style='color:#f00;'>ID入力</span>");
					$("#id").focus();
					return;
				}
				
				if(!$("#password").val()) {
					$("#passwordMsg").html("<span style='color:#f00;'>PASSWORD入力</span>");
					$("#password").focus();
					return;
				}
				
				$.ajax({
					type:'post',
					url:'/users/loginpro.do',
					data:{'id':$("#id").val(),
						'password':$("#password").val()				
						},
					dataType:'json',
					success:function(data) {
						if(data.result == "success") {
							alert("ログインしました");
							location.href="/";
						} else if(data.result == "no") {
							alert("ご確認ください");
							return;
						}
					}
				})
			})
		});
	</script>
<%@ include file="/footer.jsp" %>
