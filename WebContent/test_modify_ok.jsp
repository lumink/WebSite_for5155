<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>  
<%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			
<%

Class.forName("com.mysql.jdbc.Driver"); 

String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
String id = "siss";                                       
String pass = "siss404b";

	String password = "";
	
		try{
			
			request.setCharacterEncoding("UTF-8");
			int idx = Integer.parseInt(request.getParameter("idx"));
			String title = request.getParameter("title");
			String memo = request.getParameter("memo");
			String passw = request.getParameter("password");
		
			Date regDate = new Date();
			
			Connection conn = DriverManager.getConnection(url,id,pass);
			Statement stmt = conn.createStatement();
		
			String sql = "SELECT PASSWORD FROM board1 WHERE NUM=" + idx;
			ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				password = rs.getString(1);
		 }
		
		 if(password.equals(passw)) {
				sql = "UPDATE board1 SET TITLE='" + title+ "' ,MEMO='"+ memo +"', TIME='" + new java.sql.Date(regDate.getTime()) +"' WHERE NUM=" + idx;				
				stmt.executeUpdate(sql);
				
%>
				  <script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
				  	location.href="test_view.jsp?idx=<%=idx%>";
				  </script>
<%

			rs.close();
			stmt.close();
			conn.close();
			
		} else {
%>
			<script language=javascript>
				self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%			
		}
		 
 } catch(SQLException e) {
	out.println( e.toString() );
} 

%>