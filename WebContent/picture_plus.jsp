<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, 
com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.io.File" %>
<html>
<head>
<title>사진</title>
</head>
<body onresize="parent.resizeTo(500,500) onload=parent.resizeTo(500,500)">
<%
	request.setCharacterEncoding("utf-8");
	
	Connection conn = null;		
	PreparedStatement pstmt = null;
	
	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
	String dbuser = "siss";                                       
	String dbpass = "siss404b"; 
	
	String fileName=request.getParameter("thumb");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");            
		conn=DriverManager.getConnection(url,dbuser,dbpass);
		%>
		
		<center>
		<table width="600">
			<tr><td align="center"><a href="javascript:window.opener='Self';
			window.open('','_parent','');
			self.close();">
			<img src="./<%=fileName%>" width=500/></a></td></tr>
		</table>
		</center>

	<%
	}catch(SQLException ex){
		out.println("에러: "+ex);		
	}finally{
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
		if(conn != null) try{conn.close();}catch(SQLException sqle){}   
	}		
	%>
</body>
</html>
