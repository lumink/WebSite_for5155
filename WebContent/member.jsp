<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>

<%
String UserID = (String)session.getAttribute("ID");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>mypage</title>
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
<img src =close2.JPG width=50/>
<h1>MYPAGE<h1>
<br>
   			<p><a href="updateForm.jsp?id=<%=UserID%>" style='font-family:Nanum Gothic; font-size:13pt;'>회원 정보 수정</a></p><br/>
   			<p><a href ="memberDelete.jsp?id=<%=UserID%>"style='font-family:Nanum Gothic; font-size:13pt;'>회원 정보 삭제</a></p>

<br><br><br><br><br>
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