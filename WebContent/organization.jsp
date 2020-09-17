<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>조직 구성도</title>
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
        float: center;
        width : 1100px;
    }
    
    
	
	</style>
</head>
<body>
	<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
<center id ="section">
<img src =open.JPG width=50/>
<h1>SISS</h1>
<br>
<br><br><br>
<h3>2016 회원 명단</h3><br>
<table width="700px">
		<tr>
			<td align="center" colspan="2" style='line-height:200%'  >
			회장 정혜원<br>
			부회장 김민주 학술부장 이경민 <br><br>
			14 <br>
			나경애 박하은 서혜림 안진일 <br><br>
			15 <br>
			강미선 곽혜빈 김지효 박정우 이연주 이정현 이지혜 이지호 지윤희 하수미<br><br>
			16 <br>
			김예린 김진주 박아영 손예진 신예진 이승연 정성은 정은진 조수영 현재정<br><br>
			</td>
		</tr>
</table>
		
	<br><br><br><br><br><br><br>
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