<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>LOGIN</title>
	
	 <script>
        function LoginBlankCheck() {

            var fr = document.getElementById("login_form");

            if (fr.id.value.length < 1) {
                fr.id.focus();
                alert("아이디를 입력하세요.");
                return false;
            }

            if (fr.password.value.length < 1) {
                fr.password.focus();
                alert("패스워드를 입력하세요.");
                return false;
            }

            else {
                fr.submit();
            }
        }
    </script>
	
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
<img src =close.JPG width=50/>
<h1>login</h1>
    <form id="login_form" onsubmit="return LoginBlankCheck()" action="loginProcess.jsp" method="post">
        <p>
            <table border="0">
               <tr><%Integer count = (Integer)application.getAttribute("count"); // count 이름 값의 속성을 얻어온다.
               Integer newCount = null;
               if (count == null) {
                  application.setAttribute("count", 1); // application 속성으로 count값을 관리
               } else {
                   newCount = count + 1;
                    application.setAttribute("count", newCount); // application 속성으로 count값을 관리
               }
               %>
            방문자수 : <%= application.getAttribute("count") %>명
            </tr><br />
               <tr><br></tr>
                <tr>
                    <td>ID:</td>
                    <td><input type="text" name="id" id="user" size="10" /><br></td>
                </tr>
                <tr>
                    <td>PASSWORD:</td>
                    <td><input type="password" name="password" id="user" size="11"/><br></td>
                </tr>
                <tr><td><br></td></tr>
                <tr>
                    <td colspan=2><input type="submit" value="로그인" /></td>
                </tr>
            </table>
    </form>
    
    
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