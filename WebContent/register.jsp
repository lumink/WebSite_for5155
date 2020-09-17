<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>가입 처리</title></head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
	<center>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
	String dbuser = "siss";                                       
	String dbpass = "siss404b"; 
	
	String formId = request.getParameter("id");
	String formName = request.getParameter("name");
	String formPass = request.getParameter("password");
	String email = request.getParameter("email");
	String domain = request.getParameter("domain");
	String formStudentID = request.getParameter("studentID");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String tel1 = request.getParameter("tel1");
	String tel2 = request.getParameter("tel2");
	String tel3 = request.getParameter("tel3");
	String formFavorite=null;
	
	
	String[] chkbox = request.getParameterValues("interest");
	for( int i = 0; i < chkbox.length; i++ )
	{
		if(i == 0)
			formFavorite = chkbox[0];
		else
		formFavorite += ","+chkbox[i];
	}
	
	
	String formEmail = email+domain;
    String formTel = tel1+tel2+tel3;
    String formBirth = year+month+day;
	
	Date regDate = new Date();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "INSERT INTO member(id,name,password,email,registerDate,studentID,birth,tel,favorite) values(?, ?, ?, ?, ?, ?, ?, ?, ?)";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, formId);
		pstmt.setString(2, formName);
		pstmt.setString(3, formPass);
		pstmt.setString(4, formEmail);
		pstmt.setDate(5, new java.sql.Date(regDate.getTime()));
		pstmt.setString(6, formStudentID);
		pstmt.setString(7, formBirth);
		pstmt.setString(8, formTel);
		pstmt.setString(9, formFavorite);
		pstmt.executeUpdate();
		%>
		회원 가입 처리 완료 <br/>
		<table width="400" border="1">
			<tr><td>ID</td><td><%=formId %></td></tr>
			<tr><td>이름</td><td><%=formName %></td></tr>
			<tr><td>이메일</td><td><%=formEmail %></td></tr>
			<tr><td>가입일시</td><td><%=regDate %></td></tr>
			<tr><td>학번</td><td><%=formStudentID %></td></tr>
			<tr><td>생년월일</td><td><%=formBirth %></td></tr>
			<tr><td>전화번호</td><td><%=tel1 %>-<%=tel2 %>-<%=tel3 %></td></tr>
			<tr><td>관심분야</td><td><%=formFavorite %></td></tr>
		</table>
		<a href="mainsection.jsp" > 메인홈페이지로 돌아가기</a>
		</center>
		<%
		
	}catch(SQLException ex){
		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
%>

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
