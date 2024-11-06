<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>JPAT</title>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="/js/jquery-3.7.1.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
	<link href="/css/common.css" rel="stylesheet">
  	<link href="/css/font-awesome.min.css" rel="stylesheet"> 
  	<link href="/css/font-awesome.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
	<link href="/css/mystyle.css" rel="stylesheet">
	
    <!--[if lt IE 9]>
      <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <header id = "header">
    	<div class = "header-index">
    		<div class = "container">
    			<div class = "row">
    				<div class = "col-md-3">
    					<div class="logo">
    						<a href="/"><img src="/images/JPAT.png" alt=""></a>
    					</div>
    				</div>
    				
    				<div class = "col-md-6 site-search text-center">
    					<form class="navbar-form" role="search" name="site-search" method="get" action="/posts/list.do" onsubmit="return check();">
    					<input type="hidden" name="pageNum" id="pageNum" value="1">
    						<div class="search-bar">
						      <select name="type" class="search-option" id="type" onchange="updateAction(this)">
						        	<option value=""></option>
						        	<option value="title" ${page.cri.type.equals('title')?'selected':'' }>タイトル</option>
						        	<option value="singer" ${page.cri.type.equals('singer')?'selected':'' }>歌手</option>
						        	<option value="music" ${page.cri.type.equals('music')?'selected':'' }>曲名</option>
						        </select>
						      <input type="text" class="form-control" name="keyword" id="keyword" value="${page.cri.keyword}">
						    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
						    </div><!-- /input-group -->
						</form>
    				</div>
    				<div class = "col-md-3 member text-right">
    					<c:if test="${empty user}">
	    					<a href="/users/login.do" class = "login"><span class="material-symbols-outlined">login</span></a>
	    					<a href="/users/signup.do" class = "signup"><span class="material-symbols-outlined">person_add</span></a>
    					</c:if>
    					<c:if test="${not empty user }">
    						<a href="/users/logout.do" class = "login"><span class="material-symbols-outlined">logout</span></a>
	    					<a href="/users/myPageTerms.do" class = "signup"><span class="material-symbols-outlined">contact_page</span></a>
    					</c:if>
    				</div>
    			</div>
    		</div>
    	</div> <!-- header top end-->
    	
    	<!-- header nav start -->
    	<div class = "container">
    		<nav class="navbar navbar-default">
			  <div class="container" style="margin:10px 0;">
			    <!-- Brand and toggle get grouped for better mobile display -->
			    <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
			    </div>
			
			    <!-- Collect the nav links, forms, and other content for toggling -->
			    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="float: left; justify-content: flex-start;">
			      <ul class="nav navbar-nav">
			        <li><a href="/posts/list.do?pageNum=1">新着 <span class="sr-only">(current)</span></a></li>
			        <li><a href="/posts/best.do">人気</a></li>
			        <li><a href="/posts/suggest.do">お勧め</a></li>
			        <li><a href="/posts/singer.do">歌手</a></li>
			      </ul>
			    </div><!-- /.navbar-collapse -->
			  </div><!-- /.container-fluid -->
			</nav>
    	</div> <!-- header nav end -->
    </header> <!-- header end -->
    
    <script>
    	function check() {
    		
    		let form = document.querySelector('form[name="site-search"]');
    		
    		if($("#type").val() == "") {
    			alert("タイプ入力");
    			$("#type").focus();
    			return false;
    		}
    		if($("#keyword").val() == "") {
    			alert("キーワード入力");
    			$("#keyword").focus();
    			return false;
    		}
    		
    		if ($("#type").val() === "singer" || $("#type").val() === "music") {
    	        form.action = "/posts/suggest.do";
    	    } else {
    	        form.action = "/posts/list.do";
    	    }
    		
    		return true;
    		
    	}
    </script>
    