<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>MemberSignUp</title>

    <script>

        function idCheck() {

            var fr = document.getElementById("my_form");

            if (fr.id.value.length < 4) {

                alert("ID는 4글자이상 입력하세요.");
                fr.id.value = "";
                fr.id.focus();

            }

        }


        function passCheck() {

            var fr = document.getElementById("my_form");
            var val1 = fr.password.value;
            var val2 = fr.passwordOk.value;

            if (val1 != val2) {

                alert("password가 일치하지 않습니다.");
                fr.passwordOk.value = "";
                fr.password.value = "";
                fr.password.focus();

            }

        }


        function nameCheck() {

            var fr = document.getElementById("my_form");

            if (fr.name.value.length < 1) {
                fr.name.focus();
                return false;
            }

            else {
                fr.submit();
            }

        }
        
        function overlap() {
        	var fr = document.getElementById("my_form");
        	var id = fr.id.value;
            window.open("idConfirm.jsp?id="+id,"","width=100 height=100");
      }

    </script>
</head>

<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
	<center>
    <h2>회원 가입</h2>
    <hr />

    <form id="my_form" action="register.jsp" onsubmit="return nameCheck()">
        <p>
            <table border="1">
                <tr>
                    <td>* 이름</td>
                    <td><input type="text" name="name" required /></td>
                </tr>
                <tr>
                    <td>* 아이디</td>
                    <td>
                        <input type="text" name="id" id="id" onblur="idCheck()" required/> <input type="button" value="중복확인" onclick="overlap()" />
                    </td>
                </tr>
                <tr>
                    <td>* 비밀번호</td>
                    <td><input type="password" name="password" id="password" required /></td>
                </tr>
                <tr>
                    <td>* 비밀번호 확인</td>
                    <td><input type="password" name="passwordOK" id="passwordOk" onblur="passCheck()" required /></td>
                </tr>
                <tr>
                    <td>* 학번</td>
                    <td><input type="text" name="studentID" placeholder="ex)1615234" required /></td>
                </tr>
                <tr>
                    <td>* 생년월일</td>
                    <td>
                        <input type="text" name="year" size="4" required />년 <input type="text" name="month" size="2" required />월 <input type="text" name="day" size="2" required />일
                    </td>
                </tr>
                <tr>
                    <td>* 핸드폰 번호</td>
                    <td>
                        <select name="tel1" required>
                            <option value=''>선택</option>
                            <option value="010">010</option>
                            <option value="011">011</option>
                        </select>
                        - <input type="text" name="tel2" size="4" required /> - <input type="text" name="tel3" size="4" required />
                    </td>
                </tr>
                <tr>
                    <td>* 이메일</td>
                    <td>
                        <input type="text" name="email" size="6"  required/>@
                        <select name="domain" required>
                            <option value=''>선택</option>
                            <option value="@naver.com">naver.com</option>
                            <option value="@hotmail.com">hotmail.com</option>
                            <option value="@hanmail.net">hanmail.net</option>
                            <option value="@yahoo.co.kr">yahoo.co.kr</option>
                            <option value="@paran.com">paran.com</option>
                            <option value="@nate.com">nate.com</option>
                            <option value="@empal.com">empal.com</option>
                            <option value="@dreamwiz.com">dreamwiz.com</option>
                            <option value="@hanafos.com">hanafos.com</option>
                            <option value="@korea.com">korea.com</option>
                            <option value="@chol.com">chol.com</option>
                            <option value="@gmail.com">gmail.com</option>
                            <option value="@lycos.co.kr">lycos.co.kr</option>
                            <option value="@netian.com">netian.com</option>
                            <option value="@hanmir.com">hanmir.com</option>
                            <option value="@sayclub.com">sayclub.com</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>관심 해킹 분야</td>
                    <td>
                        <input type="checkbox" name="interest" value="web hacking" />web hacking
                        <input type="checkbox" name="interest" value="system hacking" />system hacking
                        <input type="checkbox" name="interest" value="network hacking" />network hacking
			<br/>
                        <input type="checkbox" name="interest" value="reversing" />reversing
                        <input type="checkbox" name="interest" value="cryptology" />cryptology
                        <input type="checkbox" name="interest" value="forensic" />forensic
						<input type="checkbox" name="interest" value="others" />others
                    </td>
                </tr>
  
                <tr>
                    <td colspan=2><input type="submit" value="등록하기" /> <input type="reset" value="취소하기" /></td>
                </tr>
            </table>
    </form>
    
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