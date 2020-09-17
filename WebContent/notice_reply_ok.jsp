<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date" %>
<%
	request.setCharacterEncoding("utf-8");

	Class.forName("com.mysql.jdbc.Driver"); 

	String url = "jdbc:mysql://203.252.195.138:3306/sissdb?useSSL=false";        
	String id = "siss";                                       
	String pass = "siss404b";

	String name = request.getParameter("name");
	String title = request.getParameter("title");
	String memo = request.getParameter("memo");
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	Date regDate = new Date();
	
	try {
		int ref = 0;
		int indent = 0;
		int step = 0;

		Connection conn = DriverManager.getConnection(url,id,pass);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT REF, INDENT, STEP FROM notice_board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()) {
			ref = rs.getInt(1);
			indent = rs.getInt(2);
			step = rs.getInt(3);
		}
		
		sql = "UPDATE notice_board SET STEP=STEP+1 where REF="+ref+" and STEP>" +step;
		stmt.executeUpdate(sql);
		
		sql = "INSERT INTO notice_board(USERNAME, TITLE, MEMO, TIME, REF, INDENT, STEP) "+
				"values(?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, name);
		pstmt.setString(2, title);
		pstmt.setString(3, memo);
		pstmt.setDate(4, new java.sql.Date(regDate.getTime()));
		pstmt.setInt(5, ref);
		pstmt.setInt(6, indent+1);
		pstmt.setInt(7, step+1);
		
		pstmt.execute(); 
		rs.close();
		stmt.close();
		pstmt.close();
		conn.close();
		
	}catch(Exception e) {
		
	}
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="notice_list.jsp";
  </script>