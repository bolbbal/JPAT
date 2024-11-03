<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/header.jsp" %>

	<div class="container">
	    <h3>サイト紹介</h3>
	    <p>このサイトは、誰でも新規登録なしで好きなJ-POPアーティストの歌を推薦したり、他の人からの推薦を受けたりできるサイトです。<br>
	    歌の推薦だけでなく、話したいことも自由に共有できる場所として作られています。<br>
	    現在、全体掲示板、人気掲示板、推薦掲示板、アーティスト掲示板を設置しています。</p>
	    <h3>主なサービス</h3>
	    <button type="button" class="about-collapsible" id="post-list">全体掲示板</button>
		<div class="about-content">
		  <p>これまでに投稿されたすべての投稿を見ることができます。</p>
		</div>
		<button type="button" class="about-collapsible" id="popular-list">人気掲示板</button>
		<div class="about-content">
		  <p>これまでに投稿されたすべての投稿のうち、推薦数が5以上で多くの人に好評な投稿のみを見ることができます。</p>
		</div><button type="button" class="about-collapsible" id="suggest-list">推薦掲示板</button>
		<div class="about-content">
		  <p>れまでに投稿されたすべての投稿のうち、歌を推薦した投稿のみを見ることができます。</p>
		</div><button type="button" class="about-collapsible " id="singer-list">歌手掲示板</button>
		<div class="about-content">
		  <p>これまでに投稿されたすべての投稿の中で、どのアーティストが何回推薦されたかを見ることができます。</p>
		</div>
		<br>
	</div>
	<div class="container"><p></p></div>
	<script>
	var coll = document.getElementsByClassName("about-collapsible");
	var i;

	for (i = 0; i < coll.length; i++) {
	  coll[i].addEventListener("click", function() {
	    this.classList.toggle("about-active");
	    var content = this.nextElementSibling;
	    if (content.style.display === "block") {
	      content.style.display = "none";
	    } else {
	      content.style.display = "block";
	    }
	  });
	}
	</script>

<%@ include file="/footer.jsp" %>