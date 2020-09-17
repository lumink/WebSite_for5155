<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>회원정보 수정 폼</title></head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
	
<%

String id = request.getParameter("id");
String password = null;
String name = null;
String email = null;
String stuid =null;
String birth = null;
String tel = null;
String favorite = null;

int i=0;

Connection conn = null;		
Statement stmt = null;
String strSQL= null;
ResultSet rs;
	
String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
String dbuser = "siss";                                       
String dbpass = "siss404b";

Class.forName("com.mysql.jdbc.Driver");            
conn=DriverManager.getConnection(url,dbuser,dbpass);

// Statement 생성
stmt = conn.createStatement();


strSQL = "SELECT * FROM member";
rs = stmt.executeQuery(strSQL);

for(i=1; rs.next();i++)
{

if(id.equals(rs.getString("id"))){
	password = rs.getString("password");
	name = rs.getString("name");
	email = rs.getString("email");
	birth = rs.getString("birth");
	stuid = rs.getString("studentID");
	tel = rs.getString("tel");
	favorite = rs.getString("favorite");
}

}
%>
<center>
<form action="memberUpdate.jsp" method="post">
<table border="1" align="center">
<tr>
  <td>ID</td>
  <td><input type="text" name="id" size="15" value = <%=id %> readonly ="readonly"></td>
  <td>비밀번호</td>
  <td><input type="password" name="password" size="15" value = <%=password %>></td>
</tr>
<tr>
  <td>이름</td>
  <td><input type="text" name="name" size="15" value= <%=name %>></td>
  <td>학번</td>
  <td><input type="text" name="stuid" size="15" value= <%=stuid %> ></td>
</tr>
<tr>
<td>이메일</td>
<td><input type="text" name="email" size="15" value= <%=email %>></td>
</tr>

<tr>
  <td>생년월일</td>
  <td><input type="text" name="birth" size="15" value= <%=birth %> ></td>
   <td>전화번호</td>
  <td><input type="text" name="tel" size="15" value= <%=tel%> ></td>
</tr>

<tr>
  <td>관심 해킹 분야</td>
  <td colspan="3">
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
  <td colspan="4" align="center">
  <input type="submit" value="수정">
  </td>
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