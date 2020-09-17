<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>활동 내역</title>
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
<br><br><br><br>


<h3>KUSISWALL(KUICS_고려대 + SISS_숙명여대 + ICEWALL_한양대) 세미나</h3>
<br>
<br>
<table width="700px">
<tr>
	<td style='line-height:200%'>연 2회 연합 보안세미나 및 MT를 통한 학술적 교류와 친목형성
	</td>
</tr>
</table>
		<br><br><br>

<h3>Inc0gnito</h3>
<br>
<br>
<table width="700px">
<tr>
	<td style='line-height:200%'>컴퓨터 보안 기술 동향, 동아리 연구성 등의 정보공유를 목적으로, 연 1회 2박 3일간 열리는 정보보호 기술 컨퍼런스
    10개 대학(고려대, 숙명여대, 성균관대, 한양대 등) 보안동아리 연합이 직접 주최하여 CTF, 세미나, 트레이닝 등을 준비
	</td>
</tr>
</table>
		<br><br><br>
		
<h3>KUCIS(Korea University Clubs Information Security)</h3>
<br>
<br>
<table width="700px">
<tr>
	<td style='line-height:200%'>전국 대학 정보보호 연합회<br>
    한국 인터넷 진흥원(KISA)에서 후원  <br> 
    전국 40여개의 대학 (고려대, 숙명여대, 서울여대, 한양대 ,서울과기대 등) 이 가입<br>
    각 권역별 세미나 참여<br>
    동아리간 정보공유를 위한 하계 워크숍 참여
	</td>
</tr>
</table>
		<br><br><br>
		
<h3>Power of XX</h3>
<br>
<br>
<table width="700px">
<tr>
	<td style='line-height:200%'>국제 정보보안 컨퍼런스 POC의 부대행사로써
    SISS와 해커스쿨이 주최하는 여성해킹대회
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