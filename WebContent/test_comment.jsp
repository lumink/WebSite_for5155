<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>    
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
                    
<!DOCTYPE html>
<html>
<head>
<title>댓글 작성</title>
<style>
</style>
</head>
<body>
	<center>
		<h1>공지사항</h1>
		<p>댓글을 작성해 주세요.</p>
	</center>
	<hr width="930px" />
	<br>
<body>

			<%
			String name = null;
			String masterID = (String)session.getAttribute("MasterLoginID");
			if(masterID != null){
				 name = masterID;
			}
			else{
				 name = (String)session.getAttribute("ID");
			}
			
		Connection conn = null;                                        
		PreparedStatement pstmt = null;
		try{
			String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
			String dbuser = "siss";                                       
			String dbpass = "siss404b";                                
			Class.forName("com.mysql.jdbc.Driver");                  
			conn=DriverManager.getConnection(url,dbuser,dbpass);   
			request.setCharacterEncoding("utf-8");
			
			int textnum = Integer.parseInt(request.getParameter("idx"));
			String content = request.getParameter("comment");
			
			Date regDate = new Date();
			
			DecimalFormat df = new DecimalFormat("00");
			
			String sql3 = "alter table comment auto_increment=1";
			pstmt = conn.prepareStatement(sql3);
			pstmt.executeUpdate(sql3);
			
			String sql = "insert into comment(name, content, textnum, date) values(?, ?, ?, ?)";
			//num++;
			pstmt = conn.prepareStatement(sql);                 
			pstmt.setString(1,name);
			pstmt.setString(2,content);
            pstmt.setInt(3,textnum);
            pstmt.setDate(4,new java.sql.Date(regDate.getTime()));
			pstmt.executeUpdate();         
			%>
			<script language=javascript>
				self.window.alert("댓글 등록 완료");
				location.href="test_view.jsp?idx=<%=textnum%>";
			</script>
	<% 
		}catch(Exception e){                                    
			e.printStackTrace();
			out.println(" 테이블에 새로운 레코드 추가에 실패했습니다."+e);
		}finally{                                               
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}    
			if(conn != null) try{conn.close();}catch(SQLException sqle){}      
		}		
	%>
</body>
</html>