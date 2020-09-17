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
<table width="700px">
		<tr>
			<td align="left" colspan="2" style='line-height:200%'  >
			SISS( Sookmyung Information Security Study ) 숙명 정보 보안 동아리로서,
			이제는 사회적 문화의 하나로 자리잡은 컴퓨터와 그 컴퓨터들간의 network 사이의 방대한 정보
			의 흐름, 보안에 대해 사회적 중요성을 인식하고 2001년 12월 15일 설립되었습니다. SISS는
			정보 보안을 공부하는 모임으로, 네트워크, 시스템, 어플리케이션보안 및 암호학 등의 보안 분
			야를 공부합니다.2006년부터 한국정보보호진흥원(KISA)에서 주관한 대학 정보보호 동아리 지
			원사업에 지원사업 대상 동아리로 선정되어온 활동성 있는 동아리입니다.
			</td>
		</tr>
</table>
		<br><br>

		<p>지도교수 :컴퓨터과학전공 이광수교수</p>
		<br>
		<p>연구실 :명신관 404b호</p>
		
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