<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import="java.util.Date" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>댓글 삭제</title>
<style>
</style>
</head>
<body>
	
	<jsp:include page="mainbar.jsp" flush="false" />

	<hr width="930px" />
	<br>
<%
		Connection conn = null;                     
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		try{
			String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
			String dbuser = "siss";                                       
			String dbpass = "siss404b";   
			Class.forName("com.mysql.jdbc.Driver");            
			conn=DriverManager.getConnection(url,dbuser,dbpass);
			int idx = Integer.parseInt(request.getParameter("textnum"));
			
			
			String sql = "delete from notice_comment where textnum =" + idx;
			pstmt = conn.prepareStatement(sql);                
			pstmt.executeUpdate(sql);
			
			String sql2 = "update notice_comment set textnum = textnum-1 where textnum>"+idx;
			pstmt = conn.prepareStatement(sql2);
			pstmt.executeUpdate(sql2);
			
			String sql3 = "alter table notice_comment auto_increment=1";
			pstmt = conn.prepareStatement(sql3);
			pstmt.executeUpdate(sql3);
			
	%>
	<script language=javascript>
   				self.window.alert("댓글을 삭제하였습니다.");
   				location.href="notice_view.jsp?idx=<%=idx%>";
  			</script>
	<center>
		<%
		rs.close();
		pstmt.close();
		conn.close();
		}catch(Exception e){                               
			e.printStackTrace();
			out.println("");
		}finally{                                       
			if(rs != null) try{rs.close();}catch(SQLException sqle){}    
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){} 
			if(conn != null) try{conn.close();}catch(SQLException sqle){}   
		}
		%>
		
	</body>
</html>