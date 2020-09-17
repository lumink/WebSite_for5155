<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>동아리소개</title>
	<style>
	
	#footer_list > ul{overflow: hidden;}
    #footer_list > ul > li {float: left;}
    #footer_list > ul > li > a {
        display: block;
        background: lightgray;
        color: gray;
        padding: 2px 60px;
        border: 1px solid lightgray;
    }	
    
    #section {
        width: 1100px;
        float: center;
    }
    
    
	
	</style>
</head>
<body>
	<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
<center id ="section">
<img src =warning.png width=100/>
<h1>warning!</h1>
<br>
<br>
<table width="700px" bordercolor="gray" class="type05">
		<tr>
			<td align="center" colspan="2" style='line-height:200%'  >
				비회원 접근 불가
			</td>
		</tr>
</table>
<br>
	<input type="button" value="회원 가입 바로가기" onclick="location.href='signup.jsp'">
		
	<br><br><br><br><br><br><br><br>
</center>

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