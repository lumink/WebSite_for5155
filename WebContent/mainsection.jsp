<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="main.css">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript" src="main.js"></script>
<style>
   /* 콘텐츠 */
	#main_section {
        width: 1100px;
        float: center;
    }
 #footer{
	position: relative;
	top:100px;
 }
 
    #footer_list > ul{overflow: hidden;}
    #footer_list > ul > li {float: left;}
    #footer_list > ul > li > a {
    position:relative;
        display: block;
        background: lightgray;
        color: gray;
        padding: 2px 60px;
        border: 1px solid lightgray;
    }	
</style>
</head>
<body>

	<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	<div>
	
	<center id="main_section">
			
	<div class="slide">
	<ul class="slide_ul">
	<li><a href="#"><img src="heartbleed.jpg" alt="dane"></a></li>
	<li><a href="#"><img src="poodle.jpeg" alt="dane"></a></li>
	<li><a href="#"><img src="web.jpg" alt="dane"></a></li>
	</ul>
	</div>
	
	</center>
	
	
	
	<br><br><br>
	<footer id="footer">
        <nav id="footer_list">
            <ul>
                <li><font size="2" color="gray">
                Copyright (c) SISS-Corporation. All Rights Reserved.</font></li>	
            </ul>
        </nav>
    </footer>

</body>
</html>