<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
			
<%
	request.setCharacterEncoding("utf-8");

Class.forName("com.mysql.jdbc.Driver"); 

String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
String id = "siss";                                       
String pass = "siss404b";

	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try{
				
		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "DELETE FROM notice_board WHERE NUM=" + idx;
		stmt.executeUpdate(sql);	 
%>
  			<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="notice_list.jsp";
  			</script>

<%
		stmt.close();
		conn.close();
		
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>