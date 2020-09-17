<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, 
com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.io.File" %>
<html>
<head><title>사진 올리기</title></head>
<body>
<div>
	<jsp:include page="mainbar.jsp" flush="false" />
	</div>
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
	String dbuser = "siss";                                       
	String dbpass = "siss404b"; 
	
	String savePath=application.getRealPath("/");
	int sizeLimit = 5 * 1024 * 1024 ;
	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
	File file = multi.getFile("upfile");
	String fileName=file.getName();
	
	String formtitle = multi.getParameter("type");
	Date regDate = new Date();
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		
		String sql = "INSERT INTO thumbnail(title,thumb,date) values(?, ?, ?)";        
		pstmt = conn.prepareStatement(sql); 
		pstmt.setString(1, formtitle);
		pstmt.setString(2, fileName);
		pstmt.setDate(3, new java.sql.Date(regDate.getTime()));
		pstmt.executeUpdate();
		%>
		
		처리 완료 <br/>
		<hr />
		<table width="500">
			<tr><td>제목</td><td><%=formtitle %></td></tr>
			<tr><td>사진</td><td><img src="<%=fileName%>" width=400/></td></tr>
			<tr><td>작성일시</td><td><%=regDate %></td></tr>
		</table>
		<hr />
		<a href="picture_form.jsp">활동 사진 게시판</a>
		
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
