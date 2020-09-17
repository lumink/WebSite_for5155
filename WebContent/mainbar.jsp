<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>SISS</title>
	<style>
		    /* 초기화 */
    * {margin: 0; padding: 0}
    body { font-family: 'Times New Roman', serif; }
    li {list-style: none;}
    a {text-decoration: none;}
   	a : link{color : black;}
    img {border: 0;}


    @font-face {
    font-family: 'Nanum Gothic';
    font-style: normal;
    font-weight: 400;
    src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot);
    src: url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.eot?#iefix) format('embedded-opentype'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff2) format('woff2'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.woff) format('woff'),
       url(//fonts.gstatic.com/ea/nanumgothic/v5/NanumGothic-Regular.ttf) format('truetype');
    }
    body, td, a, select, input, div, form, textarea, center, option, pre, p, blockquote, br {font-family:Nanum Gothic; font-        size:5pt; color:000;}    
	

    /* 헤더 */
    #main_header {
      
			/* 중앙 정렬*/
           margin: 10px auto;
           width: 1100px;
			
            /* 절대 좌표 */
            height: 300px;
            float : top;
            left : 1px;
    }

    #main_header > #title {
    	position : absolute;
        left: 50px; top: 10px;

    }

    /* 타이틀 */
	
    /* 메뉴(1) */
    #log_lnb > ul { 
    	position : absolute;
    	overflow: hidden; 
        left: 800px; top: 20px;}
    #log_lnb > ul > li { float: right; }
    #log_lnb > ul > li > a {
        display: block;
        padding: 20px 10px;
        background: white;
        text-decoration : none; 
        color : gray;
    }

	/* 메뉴(2) */     
    #main_lnb > ul { 
    	position : absolute;
    	overflow: hidden; 
    	left: 70px; top: 130px;}
	#main_lnb > ul > li { float: left; }
   	#main_lnb > ul > li > a {
        display: block;
        padding: 4px 15px;
        background: white;
        border-bottom: 1px solid gray;
        text-decoration : none;
        color : black;
   	}
   	.list{
   		text-align: center;
   		display: block;
        padding: 8px 3px;
        background: white;
        text-decoration : none;
        color : gray;
   	}
	</style>
	
	<script>
	var i=0;
	var j=0;

	function guideClick(){
		

		var list1= document.getElementById("list1");
		var list2= document.getElementById("list2");
		var list3= document.getElementById("list3");

		if(i==0){
		list1.innerHTML = "동아리소개";
		list2.innerHTML = "활동 내역";
		list3.innerHTML = "조직 구성도";

		i=1;
		}
		else{
		list1.innerHTML = "";
		list2.innerHTML = "";
		list3.innerHTML = "";

		i=0;
	}
}


		
	
	</script>
</head>
<body>
<form id="form">
	<header id="main_header">
		<hgroup id="title">
		<a href="mainsection.jsp">
			<img src="SISS.png" />
			</a>
		</hgroup>
		<nav id="log_lnb">
			<ul>
			<%
			String loginid = (String)session.getAttribute("ID");
			boolean isLogin = false;
			if(loginid!=null){
			isLogin = true;
			}%>
			<% if(isLogin){ %>
			<li><a href="logout.jsp">로그아웃</a></li>
			<li><a href="member.jsp">마이페이지</a></li>
			<% } %>
			<% String masterID = (String)session.getAttribute("MasterLoginID");%>
			<% if(masterID != null){ %>
				<li><a href="logout.jsp">로그아웃</a></li>
				<li><a href="memberlist.jsp">회원관리</a></li>
			<% } %>
			<% if(!isLogin&&masterID == null){ %>
				<li><a href="index.jsp">로그인</a></li>
				<li><a href="signup.jsp">회원가입</a></li>
			<% } %>
			</ul>
		</nav>	
		<nav id="main_lnb">
			<ul>
				<li><a href="#" onclick="guideClick()">동아리 안내</a>
					<ul>
					<li><a href="introduce.jsp" id="list1" class="list"> </a> </li>
					<li><a href="activity.jsp" id="list2" class="list"> </a></li>
					<li><a href="organization.jsp" id="list3" class="list"> </a></li>
					</ul>
				</li>
				<% if(!isLogin&&masterID == null){ %>
					<li><a href="warning.jsp">공지사항</a></li>
				<% }else{%>
				<li><a href="notice_list.jsp">공지사항</a></li>
				<%} %>
				
				<% if(!isLogin&&masterID == null){ %>
					<li><a href="warning.jsp">활동사진</a></li>
				<% }else{%>
				<li><a href="picture_form.jsp">활동사진</a></li>
				<%} %>
				
				<% if(!isLogin&&masterID == null){ %>
					<li><a href="warning.jsp">발표 게시판</a></li>
				<% }else{%>
				<li>
				<a href="test_list.jsp">발표 게시판</a>
				</li>
				<%} %>
				
				
			</ul>
		</nav>
	</header>
</form>
</body>
</html>